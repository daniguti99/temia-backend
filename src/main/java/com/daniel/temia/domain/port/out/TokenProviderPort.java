package com.daniel.temia.domain.port.out;

import com.daniel.temia.domain.model.Usuario;

public interface TokenProviderPort {
    String generateToken(Usuario usuario);
    long getExpirationMs();
    Usuario validateToken(String token);
}
