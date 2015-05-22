package bean;

public class NewsFoodClass {
	private int newsID;
	private String foodClassID;
	private int titleFoodCount;
	private int foodCount;
	private String statTime;
	public synchronized int getNewsID() {
		return newsID;
	}
	public synchronized void setNewsID(int newsID) {
		this.newsID = newsID;
	}
	public synchronized String getFoodClassID() {
		return foodClassID;
	}
	public synchronized void setFoodClassID(String foodClassID) {
		this.foodClassID = foodClassID;
	}
	public synchronized int getTitleFoodCount() {
		return titleFoodCount;
	}
	public synchronized void setTitleFoodCount(int titleFoodCount) {
		this.titleFoodCount = titleFoodCount;
	}
	public synchronized int getFoodCount() {
		return foodCount;
	}
	public synchronized void setFoodCount(int foodCount) {
		this.foodCount = foodCount;
	}
	public synchronized String getStatTime() {
		return statTime;
	}
	public synchronized void setStatTime(String statTime) {
		this.statTime = statTime;
	}
}
