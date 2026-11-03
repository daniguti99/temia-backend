package com.daniel.temia.infraestructure.adapter.out.ficheros;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FotoPerfil {
    private byte[] contenido;
    private String contentType;
    private String nombreOriginal;
}
