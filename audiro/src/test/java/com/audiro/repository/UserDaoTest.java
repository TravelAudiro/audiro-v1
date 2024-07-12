package com.audiro.repository;

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

public class UserDaoTest {

	@Autowired
	private UserDao userDao;
	
//	@Test
	public void testSelectById() {
		User user = userDao.selectById("id1");
		Assertions.assertNotNull(user);
		log.debug(user.toString());
		
		user = userDao.selectById("id100");
		Assertions.assertNull(user);
		log.debug("user is null");
	}
	
//	@Test
	public void testSelectByNickname() {
		User user = userDao.selectByNickname("nick1");
		Assertions.assertNotNull(user);
		log.debug(user.toString());
		
		user = userDao.selectByNickname("nick100");
		Assertions.assertNull(user);
		log.debug("user is null");
	}
	
//	@Test
	public void testSelectByPhone() {
		User user = userDao.selectByPhone("010-1234-1234");
		Assertions.assertNotNull(user);
		log.debug(user.toString());
		
		user = userDao.selectByPhone("010-9999-9999");
		Assertions.assertNull(user);
		log.debug("user is null");
	}
	
//	@Test
	public void testSelectByEmail() {
		User user = userDao.selectByEmail("email@gmail.com");
		Assertions.assertNotNull(user);
		log.debug(user.toString());
		
		user = userDao.selectByEmail("mail@gmail.com");
		Assertions.assertNull(user);
		log.debug("user is null");
	}
	
	@Test
	public void testInsert() {
		User user = User.builder()
				.id("insert-id")
				.passwordHash("insert-pw")
				.userName("insert-un")
				.nickname("insert-nn")
				.phone("insert-ph")
				.email("insert-em")
				.build();
		
		int result = userDao.insertUser(user);
		Assertions.assertEquals(1, result);
	}
}
