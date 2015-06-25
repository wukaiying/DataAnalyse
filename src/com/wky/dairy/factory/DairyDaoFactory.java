package com.wky.dairy.factory;

import com.wky.dairyDao.DairyDao;
import com.wky.dairyDaoImpl.DairyDaoImpl;

public class DairyDaoFactory {
	public static DairyDao getDairyDaoInstance(){
		return new DairyDaoImpl();
	}
}
