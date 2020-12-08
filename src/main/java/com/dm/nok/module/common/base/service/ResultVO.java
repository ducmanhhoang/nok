package com.dm.nok.module.common.base.service;

public class ResultVO {
	private boolean error;
	private Object data;
	private String message;
	
	public ResultVO(Object data) {
		this.data = data;
		this.error = false;
		this.message = null;
	}
	
	public ResultVO(boolean error, String message) {
		this.data = null;
		this.error = error;
		this.message = message;
	}
	
	public boolean isError() {
		return error;
	}
	public void setError(boolean error) {
		this.error = error;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
