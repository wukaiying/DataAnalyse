package bean;

import java.util.Date;

public class AHP {
	private int id;
	private Date time;
	private String weightData;
	private String riskData;
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
	public synchronized String getWeightData() {
		return weightData;
	}
	public synchronized void setWeightData(String weightData) {
		this.weightData = weightData;
	}
	public synchronized String getRiskData() {
		return riskData;
	}
	public synchronized void setRiskData(String riskData) {
		this.riskData = riskData;
	}

}
