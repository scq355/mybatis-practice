package com.summary.mybatis;

import com.summary.mybatis.bean.User;
import com.summary.mybatis.dao.UserDao;
import com.summary.mybatis.utils.SqlSessionFactoryUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by scq on 2018-03-08 13:20:45
 */
public class UserTest {
	private static Logger LOGGER = LoggerFactory.getLogger(UserTest.class);

	private static SqlSession sqlSession;

	@Before
	public void setUp() {
		LOGGER.info("方法执行前调用...");
		sqlSession = SqlSessionFactoryUtil.getSqlSession();
	}

	@Test
	public void UserDaoTest() {
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		User user = userDao.findUserById(2);
		LOGGER.info("获取的用户信息: {}", user.toString());
	}


	@Test
	public void insertListTest() {
		List<User> users = new ArrayList<>();
		User user;
		for (int i = 0; i < 10; i++) {

			 user = new User("scq35" + i, "scq" + i, "123456",
					"18710755118", "nwpuscq355@163.com", 1,
					"avatar" + i + ".png", "192." + i + ".0." + i, new Date(), new Date());
			 users.add(user);
		}

		users.stream().forEach(System.out::println);
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		Integer res = userDao.insertUsers(users);
		System.out.println(res);
	}

	@After
	public void tearDown() {
		LOGGER.info("方法执行后调用...");
		sqlSession.close();
	}
}
