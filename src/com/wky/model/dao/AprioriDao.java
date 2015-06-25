package com.wky.model.dao;

import java.util.List;

import bean.Apriori;

public interface AprioriDao {
	public void addAprioriData(Apriori apriori);
	public List<Apriori> findAprioriByTime(String start,String end);
	public Apriori findAprioriById(int id);
}
