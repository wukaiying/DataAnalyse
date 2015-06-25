package bean;

import java.util.Date;
/**
 * @author wky
 * 
 */
public class AHP{
	private int id;
	private Date time;
	private String rowName;
	private String weight;
	private String colName;
	private String productRisk;
	private double productRiskSt;
	private String category;
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
	public synchronized String getRowName() {
		return rowName;
	}
	public synchronized void setRowName(String rowName) {
		this.rowName = rowName;
	}
	public synchronized String getWeight() {
		return weight;
	}
	public synchronized void setWeight(String weight) {
		this.weight = weight;
	}
	public synchronized String getColName() {
		return colName;
	}
	public synchronized void setColName(String colName) {
		this.colName = colName;
	}
	public synchronized String getProductRisk() {
		return productRisk;
	}
	public synchronized void setProductRisk(String productRisk) {
		this.productRisk = productRisk;
	}
	public synchronized double getProductRiskSt() {
		return productRiskSt;
	}
	public synchronized void setProductRiskSt(double productRiskSt) {
		this.productRiskSt = productRiskSt;
	}
	public synchronized String getCategory() {
		return category;
	}
	public synchronized void setCategory(String category) {
		this.category = category;
	}
	
	
	

}
