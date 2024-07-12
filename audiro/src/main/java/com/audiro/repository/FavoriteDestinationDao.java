package com.audiro.repository;

import java.util.List;
import com.audiro.dto.FavoriteDestinationDto;

public interface FavoriteDestinationDao {
	// views/favorite/list
	List<FavoriteDestination> selectFavoriteDestination();
	//views/travel/plan.jsp
	List<FavoriteDestinationDto> selectAllOrderById();
	//view/travel/plan.jsp
	FavoriteDestinationDto selectById(Integer favoriteDestinationId);
	

}
