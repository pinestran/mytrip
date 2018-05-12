package com.thongtv.model;

public class User {
	
	private String userName;
	private String email;
	private String comment;
	
	public User() {
		super();
	}

	public User(String userName, String email, String comment) {
		super();
		this.userName = userName;
		this.email = email;
		this.comment = comment;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
