package com.daniel.temia.infraestructure.mapper;

import com.daniel.temia.domain.model.Apunte;
import com.daniel.temia.infraestructure.adapter.out.persistence.entity.ApunteEntity;
import com.daniel.temia.infraestructure.adapter.out.persistence.entity.UsuarioEntity;

public final class ApunteMapper {

    private ApunteMapper() {
    }

    public static Apunte toDomain(ApunteEntity entity) {
        return Apunte.builder()
                .id(entity.getId())
                .usuarioId(entity.getUsuario() != null ? entity.getUsuario().getId() : null)
                .titulo(entity.getTitulo())
                .tipoOrigen(entity.getTipoOrigen())
                .textoExtraido(entity.getTextoExtraido())
                .ficheroUrl(entity.getFicheroUrl())
                .ficheroPublicId(entity.getFicheroPublicId())
                .nombreOriginal(entity.getNombreOriginal())
                .extension(entity.getExtension())
                .tamanioBytes(entity.getTamanioBytes())
                .estado(entity.getEstado())
                .creadoEn(entity.getCreadoEn())
                .actualizadoEn(entity.getActualizadoEn())
                .build();
    }

    public static ApunteEntity toEntity(Apunte apunte, UsuarioEntity usuario) {
        ApunteEntity entity = ApunteEntity.builder()
                .id(apunte.getId())
                .usuario(usuario)
                .build();
        copiarDatos(apunte, entity);
        return entity;
    }

    /**
     * Copia los campos editables del dominio sobre una entidad ya gestionada.
     *
     * <p>No toca {@code id} ni las marcas de tiempo: Hibernate las conserva al hacer
     * {@code merge} y actualiza {@code actualizadoEn} al vaciar la sesión.</p>
     */
    public static void copiarDatos(Apunte apunte, ApunteEntity entity) {
        entity.setTitulo(apunte.getTitulo());
        entity.setTipoOrigen(apunte.getTipoOrigen());
        entity.setTextoExtraido(apunte.getTextoExtraido());
        entity.setFicheroUrl(apunte.getFicheroUrl());
        entity.setFicheroPublicId(apunte.getFicheroPublicId());
        entity.setNombreOriginal(apunte.getNombreOriginal());
        entity.setExtension(apunte.getExtension());
        entity.setTamanioBytes(apunte.getTamanioBytes());
        entity.setEstado(apunte.getEstado());
    }
}
