package bean;

import java.util.Date;

public class Ann {
	private int id;
	private Date time;
	private String dataType;
	private String annData;
	private double trainError;
	private int epoch;
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
	public synchronized String getDataType() {
		return dataType;
	}
	public synchronized void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public synchronized String getAnnData() {
		return annData;
	}
	public synchronized void setAnnData(String annData) {
		this.annData = annData;
	}
	public synchronized double getTrainError() {
		return trainError;
	}
	public synchronized void setTrainError(double trainError) {
		this.trainError = trainError;
	}
	public synchronized int getEpoch() {
		return epoch;
	}
	public synchronized void setEpoch(int epoch) {
		this.epoch = epoch;
	}
}
