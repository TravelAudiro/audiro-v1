package com.audiro.repository;

import java.sql.Timestamp;
import java.time.LocalDate;

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
public class TravelPlanDaoTest {

	@Autowired
	private TravelPlanDao travelPlanDao;
	
	@Test
	public void testInsertTravelPlanDao() {
		TravelPlan plan = TravelPlan.builder()
				.usersId(1)
				.title("JUnit test")
				.startDate(LocalDate.of(2020, 1, 8))
				.duration(2)
				.endDate(LocalDate.of(2020, 1, 8))
				.build();
		Long result = travelPlanDao.insertTravelPlan(plan);
		log.debug("result={}, id={}", 
				result,
				plan.getTravelPlanId());
	}
	
}
