package com.daniel.temia.application.dto.error;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApiError {
    private boolean success;
    private LocalDateTime timestamp;
    private int status;
    private String error;
    private String message;
    private String path;
}
