package com.wky.model.factory;

import com.wky.model.dao.AnnDao;
import com.wky.model.daoImpl.AnnDaoImpl;

public class AnnDaoFactory {
	public static AnnDao getAnnDaoInstance(){
		return new AnnDaoImpl();
	}
}
