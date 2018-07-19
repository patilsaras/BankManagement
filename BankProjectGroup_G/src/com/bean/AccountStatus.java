package com.bean;

import java.util.Date;

public class AccountStatus 
{
	private long accid;
	private long custid;
	private String acctype ;
	private String	status ;
	private String message ;
	private Date lastupdated ;
	
	public long getAccid() {
		return accid;
	}
	public void setAccid(long accid) {
		this.accid = accid;
	}
	public long getCustid() {
		return custid;
	}
	public void setCustid(long custid) {
		this.custid = custid;
	}
	
	public String getAcctype() {
		return acctype;
	}
	public void setAcctype(String acctype) {
		this.acctype = acctype;
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
