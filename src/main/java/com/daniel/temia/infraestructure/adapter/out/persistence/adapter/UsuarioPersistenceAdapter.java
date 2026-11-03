package com.daniel.temia.infraestructure.adapter.out.persistence.adapter;

import com.daniel.temia.domain.model.Usuario;
import com.daniel.temia.domain.port.out.UsuarioRepositoryPort;
import com.daniel.temia.infraestructure.adapter.out.persistence.repository.UsuarioJpaRepository;
import com.daniel.temia.infraestructure.mapper.UsuarioMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class UsuarioPersistenceAdapter implements UsuarioRepositoryPort {

    private final UsuarioJpaRepository usuarioJpaRepository;

    @Override
    public Usuario guardar(Usuario usuario) {
        var entity = UsuarioMapper.toEntity(usuario);
        var saved = usuarioJpaRepository.save(entity);
        return UsuarioMapper.toDomain(saved);
    }

    @Override
    public Optional<Usuario> buscarPorId(Long id) {
        return usuarioJpaRepository.findById(id).map(UsuarioMapper::toDomain);
    }

    @Override
    public Optional<Usuario> buscarPorEmail(String email) {
        return usuarioJpaRepository.findByEmail(email).map(UsuarioMapper::toDomain);
    }

    @Override
    public Optional<Usuario> buscarPorUsername(String username) {
        return usuarioJpaRepository.findByUsername(username).map(UsuarioMapper::toDomain);
    }

    @Override
    public boolean existePorEmail(String email) {
        return usuarioJpaRepository.existsByEmail(email);
    }

    @Override
    public boolean existePorUsername(String username) {
        return usuarioJpaRepository.existsByUsername(username);
    }
}
