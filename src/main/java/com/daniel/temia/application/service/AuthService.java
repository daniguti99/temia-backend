package com.daniel.temia.application.service;

import com.daniel.temia.application.dto.auth.ActualizarPerfilRequest;
import com.daniel.temia.application.dto.auth.LoginRequest;
import com.daniel.temia.application.dto.auth.LoginResponse;
import com.daniel.temia.application.dto.auth.RegisterRequest;
import com.daniel.temia.application.dto.auth.RegisterResponse;
import com.daniel.temia.application.dto.auth.UserInfo;
import com.daniel.temia.domain.exception.BadRequestException;
import com.daniel.temia.domain.exception.UnauthorizedException;
import com.daniel.temia.domain.model.Role;
import com.daniel.temia.domain.model.Usuario;
import com.daniel.temia.domain.port.in.ActualizarPerfilUseCase;
import com.daniel.temia.domain.port.in.GetCurrentUserUseCase;
import com.daniel.temia.domain.port.in.LoginUseCase;
import com.daniel.temia.domain.port.in.RegisterUseCase;
import com.daniel.temia.domain.port.out.AlmacenFotoPort;
import com.daniel.temia.domain.port.out.TokenProviderPort;
import com.daniel.temia.domain.port.out.UsuarioRepositoryPort;
import com.daniel.temia.infraestructure.adapter.out.ficheros.FotoPerfil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AuthService implements RegisterUseCase, LoginUseCase, GetCurrentUserUseCase, ActualizarPerfilUseCase {

    private final UsuarioRepositoryPort usuarioRepositoryPort;
    private final PasswordEncoder passwordEncoder;
    private final TokenProviderPort tokenProviderPort;
    private final AlmacenFotoPort almacenFotoPort;

    @Override
    @Transactional
    public RegisterResponse register(RegisterRequest request, FotoPerfil fotoPerfil) {
        if (request.getEmail() != null && request.getConfirmEmail() != null
                && !request.getEmail().equals(request.getConfirmEmail())) {
            throw new BadRequestException("Los emails no coinciden");
        }
        if (request.getPassword() != null && request.getConfirmPassword() != null
                && !request.getPassword().equals(request.getConfirmPassword())) {
            throw new BadRequestException("Las contraseñas no coinciden");
        }
        if (usuarioRepositoryPort.existePorEmail(request.getEmail())) {
            throw new BadRequestException("El email ya está registrado");
        }
        if (usuarioRepositoryPort.existePorUsername(request.getUsername())) {
            throw new BadRequestException("El nombre de usuario ya está en uso");
        }

        String fotoUrl = null;
        if (fotoPerfil != null && fotoPerfil.getContenido() != null && fotoPerfil.getContenido().length > 0) {
            fotoUrl = almacenFotoPort.subirFoto(fotoPerfil);
        }

        Usuario usuario = Usuario.builder()
                .username(request.getUsername())
                .email(request.getEmail())
                .passwordHash(passwordEncoder.encode(request.getPassword()))
                .fotoUrl(fotoUrl)
                .role(Role.USER)
                .activo(true)
                .build();

        Usuario guardado = usuarioRepositoryPort.guardar(usuario);
        String token = tokenProviderPort.generateToken(guardado);

        return RegisterResponse.builder()
                .token(token)
                .expiresIn(tokenProviderPort.getExpirationMs())
                .user(mapToUserInfo(guardado))
                .build();
    }

    @Override
    public LoginResponse login(LoginRequest request) {
        String login = request.getLogin();
        Usuario usuario = usuarioRepositoryPort.buscarPorEmail(login)
                .or(() -> usuarioRepositoryPort.buscarPorUsername(login))
                .orElseThrow(() -> new UnauthorizedException("Credenciales incorrectas"));

        if (usuario.getActivo() == null || !usuario.getActivo()) {
            throw new UnauthorizedException("Usuario desactivado");
        }
        if (!passwordEncoder.matches(request.getPassword(), usuario.getPasswordHash())) {
            throw new UnauthorizedException("Credenciales incorrectas");
        }

        String token = tokenProviderPort.generateToken(usuario);
        return LoginResponse.builder()
                .token(token)
                .expiresIn(tokenProviderPort.getExpirationMs())
                .user(mapToUserInfo(usuario))
                .build();
    }

    @Override
    public UserInfo getCurrentUser(String token) {
        if (token == null || token.isBlank()) {
            throw new UnauthorizedException("Token requerido");
        }
        Usuario usuario = tokenProviderPort.validateToken(token);
        Usuario completo = usuarioRepositoryPort.buscarPorId(usuario.getId())
                .orElseThrow(() -> new UnauthorizedException("Usuario no encontrado"));
        return mapToUserInfo(completo);
    }

    @Override
    @Transactional
    public UserInfo actualizarPerfil(Long usuarioId, ActualizarPerfilRequest request) {
        Usuario usuario = usuarioRepositoryPort.buscarPorId(usuarioId)
                .orElseThrow(() -> new UnauthorizedException("Usuario no encontrado"));

        String username = request.getUsername() == null ? "" : request.getUsername().trim();
        if (username.length() < 3 || username.length() > 50) {
            throw new BadRequestException(
                    "El nombre de usuario debe tener entre 3 y 50 caracteres");
        }
        if (!username.equalsIgnoreCase(usuario.getUsername())) {
            usuarioRepositoryPort.buscarPorUsername(username)
                    .filter(otro -> !otro.getId().equals(usuario.getId()))
                    .ifPresent(otro -> {
                        throw new BadRequestException("El nombre de usuario ya está en uso");
                    });
        }
        usuario.setUsername(username);

        actualizarPassword(usuario, request);

        Usuario guardado = usuarioRepositoryPort.guardar(usuario);
        return mapToUserInfo(guardado);
    }

    /**
     * Cambia la contraseña solo cuando el usuario rellena algún campo de la sección.
     * Los campos en blanco significan «no quiero cambiar la contraseña».
     */
    private void actualizarPassword(Usuario usuario, ActualizarPerfilRequest request) {
        String actual = textoPlano(request.getCurrentPassword());
        String nueva = textoPlano(request.getNewPassword());
        String confirmacion = textoPlano(request.getConfirmPassword());

        if (actual.isEmpty() && nueva.isEmpty() && confirmacion.isEmpty()) {
            return;
        }
        if (actual.isEmpty()) {
            throw new BadRequestException("Rellene la contraseña actual");
        }
        if (nueva.isEmpty()) {
            throw new BadRequestException("Rellene la contraseña nueva");
        }
        if (nueva.length() < 8) {
            throw new BadRequestException(
                    "La contraseña nueva debe tener al menos 8 caracteres");
        }
        if (!nueva.equals(confirmacion)) {
            throw new BadRequestException("Las contraseñas no coinciden");
        }
        if (!passwordEncoder.matches(actual, usuario.getPasswordHash())) {
            throw new BadRequestException("La contraseña actual no es correcta");
        }
        usuario.setPasswordHash(passwordEncoder.encode(nueva));
    }

    private String textoPlano(String valor) {
        return valor == null ? "" : valor;
    }

    private UserInfo mapToUserInfo(Usuario usuario) {
        return UserInfo.builder()
                .id(usuario.getId())
                .username(usuario.getUsername())
                .email(usuario.getEmail())
                .photo(usuario.getFotoUrl())
                .role(usuario.getRole())
                .build();
    }
}
