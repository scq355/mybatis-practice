package com.summary.mybatis.dao;

import com.summary.mybatis.bean.User;

import java.util.List;

/**
 * Created by scq on 2018-03-08 13:17:33
 */
public interface UserDao {
	User findUserById(Integer id);

	Integer insertUsers(List<User> users);
}
