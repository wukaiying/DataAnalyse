package com.wky.model.factory;

import com.wky.model.dao.AHPDao;
import com.wky.model.daoImpl.AHPDaoImpl;

public class AHPDaoFactory {
	public static AHPDao getAprioriDaoInstance(){
		return new AHPDaoImpl();
	}
}
