package com.hdp.dao;

import java.util.Date;
import java.util.List;

import com.hdp.dao.pojo.SaveRecord;

public interface SaveRecordDao extends BaseDao<SaveRecord> {
	List<SaveRecord> queryFromTo(String start,String end);
	int deleteToVip(String vip);
	int deleteToUser(String user);
}
