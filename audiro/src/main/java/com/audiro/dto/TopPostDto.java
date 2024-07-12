package com.audiro.dto;

import lombok.Data;

@Data
public class TopPostDto {
	private Integer postId;
	private Integer usersId;
	private String postTypeId;
	private String title;
	private String content;
	private Integer good;
	
	private Integer num_favorites;
	private Integer rank;
}
