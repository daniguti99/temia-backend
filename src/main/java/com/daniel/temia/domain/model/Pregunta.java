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
public class Pregunta {
    private Long id;
    private Long testId;
    private String enunciado;
    private String explicacion;
    private Integer orden;
    private LocalDateTime creadoEn;
    private LocalDateTime actualizadoEn;
}
