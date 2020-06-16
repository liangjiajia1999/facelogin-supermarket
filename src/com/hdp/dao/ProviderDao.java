package com.hdp.dao;

import java.util.List;

import com.hdp.dao.pojo.Provider;

public interface ProviderDao extends BaseDao<Provider> {
	int countByKey(String key);
	List<Provider> queryByKey(String key);
	List<Provider> queryByName(String pname);
	int countByName(String pname);
}
