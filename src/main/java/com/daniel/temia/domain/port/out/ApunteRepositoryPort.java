package com.daniel.temia.domain.port.out;

import com.daniel.temia.domain.model.Apunte;

import java.util.List;
import java.util.Optional;

public interface ApunteRepositoryPort {

    List<Apunte> listarPorUsuario(Long usuarioId);

    Optional<Apunte> buscarPorIdYUsuario(Long id, Long usuarioId);

    Apunte guardar(Apunte apunte);

    void eliminar(Apunte apunte);
}
