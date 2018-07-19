package com.bean;

import java.util.Date;

public class CustomerStatus
{
	private long custid;
	private long ssnid;
	private String status; 
	private String message;
	private Date lastupdated;
	public long getCustid() {
		return custid;
	}
	public void setCustid(long custid) {
		this.custid = custid;
	}
	public long getSsnid() {
		return ssnid;
	}
	public void setSsnid(long ssnid) {
		this.ssnid = ssnid;
	}
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getLastupdated() {
		return lastupdated;
	}
	public void setLastupdated(Date lastupdated) {
		this.lastupdated = lastupdated;
	}
	
}
