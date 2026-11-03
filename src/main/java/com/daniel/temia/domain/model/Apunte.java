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
public class Apunte {
    private Long id;
    private Long usuarioId;
    private String titulo;
    private TipoOrigen tipoOrigen;
    private String textoExtraido;
    private String ficheroUrl;
    private String ficheroPublicId;
    private String nombreOriginal;
    private String extension;
    private Long tamanioBytes;
    private EstadoApunte estado;
    private LocalDateTime creadoEn;
    private LocalDateTime actualizadoEn;
}
