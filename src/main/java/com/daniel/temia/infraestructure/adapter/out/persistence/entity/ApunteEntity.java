package com.daniel.temia.infraestructure.adapter.out.persistence.entity;

import com.daniel.temia.domain.model.EstadoApunte;
import com.daniel.temia.domain.model.TipoOrigen;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "apunte")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ApunteEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id", nullable = false)
    private UsuarioEntity usuario;

    @Column(nullable = false, length = 200)
    private String titulo;

    @Enumerated(EnumType.STRING)
    @Column(name = "tipo_origen", nullable = false)
    private TipoOrigen tipoOrigen;

    @Column(name = "texto_extraido", columnDefinition = "LONGTEXT")
    private String textoExtraido;

    @Column(name = "fichero_url", length = 512)
    private String ficheroUrl;

    @Column(name = "fichero_public_id", length = 255)
    private String ficheroPublicId;

    @Column(name = "nombre_original", length = 255)
    private String nombreOriginal;

    @Column(length = 10)
    private String extension;

    @Column(name = "tamanio_bytes")
    private Long tamanioBytes;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private EstadoApunte estado;

    @CreationTimestamp
    @Column(name = "creado_en", nullable = false, updatable = false)
    private LocalDateTime creadoEn;

    @UpdateTimestamp
    @Column(name = "actualizado_en")
    private LocalDateTime actualizadoEn;
}
