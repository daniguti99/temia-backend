package com.daniel.temia.infraestructure.adapter.out.ficheros;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.daniel.temia.domain.port.out.AlmacenFotoPort;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Slf4j
@Component
public class CloudinaryFotoAdapter implements AlmacenFotoPort {

    private final Cloudinary cloudinary;

    public CloudinaryFotoAdapter(@Value("${cloudinary.url:}") String cloudinaryUrl) {
        if (cloudinaryUrl != null && !cloudinaryUrl.isBlank()) {
            this.cloudinary = new Cloudinary(cloudinaryUrl);
        } else {
            this.cloudinary = null;
            log.warn("CLOUDINARY_URL no configurado. Las fotos de perfil no se subirán.");
        }
    }

    @Override
    public String subirFoto(FotoPerfil fotoPerfil) {
        if (cloudinary == null || fotoPerfil == null || fotoPerfil.getContenido() == null) {
            return null;
        }

        try {
            String publicId = "temia/avatares/" + UUID.randomUUID();
            Map<?, ?> uploadResult = cloudinary.uploader().upload(fotoPerfil.getContenido(), ObjectUtils.asMap(
                    "public_id", publicId,
                    "folder", "temia/avatares",
                    "resource_type", "image",
                    "overwrite", true
            ));
            Object url = uploadResult.get("secure_url");
            return url != null ? url.toString() : null;
        } catch (IOException e) {
            log.error("Error al subir foto a Cloudinary", e);
            return null;
        }
    }
}
