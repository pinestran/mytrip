package com.thongtv.model;

/***
 * 
 * @author thong.tv
 *
 */

public class Result {
	private int type;
	private String message;
	
	
	public Result() {	}
	
	public Result(int type, String message) {
		this.type = type;
		this.message = message;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
