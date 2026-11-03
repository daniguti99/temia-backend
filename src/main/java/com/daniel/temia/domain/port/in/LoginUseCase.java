package com.daniel.temia.domain.port.in;

import com.daniel.temia.application.dto.auth.LoginRequest;
import com.daniel.temia.application.dto.auth.LoginResponse;

public interface LoginUseCase {
    LoginResponse login(LoginRequest request);
}
