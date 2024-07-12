package com.audiro.dto;

import lombok.Data;

@Data
public class TopDestinationDto {
	private Integer travelDestinationId;
	private String name;
	private String address;
	private String imgUrl;
	private Integer num_favorites;
	private Integer rank;
}
