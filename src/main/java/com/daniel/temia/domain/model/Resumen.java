package com.daniel.temia.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Resumen {
    private Long id;
    private Long apunteId;
    private Long usuarioId;
    private String titulo;
    private String contenido;
    private String configuracion;
    private String modeloUsado;
    private Boolean esPublico;
    private LocalDateTime creadoEn;
    private LocalDateTime actualizadoEn;
}
