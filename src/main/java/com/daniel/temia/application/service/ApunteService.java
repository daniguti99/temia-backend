package com.daniel.temia.application.service;

import com.daniel.temia.application.dto.apunte.ActualizarApunte;
import com.daniel.temia.application.dto.apunte.ApunteDetalle;
import com.daniel.temia.application.dto.apunte.ApunteListado;
import com.daniel.temia.application.dto.apunte.NuevoApunteTexto;
import com.daniel.temia.domain.exception.BadRequestException;
import com.daniel.temia.domain.exception.NotFoundException;
import com.daniel.temia.domain.model.Apunte;
import com.daniel.temia.domain.model.EstadoApunte;
import com.daniel.temia.domain.model.TipoOrigen;
import com.daniel.temia.domain.port.in.GestionarApuntesUseCase;
import com.daniel.temia.domain.port.out.ApunteRepositoryPort;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApunteService implements GestionarApuntesUseCase {

    private final ApunteRepositoryPort apunteRepositoryPort;

    @Override
    @Transactional(readOnly = true)
    public List<ApunteListado> listar(Long usuarioId) {
        return apunteRepositoryPort.listarPorUsuario(usuarioId).stream()
                .map(this::toListado)
                .toList();
    }

    @Override
    @Transactional(readOnly = true)
    public ApunteDetalle obtener(Long usuarioId, Long apunteId) {
        return toDetalle(buscarPropio(usuarioId, apunteId));
    }

    @Override
    @Transactional
    public ApunteDetalle crear(Long usuarioId, NuevoApunteTexto request) {
        String titulo = normalizarTitulo(request.getTitulo());
        String texto = validarTexto(request.getTexto());

        Apunte apunte = Apunte.builder()
                .usuarioId(usuarioId)
                .titulo(titulo)
                .tipoOrigen(TipoOrigen.TEXTO)
                .textoExtraido(texto)
                .estado(EstadoApunte.PROCESADO)
                .build();

        return toDetalle(apunteRepositoryPort.guardar(apunte));
    }

    @Override
    @Transactional
    public ApunteDetalle actualizar(Long usuarioId, Long apunteId, ActualizarApunte request) {
        Apunte apunte = buscarPropio(usuarioId, apunteId);

        if (request.getTitulo() != null) {
            apunte.setTitulo(normalizarTitulo(request.getTitulo()));
        }
        if (request.getTexto() != null) {
            apunte.setTextoExtraido(validarTexto(request.getTexto()));
        }

        return toDetalle(apunteRepositoryPort.guardar(apunte));
    }

    @Override
    @Transactional
    public void eliminar(Long usuarioId, Long apunteId) {
        apunteRepositoryPort.eliminar(buscarPropio(usuarioId, apunteId));
    }

    private Apunte buscarPropio(Long usuarioId, Long apunteId) {
        return apunteRepositoryPort.buscarPorIdYUsuario(apunteId, usuarioId)
                .orElseThrow(() -> new NotFoundException("Apunte no encontrado"));
    }

    private String normalizarTitulo(String titulo) {
        String limpio = titulo == null ? "" : titulo.trim();
        if (limpio.length() < 3 || limpio.length() > 100) {
            throw new BadRequestException(
                    "El título del apunte debe tener entre 3 y 100 caracteres");
        }
        return limpio;
    }

    private String validarTexto(String texto) {
        String limpio = texto == null ? "" : texto.trim();
        if (limpio.isEmpty()) {
            throw new BadRequestException("Rellene el texto del apunte");
        }
        return limpio;
    }

    private ApunteListado toListado(Apunte apunte) {
        return ApunteListado.builder()
                .id(apunte.getId())
                .titulo(apunte.getTitulo())
                .actualizadoEn(apunte.getActualizadoEn() != null
                        ? apunte.getActualizadoEn()
                        : apunte.getCreadoEn())
                .build();
    }

    private ApunteDetalle toDetalle(Apunte apunte) {
        return ApunteDetalle.builder()
                .id(apunte.getId())
                .titulo(apunte.getTitulo())
                .texto(apunte.getTextoExtraido())
                .creadoEn(apunte.getCreadoEn())
                .actualizadoEn(apunte.getActualizadoEn())
                .build();
    }
}
