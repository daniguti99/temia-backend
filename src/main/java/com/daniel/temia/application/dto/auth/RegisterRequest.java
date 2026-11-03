package com.daniel.temia.application.dto.auth;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
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
public class RegisterRequest {

    @NotBlank(message = "Rellene el nombre de usuario")
    private String username;

    @Email(message = "Email inválido")
    @NotBlank(message = "Rellene el email")
    private String email;

    @Email(message = "Email inválido")
    private String confirmEmail;

    @NotBlank(message = "Rellene la contraseña")
    private String password;

    @NotBlank(message = "Rellene la contraseña de confirmación")
    private String confirmPassword;
}
