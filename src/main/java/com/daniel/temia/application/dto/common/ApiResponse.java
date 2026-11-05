package com.daniel.temia.application.dto.common;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Envelope común de todas las respuestas correctas de la API.
 *
 * <p>Todo endpoint devuelve este cuerpo: el dato de negocio en {@code data}, un
 * {@code message} legible que explica el resultado y {@code success} en {@code true}.
 * Los errores usan {@link com.daniel.temia.application.dto.error.ApiError}, que
 * mantiene el mismo campo {@code success} en {@code false}.</p>
 *
 * @param <T> tipo del dato de negocio devuelto por el caso de uso
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApiResponse<T> {
    private boolean success;
    private String message;
    private T data;
}
