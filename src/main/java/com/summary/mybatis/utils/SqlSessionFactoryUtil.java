package com.summary.mybatis.utils;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

/**
 * Created by scq on 2018-03-08 10:47:12
 */
public class SqlSessionFactoryUtil {
	/**
	 * 获取SqlSessionFactory
	 */
	public static SqlSessionFactory getSqlSessionFactory() {
		String resource = "mybatis-config.xml";
		InputStream is = SqlSessionFactoryUtil.class.getClassLoader().getResourceAsStream(resource);
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
		return factory;
	}

	/**
	 * 获取SqlSession
	 */
	public static SqlSession getSqlSession() {
		return getSqlSessionFactory().openSession();
	}

	/**
	 * 获取SqlSession
	 * @param isAutoCommit true 表示创建的SqlSession对象在执行完SQL之后会自动提交事务
 	 *         			   false 表示创建的SqlSession对象在执行完SQL之后不会自动提交事务，这时就需要我们手动调用sqlSession.commit()提交事务
	 */
	public static SqlSession getSqlSession(boolean isAutoCommit) {
		return getSqlSessionFactory().openSession(isAutoCommit);
	}
}
