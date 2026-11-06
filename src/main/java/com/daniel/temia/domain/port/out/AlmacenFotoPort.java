package com.daniel.temia.domain.port.out;

import com.daniel.temia.domain.model.FotoPerfil;

public interface AlmacenFotoPort {
    String subirFoto(FotoPerfil fotoPerfil);

    boolean eliminarFoto(String fotoUrl);
}
