package bean;

public class FoodClasses {
	private int foodClassID;
	private String foodClassName;
	private int parentFoodClassID;
	public int getFoodClassID() {
		return foodClassID;
	}
	public void setFoodClassID(int foodClassID) {
		this.foodClassID = foodClassID;
	}
	public String getFoodClassName() {
		return foodClassName;
	}
	public void setFoodClassName(String foodClassName) {
		this.foodClassName = foodClassName;
	}
	public int getParentFoodClassID() {
		return parentFoodClassID;
	}
	public void setParentFoodClassID(int parentFoodClassID) {
		this.parentFoodClassID = parentFoodClassID;
	}
}
