package com.hdp.dao;

import java.util.List;

import com.hdp.dao.pojo.Unit;

public interface UnitDao extends BaseDao<Unit> {
	int countByName(String uname);
	List<Unit> queryByName(String uname);
}
