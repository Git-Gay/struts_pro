package model;

public class UserInfo {
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getBPhone() {
		return bPhone;
	}
	public void setBPhone(String bPhone) {
		this.bPhone = bPhone;
	}
	public String getRelationUser() {
		return relationUser;
	}
	public void setRelationUser(String relationUser) {
		this.relationUser = relationUser;
	}
	
	private String username;
	private String password;
	private String userImg;
	private String bPhone;
	private String relationUser;
	
}
