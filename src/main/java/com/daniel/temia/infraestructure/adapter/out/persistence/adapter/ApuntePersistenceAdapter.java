package com.daniel.temia.infraestructure.adapter.out.persistence.adapter;

import com.daniel.temia.domain.model.Apunte;
import com.daniel.temia.domain.port.out.ApunteRepositoryPort;
import com.daniel.temia.infraestructure.adapter.out.persistence.entity.ApunteEntity;
import com.daniel.temia.infraestructure.adapter.out.persistence.entity.UsuarioEntity;
import com.daniel.temia.infraestructure.adapter.out.persistence.repository.ApunteJpaRepository;
import com.daniel.temia.infraestructure.adapter.out.persistence.repository.UsuarioJpaRepository;
import com.daniel.temia.infraestructure.mapper.ApunteMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class ApuntePersistenceAdapter implements ApunteRepositoryPort {

    private final ApunteJpaRepository apunteJpaRepository;
    private final UsuarioJpaRepository usuarioJpaRepository;

    @Override
    public List<Apunte> listarPorUsuario(Long usuarioId) {
        return apunteJpaRepository
                .findByUsuario_IdOrderByActualizadoEnDescCreadoEnDesc(usuarioId).stream()
                .map(ApunteMapper::toDomain)
                .toList();
    }

    @Override
    public Optional<Apunte> buscarPorIdYUsuario(Long id, Long usuarioId) {
        return apunteJpaRepository.findByIdAndUsuario_Id(id, usuarioId)
                .map(ApunteMapper::toDomain);
    }

    @Override
    public Apunte guardar(Apunte apunte) {
        UsuarioEntity usuario = usuarioJpaRepository.getReferenceById(apunte.getUsuarioId());

        ApunteEntity entity;
        if (apunte.getId() == null) {
            entity = ApunteMapper.toEntity(apunte, usuario);
        } else {
            // Se parte de la entidad gestionada para no perder creadoEn ni actualizadoEn.
            entity = apunteJpaRepository.findById(apunte.getId())
                    .orElseGet(() -> ApunteMapper.toEntity(apunte, usuario));
            ApunteMapper.copiarDatos(apunte, entity);
        }

        return ApunteMapper.toDomain(apunteJpaRepository.saveAndFlush(entity));
    }

    @Override
    public void eliminar(Apunte apunte) {
        apunteJpaRepository.deleteById(apunte.getId());
    }
}
