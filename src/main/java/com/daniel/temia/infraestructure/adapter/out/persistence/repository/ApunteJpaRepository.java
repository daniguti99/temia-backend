package com.daniel.temia.infraestructure.adapter.out.persistence.repository;

import com.daniel.temia.infraestructure.adapter.out.persistence.entity.ApunteEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ApunteJpaRepository extends JpaRepository<ApunteEntity, Long> {

    List<ApunteEntity> findByUsuario_IdOrderByActualizadoEnDescCreadoEnDesc(Long usuarioId);

    Optional<ApunteEntity> findByIdAndUsuario_Id(Long id, Long usuarioId);
}
