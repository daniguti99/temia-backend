package com.daniel.temia.domain.port.out;

import com.daniel.temia.infraestructure.adapter.out.ficheros.FotoPerfil;

public interface AlmacenFotoPort {
    String subirFoto(FotoPerfil fotoPerfil);
}
