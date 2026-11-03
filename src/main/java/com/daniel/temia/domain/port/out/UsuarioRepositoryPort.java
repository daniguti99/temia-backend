package com.daniel.temia.domain.port.out;

import com.daniel.temia.domain.model.Usuario;

import java.util.Optional;
//Es el contrato que olo implementa el adapter
public interface UsuarioRepositoryPort {
    Usuario guardar(Usuario usuario);
    Optional<Usuario> buscarPorId(Long id);
    Optional<Usuario> buscarPorEmail(String email);
    Optional<Usuario> buscarPorUsername(String username);
    boolean existePorEmail(String email);
    boolean existePorUsername(String username);
}
