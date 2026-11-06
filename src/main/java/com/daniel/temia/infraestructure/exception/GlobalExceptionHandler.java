package com.daniel.temia.infraestructure.exception;

import com.daniel.temia.application.dto.error.ApiError;
import com.daniel.temia.domain.exception.BadRequestException;
import com.daniel.temia.domain.exception.ExternalServiceException;
import com.daniel.temia.domain.exception.NotFoundException;
import com.daniel.temia.domain.exception.UnauthorizedException;
import com.daniel.temia.domain.exception.ValidationException;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.FieldError;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.support.MissingServletRequestPartException;

import java.time.LocalDateTime;
import java.util.stream.Collectors;

/**
 * Handler global de excepciones. No extiende {@code ResponseEntityExceptionHandler} a propósito:
 * en Spring 7 esa clase base ya mapea muchas de estas excepciones y declararlas aquí también
 * provoca {@code IllegalStateException: Ambiguous @ExceptionHandler method mapped}.
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(BadRequestException.class)
    public ResponseEntity<ApiError> handleBadRequest(BadRequestException ex, HttpServletRequest request) {
        log.warn("BadRequest: {} - {}", path(request), ex.getMessage());
        return buildResponse(HttpStatus.BAD_REQUEST, ex.getMessage(), request);
    }

    @ExceptionHandler(UnauthorizedException.class)
    public ResponseEntity<ApiError> handleUnauthorized(UnauthorizedException ex, HttpServletRequest request) {
        log.warn("Unauthorized: {} - {}", path(request), ex.getMessage());
        return buildResponse(HttpStatus.UNAUTHORIZED, ex.getMessage(), request);
    }

    @ExceptionHandler(NotFoundException.class)
    public ResponseEntity<ApiError> handleNotFound(NotFoundException ex, HttpServletRequest request) {
        log.warn("NotFound: {} - {}", path(request), ex.getMessage());
        return buildResponse(HttpStatus.NOT_FOUND, ex.getMessage(), request);
    }

    @ExceptionHandler(ValidationException.class)
    public ResponseEntity<ApiError> handleValidationException(ValidationException ex, HttpServletRequest request) {
        log.warn("Validation: {} - {}", path(request), ex.getMessage());
        return buildResponse(HttpStatus.BAD_REQUEST, ex.getMessage(), request);
    }

    @ExceptionHandler(ExternalServiceException.class)
    public ResponseEntity<ApiError> handleExternalService(ExternalServiceException ex,
                                                          HttpServletRequest request) {
        log.warn("ExternalService: {} - {}", path(request), ex.getMessage());
        return buildResponse(HttpStatus.SERVICE_UNAVAILABLE, ex.getMessage(), request);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ApiError> handleValidationErrors(MethodArgumentNotValidException ex,
                                                           HttpServletRequest request) {
        String message = ex.getBindingResult().getFieldErrors().stream()
                .map(FieldError::getDefaultMessage)
                .collect(Collectors.joining(", "));
        if (message.isBlank()) {
            message = "Datos de la solicitud no válidos";
        }
        log.warn("Validation: {} - {}", path(request), message);
        return buildResponse(HttpStatus.BAD_REQUEST, message, request);
    }

    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public ResponseEntity<ApiError> handleMaxUploadSizeExceeded(MaxUploadSizeExceededException ex,
                                                                HttpServletRequest request) {
        log.warn("MaxUploadSizeExceeded: {}", path(request));
        return buildResponse(HttpStatus.BAD_REQUEST,
                "La foto de perfil no puede superar 2 MB", request);
    }

    @ExceptionHandler(MissingServletRequestPartException.class)
    public ResponseEntity<ApiError> handleMissingPart(MissingServletRequestPartException ex,
                                                      HttpServletRequest request) {
        log.warn("MissingServletRequestPart: {} - {}", path(request), ex.getMessage());
        return buildResponse(HttpStatus.BAD_REQUEST,
                "Falta la parte obligatoria '" + ex.getRequestPartName() + "' en la petición multipart", request);
    }

    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity<ApiError> handleMessageNotReadable(HttpMessageNotReadableException ex,
                                                             HttpServletRequest request) {
        log.warn("HttpMessageNotReadable: {}", path(request));
        return buildResponse(HttpStatus.BAD_REQUEST, "Solicitud incorrecta", request);
    }

    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public ResponseEntity<ApiError> handleMethodNotSupported(HttpRequestMethodNotSupportedException ex,
                                                             HttpServletRequest request) {
        log.warn("HttpRequestMethodNotSupported: {} - {}", path(request), ex.getMessage());
        return buildResponse(HttpStatus.METHOD_NOT_ALLOWED, "Método no permitido", request);
    }

    @ExceptionHandler(HttpMediaTypeNotSupportedException.class)
    public ResponseEntity<ApiError> handleMediaTypeNotSupported(HttpMediaTypeNotSupportedException ex,
                                                                HttpServletRequest request) {
        log.warn("HttpMediaTypeNotSupported: {} - {}", path(request), ex.getMessage());
        return buildResponse(HttpStatus.UNSUPPORTED_MEDIA_TYPE,
                "Tipo de contenido no soportado. Para /api/auth/register usa multipart/form-data "
                        + "con la parte 'data' (JSON) y 'photo' opcional.", request);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiError> handleGenericException(Exception ex, HttpServletRequest request) {
        log.error("Error inesperado en {}: {}", path(request), ex.getMessage(), ex);
        return buildResponse(HttpStatus.INTERNAL_SERVER_ERROR, "Error interno del servidor", request);
    }

    private String path(HttpServletRequest request) {
        return request != null ? request.getRequestURI() : "?";
    }

    private ResponseEntity<ApiError> buildResponse(HttpStatus status, String message, HttpServletRequest request) {
        return ResponseEntity.status(status).body(
                ApiError.builder()
                        .success(false)
                        .timestamp(LocalDateTime.now())
                        .status(status.value())
                        .error(status.getReasonPhrase())
                        .message(message)
                        .path(request != null ? request.getRequestURI() : null)
                        .build()
        );
    }
}
