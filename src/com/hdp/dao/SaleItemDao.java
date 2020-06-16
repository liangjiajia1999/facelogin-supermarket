package com.hdp.dao;

import java.util.List;

import com.hdp.dao.pojo.SaleItem;

public interface SaleItemDao extends BaseDao<SaleItem> {
	List<SaleItem> queryFromTo(String start,String end);
	int deleteToSale(String sale);
	int deleteToProduct(String product);
}
