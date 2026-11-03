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
public class Opcion {
    private Long id;
    private Long preguntaId;
    private String texto;
    private Boolean esCorrecta;
    private Integer orden;
    private LocalDateTime creadoEn;
    private LocalDateTime actualizadoEn;
}
