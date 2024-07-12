package com.audiro.repository;

import java.util.List;

public interface TravelDestinationDao {

	int saveAll(TravelDestination destination);
	
	List<TravelDestination> findAll();
	
}
