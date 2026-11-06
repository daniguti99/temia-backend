package com.daniel.temia.domain.port.in;

import com.daniel.temia.application.dto.auth.UserInfo;

public interface EliminarFotoPerfilUseCase {
    UserInfo eliminarFotoPerfil(Long usuarioId);
}
