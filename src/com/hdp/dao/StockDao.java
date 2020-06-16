package com.hdp.dao;

import java.util.List;

import com.hdp.dao.pojo.Stock;

public interface StockDao extends BaseDao<Stock> {
	List<Stock> queryFromTo(String start,String end);
	int deleteToProduct(String product);
	int deleteToProvider(int provider);
}
