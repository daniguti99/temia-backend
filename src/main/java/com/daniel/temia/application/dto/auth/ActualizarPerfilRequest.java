package com.daniel.temia.application.dto.auth;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Cuerpo de `PATCH /api/auth/me`.
 *
 * El email no aparece a propósito: identifica la cuenta y no se puede cambiar.
 * Los campos de contraseña son opcionales en su conjunto; si se rellena alguno, el
 * servicio exige la contraseña actual y la confirmación.
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ActualizarPerfilRequest {

    @NotBlank(message = "Rellene el nombre de usuario")
    @Size(min = 3, max = 50, message = "El nombre de usuario debe tener entre 3 y 50 caracteres")
    private String username;

    private String currentPassword;

    private String newPassword;

    private String confirmPassword;
}
