package com.daniel.temia.infraestructure.adapter.in.rest;

import com.daniel.temia.application.dto.auth.ActualizarPerfilRequest;
import com.daniel.temia.application.dto.auth.LoginRequest;
import com.daniel.temia.application.dto.auth.LoginResponse;
import com.daniel.temia.application.dto.auth.RegisterRequest;
import com.daniel.temia.application.dto.auth.RegisterResponse;
import com.daniel.temia.application.dto.auth.UserInfo;
import com.daniel.temia.application.dto.common.ApiResponse;
import com.daniel.temia.domain.exception.BadRequestException;
import com.daniel.temia.domain.exception.ValidationException;
import com.daniel.temia.domain.model.FotoPerfil;
import com.daniel.temia.domain.model.Usuario;
import com.daniel.temia.domain.port.in.ActualizarFotoPerfilUseCase;
import com.daniel.temia.domain.port.in.ActualizarPerfilUseCase;
import com.daniel.temia.domain.port.in.EliminarFotoPerfilUseCase;
import com.daniel.temia.domain.port.in.GetCurrentUserUseCase;
import com.daniel.temia.domain.port.in.LoginUseCase;
import com.daniel.temia.domain.port.in.RegisterUseCase;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Locale;
import java.util.Set;


@RestController
@Tag(name = "Autenticación", description = "Registro, inicio de sesión y usuario actual.")
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {
    private static final Set<String> TIPOS_IMAGEN =
            Set.of("image/jpeg", "image/png", "image/webp");

    private final RegisterUseCase registerUseCase;
    private final LoginUseCase loginUseCase;
    private final GetCurrentUserUseCase getCurrentUserUseCase;
    private final ActualizarPerfilUseCase actualizarPerfilUseCase;
    private final ActualizarFotoPerfilUseCase actualizarFotoPerfilUseCase;
    private final EliminarFotoPerfilUseCase eliminarFotoPerfilUseCase;

    @Operation(
            summary = "Registra un nuevo usuario",
            description = "Devuelve 201 con `ApiResponse<RegisterResponse>` (usuario creado y mensaje). Recibe multipart/form-data con "
                    + "la parte `data` (los campos del formulario en JSON) y la parte opcional "
                    + "`photo` con la foto de perfil (JPG, PNG o WEBP, máximo 2 MB). "
                    + "No requiere token.")
    @PostMapping(value = "/register", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<ApiResponse<RegisterResponse>> register(
            @Valid @RequestPart("data") RegisterRequest registerRequest,
            @RequestPart(value = "photo", required = false) MultipartFile photo) {

        RegisterResponse registerResponse =
                registerUseCase.register(registerRequest, toFotoPerfil(photo));
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(ApiResponse.<RegisterResponse>builder()
                        .success(true)
                        .message("Usuario registrado correctamente")
                        .data(registerResponse)
                        .build());
    }

    @Operation(summary = "Inicia sesión", description = "Devuelve 201 con `ApiResponse<LoginResponse>`: el token JWT, el usuario y un mensaje. No requiere token previo.")
    @PostMapping("/login")
    public ResponseEntity<ApiResponse<LoginResponse>> login(@Valid @RequestBody LoginRequest loginRequest) {
        LoginResponse loginResponse = loginUseCase.login(loginRequest);
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(ApiResponse.<LoginResponse>builder()
                        .success(true)
                        .message("Inicio de sesión correcto")
                        .data(loginResponse)
                        .build());
    }

    @Operation(summary = "Devuelve el usuario del token", description = "Devuelve 200 con `ApiResponse<UserInfo>` y un mensaje. Requiere el header Authorization con el token Bearer.")
    @SecurityRequirement(name = "bearerAuth")
    @GetMapping("/me")
    public ResponseEntity<ApiResponse<UserInfo>> getCurrentUser(@RequestHeader("Authorization") String authHeader) {
        String token = authHeader.replace("Bearer ", "");
        UserInfo userInfo = getCurrentUserUseCase.getCurrentUser(token);
        return ResponseEntity.ok(ApiResponse.<UserInfo>builder()
                .success(true)
                .message("Usuario obtenido correctamente")
                .data(userInfo)
                .build());
    }

    @Operation(summary = "Actualiza el perfil del usuario del token",
            description = "Permite cambiar el nombre de usuario y, opcionalmente, la contraseña. "
                    + "El email no se puede modificar. Devuelve 200 con `ApiResponse<UserInfo>` y un mensaje. "
                    + "Requiere el header Authorization con el token Bearer.")
    @SecurityRequirement(name = "bearerAuth")
    @PatchMapping("/me")
    public ResponseEntity<ApiResponse<UserInfo>> actualizarPerfil(
            @AuthenticationPrincipal Usuario usuario,
            @Valid @RequestBody ActualizarPerfilRequest actualizarPerfilRequest) {
        UserInfo userInfo = actualizarPerfilUseCase.actualizarPerfil(
                usuario.getId(), actualizarPerfilRequest);
        return ResponseEntity.ok(ApiResponse.<UserInfo>builder()
                .success(true)
                .message("Perfil actualizado correctamente")
                .data(userInfo)
                .build());
    }

    @Operation(summary = "Actualiza la foto de perfil del usuario del token",
            description = "Recibe multipart/form-data con la parte `photo` (JPG, PNG o WEBP, "
                    + "máximo 2 MB) y devuelve 200 con `ApiResponse<UserInfo>` y el mensaje. "
                    + "Requiere el header Authorization con el token Bearer.")
    @SecurityRequirement(name = "bearerAuth")
    @PostMapping(value = "/me/photo", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<ApiResponse<UserInfo>> actualizarFotoPerfil(
            @AuthenticationPrincipal Usuario usuario,
            @RequestPart("photo") MultipartFile photo) {
        UserInfo userInfo = actualizarFotoPerfilUseCase.actualizarFotoPerfil(
                usuario.getId(), toFotoPerfilValidada(photo));
        return ResponseEntity.ok(ApiResponse.<UserInfo>builder()
                .success(true)
                .message("Foto de perfil actualizada correctamente")
                .data(userInfo)
                .build());
    }

    @Operation(summary = "Elimina la foto de perfil del usuario del token",
            description = "Elimina la foto del almacenamiento y deja la foto a `null`. "
                    + "La operación es idempotente: si el usuario no tenía foto responde "
                    + "`200` con el mensaje informativo. Devuelve `200` con "
                    + "`ApiResponse<UserInfo>` y un mensaje. Requiere el header "
                    + "Authorization con el token Bearer.")
    @SecurityRequirement(name = "bearerAuth")
    @DeleteMapping("/me/photo")
    public ResponseEntity<ApiResponse<UserInfo>> eliminarFotoPerfil(
            @AuthenticationPrincipal Usuario usuario) {
        UserInfo userInfo = eliminarFotoPerfilUseCase.eliminarFotoPerfil(usuario.getId());
        String mensaje = userInfo.getPhoto() == null
                ? "El perfil no tenía foto"
                : "Foto de perfil eliminada correctamente";
        return ResponseEntity.ok(ApiResponse.<UserInfo>builder()
                .success(true)
                .message(mensaje)
                .data(userInfo)
                .build());
    }

    /**
     * Convierte la parte fotográfica del multipart en un value object de dominio.
     * Devuelve {@code null} cuando el cliente no ha enviado foto: es opcional.
     */
    private FotoPerfil toFotoPerfil(MultipartFile photo) {
        if (photo == null || photo.isEmpty()) {
            return null;
        }

        try {
            return FotoPerfil.builder()
                    .contenido(photo.getBytes())
                    .contentType(photo.getContentType())
                    .nombreOriginal(photo.getOriginalFilename())
                    .build();
        } catch (IOException e) {
            throw new ValidationException("No se pudo leer la foto de perfil enviada");
        }
    }

    /**
     * Valida la foto del endpoint de perfil, donde la parte es obligatoria y el tipo
     * debe ser una imagen admitida.
     */
    private FotoPerfil toFotoPerfilValidada(MultipartFile photo) {
        FotoPerfil fotoPerfil = toFotoPerfil(photo);
        if (fotoPerfil == null) {
            throw new BadRequestException("La foto de perfil está vacía");
        }

        String contentType = fotoPerfil.getContentType();
        if (contentType == null || !TIPOS_IMAGEN.contains(contentType.toLowerCase(Locale.ROOT))) {
            throw new BadRequestException("La foto debe ser JPG, PNG o WEBP");
        }

        return fotoPerfil;
    }
}
