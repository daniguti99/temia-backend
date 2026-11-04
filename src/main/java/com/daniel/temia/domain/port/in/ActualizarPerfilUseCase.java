package com.daniel.temia.domain.port.in;

import com.daniel.temia.application.dto.auth.ActualizarPerfilRequest;
import com.daniel.temia.application.dto.auth.UserInfo;

public interface ActualizarPerfilUseCase {
    UserInfo actualizarPerfil(Long usuarioId, ActualizarPerfilRequest request);
}
