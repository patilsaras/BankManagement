package com.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.bean.Account;
import com.bean.AccountStatus;
import com.bean.Customer;
import com.bean.CustomerStatus;
import com.bean.TransactionGroup_G;
import com.bean.UserStore;


import com.dao.Dao;

public class Service 
{
	private Dao bdao=new Dao();
	public UserStore searchuser(String uid,String pass)
	{
		return bdao.searchuser(uid,pass);
	}
	public long createcustomer(Customer c)
	{
		return bdao.createcustomer(c);
	}
	public Customer searchcustomerbyssnid(long ssnid)
	{
		return bdao.searchcustomerbyssnid(ssnid);
	}
	public long searchbyssnid(long ssnid)
	{
		return bdao.searchbyssnid(ssnid);
	}
	public Customer searchcustomerbycustid(long custid)
	{
		return bdao.searchcustomerbycustid(custid);
	}
	public long update(long custid,Customer c)
	{
		return bdao.update(custid,c);
	}
	public Customer search(long custid)
	{
		Dao cd= new Dao();
		Customer cs=cd.search(custid);
		return cs;
		
	}
	public boolean deleteacc(long custid)
	{
		
		Dao cd= new Dao();
		boolean flag=cd.deleteacc(custid);
		return flag;
	}
	public boolean deletecus(long custid)
	{
		Dao cd= new Dao();
		boolean flag=cd.deletecus(custid);
		return flag;
	}
	public long searchaccountid(long Customer_id)
	{
		Dao bd= new Dao();
		long l=bd.searchaccountid(Customer_id);
		return l;
	}
	
	public long searchaccountid2(long Account_id)
	{
		Dao bd= new Dao();

		long l=bd.searchaccountid2(Account_id);
		return l;
	}
	
	public ArrayList<Account> viewcustomer(long Customer_id)
	{
		Dao bd= new Dao();

		ArrayList<Account> a1=bd.viewcustomer( Customer_id);
		return a1;
	}
	 public Account viewdetails2(long Account_id)
	 {		Dao bd= new Dao();

		 Account a=bd.viewdetails2(Account_id);
		 return a;
	 }
	 public Account viewdetails(long Account_id,long Customer_id)
	 {
			Dao bd= new Dao();

		 Account a=bd.viewdetails(Account_id, Customer_id);
		 return a;
	 }
	 public double transfer(Account a0,Account a1,double amt,long sacc,long dacc)
		{
			return bdao.transfer(a0,a1,amt,sacc,dacc);
		}

	 public long createseq2() throws SQLException{
		 Dao d=new Dao();
		 return d.createseq();
	 }
	 public int addAccount(Account acc) throws SQLException{
		 Dao d=new Dao();
		 return d.addAccount(acc);
	 }
	 
	 public boolean delAccount(long id) throws SQLException{
		 Dao d=new Dao();
		 return d.deleteAccount(id);
	 }
	 
	 public Account searchAcc(long accId) throws SQLException{
		 Dao d=new Dao();
		 return d.searchAcc(accId);
	 }

	 public Account searchId(long id)
	 {
		 Account c= bdao.searchId(id);
		 return c;
	 }
	public boolean updateBalancedeposit(Account a1,double amt) {
		
		return bdao.updateBalancedeposit(a1,amt);
	}
public boolean updateBalancewithdraw(Account a1,double amt) {
		
		return bdao.updateBalancewithdraw(a1,amt);
	}
	public Customer viewCustomer(long cust) {
		return bdao.viewCustomer(cust);
	}
	public Customer viewCustomer1(long ssn) {
		return bdao.viewCustomer1(ssn);
	}
	public ArrayList<AccountStatus> view()
	{
		ArrayList<AccountStatus> ac= new ArrayList<AccountStatus>();
		Dao ad= new Dao();
		ac=ad.viewall();
		return ac;
	}
	public ArrayList<CustomerStatus> viewC()
	{
		ArrayList<CustomerStatus> ac= new ArrayList<CustomerStatus>();
		Dao ad= new Dao();
		ac=ad.viewallC();
		return ac;
	}
	public ArrayList<AccountStatus> view1()
	{
	
		Dao ad= new Dao();
		ArrayList<AccountStatus> ac= ad.viewcustomer();
		return ac;
		
	}
	public ArrayList<CustomerStatus> view1C()
	{
	
		Dao ad= new Dao();
		ArrayList<CustomerStatus> ac= ad.viewcustomerC();
		return ac;
		
	}
	public ArrayList<TransactionGroup_G> alltransaction(long accid,int n)
	{
		ArrayList<TransactionGroup_G> tr= new ArrayList<TransactionGroup_G>();
		Dao ad= new Dao();
		tr=ad.alltransaction(accid,n);
		return tr;

	}

	public ArrayList<TransactionGroup_G> alltransactionByDate(long accid,String sd, String ld) 
	{
		ArrayList<TransactionGroup_G> tr1= new ArrayList<TransactionGroup_G>();
		Dao ad= new Dao();
		tr1=ad.alltransactionByDate(accid,sd,ld);
		return tr1;

	}

	public boolean searchaccountstatus(long custid)
	{
		
		return bdao.searchaccountstatus(custid);
	}
	public boolean searchById(long accid) {
		Dao ad= new Dao();
		return ad.searchById(accid);
	}

}

