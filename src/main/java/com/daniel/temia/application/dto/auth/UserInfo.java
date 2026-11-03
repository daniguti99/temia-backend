package com.daniel.temia.application.dto.auth;

import com.daniel.temia.domain.model.Role;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserInfo {
    private Long id;
    private String username;
    private String email;
    private String photo;
    private Role role;
}
