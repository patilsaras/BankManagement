package com.bean;

import java.util.Date;

public class Account   {
	private long Customer_id ;
	private long Account_id ;
	private String Account_type ;
	private double Balance ;
	private Date CR_data ;
	private Date CR_last ;
	public long getCustomer_id() {
		return Customer_id;
	}
	public void setCustomer_id(long customer_id) {
		Customer_id = customer_id;
	}
	public long getAccount_id() {
		return Account_id;
	}
	public void setAccount_id(long account_id) {
		Account_id = account_id;
	}
	public String getAccount_type() {
		return Account_type;
	}
	public void setAccount_type(String account_type) {
		Account_type = account_type;
	}
	
	
	public double getBalance() {
		return Balance;
	}
	public void setBalance(double balance) {
		Balance = balance;
	}
	public Date getCR_data() {
		return CR_data;
	}
	public void setCR_data(Date cR_data) {
		CR_data = cR_data;
	}
	public Date getCR_last() {
		return CR_last;
	}
	public void setCR_last(Date cR_last) {
		CR_last = cR_last;
	}
	
	
	
}
