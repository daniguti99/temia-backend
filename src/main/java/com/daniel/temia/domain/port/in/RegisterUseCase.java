package com.daniel.temia.domain.port.in;

import com.daniel.temia.application.dto.auth.RegisterRequest;
import com.daniel.temia.application.dto.auth.RegisterResponse;
import com.daniel.temia.domain.model.FotoPerfil;

public interface RegisterUseCase {
    RegisterResponse register(RegisterRequest request, FotoPerfil fotoPerfil);
}
