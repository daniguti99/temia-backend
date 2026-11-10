package com.daniel.temia.application.dto.apunte;

import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Cuerpo de {@code PATCH /api/apuntes/{id}}.
 *
 * <p>Ambos campos son opcionales: solo se actualiza lo que llega en la petición.</p>
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ActualizarApunte {

    @Size(min = 3, max = 100, message = "El título debe tener entre 3 y 100 caracteres")
    private String titulo;

    private String texto;
}
