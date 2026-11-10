package com.daniel.temia.application.dto.apunte;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApunteDetalle {
    private Long id;
    private String titulo;
    private String texto;
    private LocalDateTime creadoEn;
    private LocalDateTime actualizadoEn;
}
