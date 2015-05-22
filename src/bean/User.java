package bean;

public class User {
	private int id;
	private String name;
	private String password;
	private int isAdmin;
	public synchronized int getId() {
		return id;
	}
	public synchronized void setId(int id) {
		this.id = id;
	}
	public synchronized String getName() {
		return name;
	}
	public synchronized void setName(String name) {
		this.name = name;
	}
	public synchronized String getPassword() {
		return password;
	}
	public synchronized void setPassword(String password) {
		this.password = password;
	}
	public synchronized int getIsAdmin() {
		return isAdmin;
	}
	public synchronized void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
}
