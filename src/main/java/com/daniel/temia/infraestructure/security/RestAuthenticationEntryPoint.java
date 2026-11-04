package com.daniel.temia.infraestructure.security;

import com.daniel.temia.application.dto.error.ApiError;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.MediaType;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Respuesta JSON para las peticiones sin sesión válida.
 *
 * Sin este componente, Spring devuelve una página de error HTML o deja que la
 * excepción llegue al handler global como un 500. Aquí se responde siempre el mismo
 * cuerpo `ApiError` que usa el resto de la API, con estado 401.
 */
@Component
public class RestAuthenticationEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request,
                         HttpServletResponse response,
                         AuthenticationException authException) throws IOException {
        ApiError error = ApiError.builder()
                .timestamp(LocalDateTime.now())
                .status(HttpServletResponse.SC_UNAUTHORIZED)
                .error("Unauthorized")
                .message("Debes iniciar sesión para acceder a este recurso")
                .path(request.getRequestURI())
                .build();

        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(toJson(error));
    }

    private String toJson(ApiError error) {
        return "{"
                + "\"timestamp\":\"" + escape(error.getTimestamp().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME)) + "\","
                + "\"status\":" + error.getStatus() + ","
                + "\"error\":\"" + escape(error.getError()) + "\","
                + "\"message\":\"" + escape(error.getMessage()) + "\","
                + "\"path\":\"" + escape(error.getPath()) + "\""
                + "}";
    }

    private String escape(String valor) {
        if (valor == null) {
            return "";
        }
        return valor.replace("\\", "\\\\").replace("\"", "\\\"");
    }
}
