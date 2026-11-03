package com.daniel.temia.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Intento {
    private Long id;
    private Long testId;
    private Long usuarioId;
    private Integer aciertos;
    private Integer errores;
    private Integer total;
    private BigDecimal porcentaje;
    private LocalDateTime iniciadoEn;
    private LocalDateTime finalizadoEn;
    private LocalDateTime creadoEn;
    private LocalDateTime actualizadoEn;
}
