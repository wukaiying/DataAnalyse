package bean;

import java.util.Date;
import java.util.List;

public class Ann {
	private int id;
	private Date time;
	private String dataType;
	private String annForcastData;
	private double trainError;
	private int epoch;
	private String annStandard;
	private int index;   //list每一个数组的长度
	private int length;  //list的size()
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
	public synchronized String getAnnForcastData() {
		return annForcastData;
	}
	public synchronized void setAnnForcastData(String annForcastData) {
		this.annForcastData = annForcastData;
	}
	public synchronized String getAnnStandard() {
		return annStandard;
	}
	public synchronized void setAnnStandard(String annStandard) {
		this.annStandard = annStandard;
	}
	public synchronized int getIndex() {
		return index;
	}
	public synchronized void setIndex(int index) {
		this.index = index;
	}
	public synchronized int getLength() {
		return length;
	}
	public synchronized void setLength(int length) {
		this.length = length;
	}
}
