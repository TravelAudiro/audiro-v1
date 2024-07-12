package com.audiro.repository;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FavoriteDestination {
	private Integer favoriteDestinationId;
	private Integer usersId;
	private Integer destinationId;
	private String favoriteDestination;

}
