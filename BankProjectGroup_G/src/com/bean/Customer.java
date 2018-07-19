package com.bean;

public class Customer 
{
	private long custid;
	private long ssnid;
	private String name;
	private int age;
	private String address;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
