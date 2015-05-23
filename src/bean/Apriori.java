package bean;

import java.util.Date;

public class Apriori {
	private int id;
	private Date time;
	private String aprioriData;
	public synchronized int getId() {
		return id;
	}
	public synchronized void setId(int id) {
		this.id = id;
	}
	public synchronized Date getTime() {
		return time;
	}
	public synchronized void setTime(Date time) {
		this.time = time;
	}
	public synchronized String getAprioriData() {
		return aprioriData;
	}
	public synchronized void setAprioriData(String aprioriData) {
		this.aprioriData = aprioriData;
	}
}
