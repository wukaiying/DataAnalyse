package com.wky.model.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import bean.AHP;

public interface AHPDao{
	public void addAHPData(AHP ahp);
	public List<AHP> findAHPByTime(String start,String end);
	public AHP findAHPById(int id);
}
