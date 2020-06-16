package com.hdp.dao;

import java.util.List;

import com.hdp.dao.pojo.Sale;

public interface SaleDao extends BaseDao<Sale> {
	List<Sale> queryFromTo(String start,String end);
	int deleteToUser(String user);
	int deleteToVip(String vip);
}
