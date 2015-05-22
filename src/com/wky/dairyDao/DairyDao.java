package com.wky.dairyDao;

import java.util.List;

import bean.DairyBean;

/**
 * @author wky
 * @deprecated 关于dairy表的一切操作
 */
//找出dairy表中某元素含量的变化趋势
public interface DairyDao {
	public List<StringBuffer> findDairyByElemTop10(String elem);
	public List<StringBuffer> findDairyByElem(String elem);
	public StringBuffer getElemStandard(String elem);
}
