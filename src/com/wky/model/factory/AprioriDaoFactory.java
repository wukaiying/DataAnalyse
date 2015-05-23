package com.wky.model.factory;

import com.wky.model.dao.AprioriDao;
import com.wky.model.daoImpl.AprioriDaoImpl;

public class AprioriDaoFactory {
	public static AprioriDao getAprioriDaoInstance(){
		return new AprioriDaoImpl();
	}

}
