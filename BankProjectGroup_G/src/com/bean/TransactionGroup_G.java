package com.bean;


import java.util.Date;

public class TransactionGroup_G {
	private long transid;
	private long accids;
	private String acctypes;
	private Date transdate;
	private long accidd ;
	private String acctyped;
	private String descr ;
	private double amount;
	private double balance;
	public long getTransid() {
		return transid;
	}
	public void setTransid(long transid) {
		this.transid = transid;
	}
	public long getAccids() {
		return accids;
	}
	public void setAccids(long accids) {
		this.accids = accids;
	}
	public String getAcctypes() {
		return acctypes;
	}
	public void setAcctypes(String acctypes) {
		this.acctypes = acctypes;
	}
	public Date getTransdate() {
		return transdate;
	}
	public void setTransdate(Date transdate) {
		this.transdate = transdate;
	}
	public long getAccidd() {
		return accidd;
	}
	public void setAccidd(long accidd) {
		this.accidd = accidd;
	}
	public String getAcctyped() {
		return acctyped;
	}
	public void setAcctyped(String acctyped) {
		this.acctyped = acctyped;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	

}
