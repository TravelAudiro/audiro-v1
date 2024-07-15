package com.audiro.dto;

import java.time.LocalDateTime;

import lombok.Data;
@Data
public class CommnunityCommentsUpdateDto {
    private Integer commentsId;
    private String content;
    private Integer isPrivate;
    private LocalDateTime modifiedTime;
}
