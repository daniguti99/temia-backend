package com.daniel.temia.domain.port.in;

import com.daniel.temia.application.dto.apunte.ActualizarApunte;
import com.daniel.temia.application.dto.apunte.ApunteDetalle;
import com.daniel.temia.application.dto.apunte.ApunteListado;
import com.daniel.temia.application.dto.apunte.NuevoApunteTexto;

import java.util.List;

public interface GestionarApuntesUseCase {

    List<ApunteListado> listar(Long usuarioId);

    ApunteDetalle obtener(Long usuarioId, Long apunteId);

    ApunteDetalle crear(Long usuarioId, NuevoApunteTexto request);

    ApunteDetalle actualizar(Long usuarioId, Long apunteId, ActualizarApunte request);

    void eliminar(Long usuarioId, Long apunteId);
}
