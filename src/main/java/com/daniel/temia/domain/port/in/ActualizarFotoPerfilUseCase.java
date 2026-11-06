package com.daniel.temia.domain.port.in;

import com.daniel.temia.application.dto.auth.UserInfo;
import com.daniel.temia.domain.model.FotoPerfil;

public interface ActualizarFotoPerfilUseCase {
    UserInfo actualizarFotoPerfil(Long usuarioId, FotoPerfil fotoPerfil);
}
