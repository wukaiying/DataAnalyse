package bean;

/*
 * Author:wky
 * Description:字段组合，多表查询。
 * Date:1.12
 * */
public class XinwenBean {
	private int newsID;
	private String title;
	private String url;
	private String foodClassName;
	public synchronized int getNewsID() {
		return newsID;
	}
	public synchronized void setNewsID(int newsID) {
		this.newsID = newsID;
	}
	public synchronized String getTitle() {
		return title;
	}
	public synchronized void setTitle(String title) {
		this.title = title;
	}
	public synchronized String getUrl() {
		return url;
	}
	public synchronized void setUrl(String url) {
		this.url = url;
	}
	public synchronized String getFoodClassName() {
		return foodClassName;
	}
	public synchronized void setFoodClassName(String foodClassName) {
		this.foodClassName = foodClassName;
	}
}
