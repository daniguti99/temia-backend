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
@Table(name = "respuesta_intento", uniqueConstraints = {
        @UniqueConstraint(name = "uk_respuesta_intento_unica", columnNames = {"intento_id", "pregunta_id"})
})
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RespuestaIntentoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "intento_id", nullable = false)
    private IntentoEntity intento;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "pregunta_id", nullable = false)
    private PreguntaEntity pregunta;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "opcion_elegida_id")
    private OpcionEntity opcionElegida;

    @Column(name = "es_acierto", nullable = false)
    private Boolean esAcierto;

    @Column(name = "explicacion_snapshot", columnDefinition = "MEDIUMTEXT")
    private String explicacionSnapshot;

    @Column(name = "respondido_en", nullable = false)
    private LocalDateTime respondidoEn;

    @CreationTimestamp
    @Column(name = "creado_en", nullable = false, updatable = false)
    private LocalDateTime creadoEn;

    @UpdateTimestamp
    @Column(name = "actualizado_en")
    private LocalDateTime actualizadoEn;
}
