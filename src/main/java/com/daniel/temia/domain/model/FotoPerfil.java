package com.daniel.temia.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Imagen de perfil que llega desde el cliente.
 *
 * <p>Vive en el dominio porque es el dato que cruza el puerto de almacenamiento; la
 * forma de subirla o borrarla es responsabilidad del adaptador.</p>
 */
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
