package com.audiro.repository;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration(
		locations = { "file:src/main/webapp/WEB-INF/application-context.xml" }
)

public class TravelDestinationDaoTest {
	
	@Autowired
	private TravelDestinationDao dao;
	
	@Test
	public void test() {
		List<TravelDestination> destinations = dao.selectNameAndImgUrlByTagsAndKeyword(null, null, null, null, 0, 15);
		Assertions.assertEquals(6, destinations.size());
		
		log.debug(destinations.toString());
	}
}
