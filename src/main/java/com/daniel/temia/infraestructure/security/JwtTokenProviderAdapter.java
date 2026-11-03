package com.daniel.temia.infraestructure.security;

import com.daniel.temia.domain.model.Role;
import com.daniel.temia.domain.model.Usuario;
import com.daniel.temia.domain.port.out.TokenProviderPort;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Date;

@Component
public class JwtTokenProviderAdapter implements TokenProviderPort {

    private final SecretKey secret;
    private final long expirationMs;

    public JwtTokenProviderAdapter(@Value("${jwt.secret}") String secret,
                                   @Value("${jwt.expiration-ms}") long expirationMs) {
        this.secret = Keys.hmacShaKeyFor(Decoders.BASE64.decode(secret));
        this.expirationMs = expirationMs;
    }

    @Override
    public String generateToken(Usuario usuario) {
        Date now = new Date();
        return Jwts.builder()
                .subject(String.valueOf(usuario.getId()))
                .claim("email", usuario.getEmail())
                .claim("username", usuario.getUsername())
                .claim("role", usuario.getRole() != null ? usuario.getRole().name() : Role.USER.name())
                .issuedAt(now)
                .expiration(new Date(now.getTime() + expirationMs))
                .signWith(secret)
                .compact();
    }

    @Override
    public long getExpirationMs() {
        return expirationMs;
    }

    @Override
    public Usuario validateToken(String token) {
        Claims claims = Jwts.parser()
                .verifyWith(secret)
                .build()
                .parseSignedClaims(token)
                .getPayload();

        return Usuario.builder()
                .id(Long.valueOf(claims.getSubject()))
                .email(claims.get("email", String.class))
                .username(claims.get("username", String.class))
                .role(Role.valueOf(claims.get("role", String.class)))
                .build();
    }
}
