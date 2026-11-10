package com.daniel.temia.infraestructure.adapter.in.rest;

import com.daniel.temia.application.dto.apunte.ActualizarApunte;
import com.daniel.temia.application.dto.apunte.ApunteDetalle;
import com.daniel.temia.application.dto.apunte.ApunteListado;
import com.daniel.temia.application.dto.apunte.NuevoApunteTexto;
import com.daniel.temia.application.dto.common.ApiResponse;
import com.daniel.temia.domain.model.Usuario;
import com.daniel.temia.domain.port.in.GestionarApuntesUseCase;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Tag(name = "Apuntes", description = "Gestión de los apuntes del usuario autenticado.")
@RequestMapping("/api/apuntes")
@RequiredArgsConstructor
public class ApunteController {

    private final GestionarApuntesUseCase gestionarApuntesUseCase;

    @Operation(summary = "Lista los apuntes del usuario del token",
            description = "Devuelve 200 con `ApiResponse<ApunteListado[]>` y un mensaje. "
                    + "Requiere el header Authorization con el token Bearer.")
    @SecurityRequirement(name = "bearerAuth")
    @GetMapping
    public ResponseEntity<ApiResponse<List<ApunteListado>>> listar(
            @AuthenticationPrincipal Usuario usuario) {
        return ResponseEntity.ok(ApiResponse.<List<ApunteListado>>builder()
                .success(true)
                .message("Apuntes obtenidos correctamente")
                .data(gestionarApuntesUseCase.listar(usuario.getId()))
                .build());
    }

    @Operation(summary = "Devuelve el detalle de un apunte del usuario del token",
            description = "Responde 200 con `ApiResponse<ApunteDetalle>` si el apunte es del "
                    + "usuario; 404 si no existe o es de otro usuario.")
    @SecurityRequirement(name = "bearerAuth")
    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<ApunteDetalle>> obtener(
            @AuthenticationPrincipal Usuario usuario,
            @PathVariable Long id) {
        return ResponseEntity.ok(ApiResponse.<ApunteDetalle>builder()
                .success(true)
                .message("Apunte obtenido correctamente")
                .data(gestionarApuntesUseCase.obtener(usuario.getId(), id))
                .build());
    }

    @Operation(summary = "Crea un apunte de texto",
            description = "Recibe el título y el texto, crea el apunte y responde 201 con "
                    + "`ApiResponse<ApunteDetalle>` y un mensaje.")
    @SecurityRequirement(name = "bearerAuth")
    @PostMapping
    public ResponseEntity<ApiResponse<ApunteDetalle>> crear(
            @AuthenticationPrincipal Usuario usuario,
            @Valid @RequestBody NuevoApunteTexto request) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.<ApunteDetalle>builder()
                        .success(true)
                        .message("Apunte creado correctamente")
                        .data(gestionarApuntesUseCase.crear(usuario.getId(), request))
                        .build());
    }

    @Operation(summary = "Actualiza un apunte del usuario del token",
            description = "Actualiza solo los campos enviados y responde 200 con "
                    + "`ApiResponse<ApunteDetalle>`. Responde 404 si el apunte no es del usuario.")
    @SecurityRequirement(name = "bearerAuth")
    @PatchMapping("/{id}")
    public ResponseEntity<ApiResponse<ApunteDetalle>> actualizar(
            @AuthenticationPrincipal Usuario usuario,
            @PathVariable Long id,
            @Valid @RequestBody ActualizarApunte request) {
        return ResponseEntity.ok(ApiResponse.<ApunteDetalle>builder()
                .success(true)
                .message("Apunte actualizado correctamente")
                .data(gestionarApuntesUseCase.actualizar(usuario.getId(), id, request))
                .build());
    }

    @Operation(summary = "Elimina un apunte del usuario del token",
            description = "Elimina el apunte y responde 200 con `ApiResponse<null>` y un "
                    + "mensaje. Responde 404 si el apunte no es del usuario.")
    @SecurityRequirement(name = "bearerAuth")
    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse<Void>> eliminar(
            @AuthenticationPrincipal Usuario usuario,
            @PathVariable Long id) {
        gestionarApuntesUseCase.eliminar(usuario.getId(), id);
        return ResponseEntity.ok(ApiResponse.<Void>builder()
                .success(true)
                .message("Apunte eliminado correctamente")
                .data(null)
                .build());
    }
}
