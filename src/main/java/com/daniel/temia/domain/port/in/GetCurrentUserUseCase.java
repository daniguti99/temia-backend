package com.daniel.temia.domain.port.in;

import com.daniel.temia.application.dto.auth.UserInfo;

public interface GetCurrentUserUseCase {
    UserInfo getCurrentUser(String token);
}
