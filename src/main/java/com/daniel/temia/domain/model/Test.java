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
public class Test {
    private Long id;
    private Long apunteId;
    private Long usuarioId;
    private Long resumenId;
    private String titulo;
    private String configuracion;
    private Integer numeroPreguntas;
    private LocalDateTime creadoEn;
    private LocalDateTime actualizadoEn;
}
