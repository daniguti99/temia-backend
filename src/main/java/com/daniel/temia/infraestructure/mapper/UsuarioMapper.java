package com.daniel.temia.infraestructure.mapper;

import com.daniel.temia.domain.model.Usuario;
import com.daniel.temia.infraestructure.adapter.out.persistence.entity.UsuarioEntity;

public class UsuarioMapper {

    private UsuarioMapper() {
    }

    public static Usuario toDomain(UsuarioEntity entity) {
        if (entity == null) {
            return null;
        }
        return Usuario.builder()
                .id(entity.getId())
                .email(entity.getEmail())
                .username(entity.getUsername())
                .passwordHash(entity.getPasswordHash())
                .fotoUrl(entity.getFotoUrl())
                .role(entity.getRole())
                .activo(entity.getActivo())
                .creadoEn(entity.getCreadoEn())
                .actualizadoEn(entity.getActualizadoEn())
                .build();
    }

    public static UsuarioEntity toEntity(Usuario domain) {
        if (domain == null) {
            return null;
        }
        return UsuarioEntity.builder()
                .id(domain.getId())
                .email(domain.getEmail())
                .username(domain.getUsername())
                .passwordHash(domain.getPasswordHash())
                .fotoUrl(domain.getFotoUrl())
                .role(domain.getRole())
                .activo(domain.getActivo())
                .creadoEn(domain.getCreadoEn())
                .actualizadoEn(domain.getActualizadoEn())
                .build();
    }
}
