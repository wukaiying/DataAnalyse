package com.wky.model.dao;

import java.util.List;

import bean.Ann;

public interface AnnDao {
	public void addAnnData(Ann ann);
	public List<Ann> findAnnByTime(String start,String end);
	public Ann findAnnById(int id);
}
