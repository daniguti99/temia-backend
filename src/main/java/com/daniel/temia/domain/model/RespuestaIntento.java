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
public class RespuestaIntento {
    private Long id;
    private Long intentoId;
    private Long preguntaId;
    private Long opcionElegidaId;
    private Boolean esAcierto;
    private String explicacionSnapshot;
    private LocalDateTime respondidoEn;
    private LocalDateTime creadoEn;
    private LocalDateTime actualizadoEn;
}
