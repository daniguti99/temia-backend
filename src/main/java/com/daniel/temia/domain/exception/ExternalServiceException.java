package com.daniel.temia.domain.exception;

/**
 * Fallo de un servicio externo del que depende la operación.
 *
 * <p>Se traduce en un 503 para que el cliente sepa que puede reintentar y reciba el
 * motivo concreto, en lugar de un 500 genérico.</p>
 */
public class ExternalServiceException extends RuntimeException {
    public ExternalServiceException(String message) {
        super(message);
    }
}
