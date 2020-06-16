package com.hdp.dao;

import com.hdp.dao.pojo.User;

public interface UserDao extends BaseDao<User> {
	User login(String uid,String upassword);
	int countById(String uid);
}
