package com.daniel.temia.infraestructure.adapter.out.persistence.entity;

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
@Table(name = "opcion", uniqueConstraints = {
        @UniqueConstraint(name = "uk_opcion_pregunta_orden", columnNames = {"pregunta_id", "orden"})
})
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OpcionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "pregunta_id", nullable = false)
    private PreguntaEntity pregunta;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String texto;

    @Column(name = "es_correcta", nullable = false)
    private Boolean esCorrecta;

    @Column(nullable = false)
    private Integer orden;

    @CreationTimestamp
    @Column(name = "creado_en", nullable = false, updatable = false)
    private LocalDateTime creadoEn;

    @UpdateTimestamp
    @Column(name = "actualizado_en")
    private LocalDateTime actualizadoEn;
}
