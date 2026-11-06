package com.daniel.temia.infraestructure.adapter.out.ficheros;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.daniel.temia.domain.model.FotoPerfil;
import com.daniel.temia.domain.port.out.AlmacenFotoPort;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Slf4j
@Component
public class CloudinaryFotoAdapter implements AlmacenFotoPort {

    private static final Pattern VERSION_EN_URL = Pattern.compile("(?:^|/)v\\d+/");

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

    @Override
    public boolean eliminarFoto(String fotoUrl) {
        if (cloudinary == null || fotoUrl == null || fotoUrl.isBlank()) {
            return false;
        }

        String publicId = publicIdDesdeUrl(fotoUrl);
        if (publicId == null) {
            log.warn("No se pudo deducir el public_id de la foto: {}", fotoUrl);
            return false;
        }

        try {
            Map<?, ?> resultado = cloudinary.uploader().destroy(publicId, ObjectUtils.emptyMap());
            return "ok".equals(resultado.get("result"));
        } catch (IOException e) {
            log.error("Error al eliminar la foto de Cloudinary", e);
            return false;
        }
    }

    /**
     * Deduce el {@code public_id} a partir de la URL segura de Cloudinary.
     *
     * <p>La URL tiene la forma
     * {@code https://res.cloudinary.com/<cloud>/image/upload/v123/temia/avatares/<uuid>.jpg}.
     * Se eliminan las transformaciones, la versión y la extensión.</p>
     */
    private String publicIdDesdeUrl(String fotoUrl) {
        String marcador = "/upload/";
        int inicio = fotoUrl.indexOf(marcador);
        if (inicio < 0) {
            return null;
        }

        String ruta = fotoUrl.substring(inicio + marcador.length());
        int interrogacion = ruta.indexOf('?');
        if (interrogacion >= 0) {
            ruta = ruta.substring(0, interrogacion);
        }

        Matcher version = VERSION_EN_URL.matcher(ruta);
        if (version.find()) {
            ruta = ruta.substring(version.end());
        }

        int punto = ruta.lastIndexOf('.');
        if (punto > 0) {
            ruta = ruta.substring(0, punto);
        }

        return ruta.isBlank() ? null : ruta;
    }
}
