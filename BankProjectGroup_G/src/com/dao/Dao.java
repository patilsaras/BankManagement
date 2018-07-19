package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import com.bean.Account;
import com.bean.AccountStatus;
import com.bean.Customer;
import com.bean.CustomerStatus;
import com.bean.TransactionGroup_G;
import com.bean.UserStore;
import com.util.DatabaseUtil;

public class Dao 
{
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	public UserStore searchuser(String uid,String pass)
	{
		UserStore u1=new UserStore();
		try
		{
			
			con=DatabaseUtil.getConnection();
			ps=con.prepareStatement("select * from userstore where userid=? AND password=?");
			ps.setString(1, uid);
			ps.setString(2, pass);

			rs=ps.executeQuery();
			if(rs.next())
			{
			u1.setUserid(rs.getString(1));
			u1.setPassword(rs.getString(2));
			u1.setType(rs.getString(3));
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return u1;
	}
	public long searchbyssnid(long ssnid)
	{
		long res=0;
		try
		{
			con=DatabaseUtil.getConnection();
			ps=con.prepareStatement("select * from cust_status where ssnid=?");
			ps.setLong(1, ssnid);
			rs=ps.executeQuery();
			if(rs.next())
			{
				res=rs.getLong(2);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return res;
	}
	public long createcustomer(Customer c)
	{
		long custid=0;
		try
		{
			con=DatabaseUtil.getConnection();
			ps=con.prepareStatement("insert into customer_12345 values(seqcust.nextval,?,?,?,?)");
			ps.setLong(1,c.getSsnid());
			ps.setString(2,c.getName());
			ps.setInt(3,c.getAge());
			ps.setString(4, c.getAddress());
			int result=ps.executeUpdate();
			if(result==1)
			{
				ps=con.prepareStatement("select max(custid) from customer_12345");
				rs=ps.executeQuery();
				if(rs.next())
					custid=rs.getLong(1);
			}
			ps=con.prepareStatement("insert into cust_status values(?,?,'Created','Checked',default)");
			ps.setLong(1, custid);
			ps.setLong(2,c.getSsnid());
			ps.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return custid;
	}
	public Customer searchcustomerbyssnid(long ssnid)
	{
		Customer c=new Customer();
		try
		{
			con=DatabaseUtil.getConnection();
			ps=con.prepareStatement("select * from customer_12345 where ssnid=?");
			ps.setLong(1, ssnid);
			rs=ps.executeQuery();
			if(rs.next())
			{
				c.setCustid(rs.getLong(1));
				c.setSsnid(rs.getLong(2));
				c.setName(rs.getString(3));
				c.setAge(rs.getInt(4));
				c.setAddress(rs.getString(5));
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return c;
	}
	public Customer searchcustomerbycustid(long custid)
	{
		Customer c=new Customer();
		try
		{
			con=DatabaseUtil.getConnection();
			ps=con.prepareStatement("select * from customer_12345 where custid=?");
			ps.setLong(1, custid);
			rs=ps.executeQuery();
			if(rs.next())
			{
				c.setCustid(rs.getLong(1));
				c.setSsnid(rs.getLong(2));
				c.setName(rs.getString(3));
				c.setAge(rs.getInt(4));
				c.setAddress(rs.getString(5));
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return c;
	}
	public long update(long custid,Customer c )
	{
		long result=0;
		try
		{
			con=DatabaseUtil.getConnection();
			ps=con.prepareStatement("update customer_12345 set ssnid=?,name=?,age=?,address=? where custid=?");
			ps.setLong(1,c.getSsnid());
			ps.setString(2, c.getName());
			ps.setInt(3, c.getAge());
			ps.setString(4, c.getAddress());
			ps.setLong(5, custid);
			
			result=ps.executeUpdate();
			if(result==1)
				result=custid;
			ps=con.prepareStatement("update cust_status set status='Updated' where custid=?");
			ps.setLong(1, custid);
			ps.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return result;
	}
	public Customer search(long custid)
	{
		Customer cs = new Customer();
	String sql="select * from customer_12345 where custid=?";
	try {
		con=DatabaseUtil.getConnection();
		
		ps=con.prepareStatement(sql);
		ps.setLong(1,custid);
		rs=ps.executeQuery();
		if(rs.next())
		{
	
			cs.setCustid(custid);
			cs.setSsnid(rs.getInt(2));
			cs.setName(rs.getString(3));
			cs.setAge(rs.getInt(4));
			cs.setAddress(rs.getString(5));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally
	{
		DatabaseUtil.closeConnection(con);
	}
	return cs;
	}
	public boolean deleteacc(long custid)
	{
		boolean flag= false;
		
		con=DatabaseUtil.getConnection();
		String sql="delete account_12345 where custid=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setLong(1,custid);
			int res=ps.executeUpdate();
			if(res>0)
			{
				
				flag=true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return flag;
	}
	public boolean deletecus(long custid)
	{ 
		boolean flag1=false;
		con=DatabaseUtil.getConnection();
		String sql1="delete customer_12345 where custid=?";
		try {
			PreparedStatement ps1=con.prepareStatement(sql1);
			ps1.setLong(1, custid);
			int result=ps1.executeUpdate();
			if(result>0)
			{
				
				flag1=true;
			}
			ps=con.prepareStatement("update cust_status set status='Deleted' where custid=?");
			ps.setLong(1, custid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return flag1;
	}
	public long searchaccountid(long Customer_id)
	{
		long l=0;
		 con=DatabaseUtil.getConnection();
		   try {
			ps=con.prepareStatement("select custid from  account_12345  where custid=?");
			ps.setLong(1,Customer_id );
			rs=ps.executeQuery();
			while(rs.next())
			{
				 l=rs.getLong(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   return l;
	}
	public long searchaccountid2(long Account_id)
	{
		long l=0;
		 con=DatabaseUtil.getConnection();
		   try {
			ps=con.prepareStatement("select accid from  account_12345  where accid=?");
			ps.setLong(1,Account_id );
			rs=ps.executeQuery();
			if(rs.next())
			{
				 l=rs.getLong(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   return l;
	}
	public ArrayList<Account> viewcustomer(long Customer_id )
	{
		 ArrayList<Account> a1= new  ArrayList<Account>();
		 con=DatabaseUtil.getConnection();
		 try {
	ps=con.prepareStatement("select accid from account_12345 where custid=? ");
	ps.setLong(1,Customer_id);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Account a =new Account();
				a.setAccount_id(rs.getLong(1));
				a1.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally
		 {
			 DatabaseUtil.closeConnection(con);
			 
		 }
		 return a1;
	}
	 public Account viewdetails2(long Account_id)
	   {
		   Account a=new Account();
		   con=DatabaseUtil.getConnection();
		   try {
			ps=con.prepareStatement("select * from  account_12345  where  accid=?");
			ps.setLong(1,Account_id );
			rs=ps.executeQuery();
			if(rs.next())
			{
				a.setCustomer_id(rs.getLong(2));
				a.setAccount_id(rs.getLong(1));
				a.setAccount_type(rs.getString(3));
			    a.setBalance(rs.getDouble(4));
				a.setCR_data(rs.getDate(5));
				a.setCR_last(rs.getDate(6));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   return a;
	   }
	 public Account viewdetails(long Account_id,long Customer_id)
	   {
		   Account a=new Account();
		   con=DatabaseUtil.getConnection();
		   try {
			ps=con.prepareStatement("select * from  account_12345  where  accid=? and custid=?");
			ps.setLong(1,Account_id );
			ps.setLong(2, Customer_id);
			rs=ps.executeQuery();
			if(rs.next())
			{
				a.setCustomer_id(rs.getLong(2));
				a.setAccount_id(rs.getLong(1));
				a.setAccount_type(rs.getString(3));
			    a.setBalance(rs.getDouble(4));
				a.setCR_data(rs.getDate(5));
				a.setCR_last(rs.getDate(6));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   return a;
	   }
	 public double transfer(Account a0,Account a1,double amt,long sacc,long dacc)
		{
			double sb,db,res;
			double res1,res2;
			sb=db=res=res1=res2=0;
			con=DatabaseUtil.getConnection();
			try
			{
				ps=con.prepareStatement("select * from account_12345 where accid=?");
				ps.setDouble(1, sacc);
				rs=ps.executeQuery();
				if(rs.next())
					sb=rs.getDouble(4);
				ps=con.prepareStatement("select * from account_12345 where accid=?");
				ps.setDouble(1, dacc);
				rs=ps.executeQuery();
				if(rs.next())
					db=rs.getDouble(4);
				if(((a0.getAccount_type().equals("saving"))&&((sb-amt)>=500))||((a0.getAccount_type().equals("current"))&&(amt<sb)))
				{
					sb=sb-amt;
					db=db+amt;
					ps=con.prepareStatement("update account_12345 set balance=? where accid=?");
					ps.setDouble(1, sb);
					ps.setDouble(2, sacc);
					res1=ps.executeUpdate();
					ps=con.prepareStatement("update account_12345 set balance=? where accid=?");
					ps.setDouble(1, db);
					ps.setDouble(2, dacc);
					res2=ps.executeUpdate();
					ps=con.prepareStatement("insert into transaction_group_G values(transid.nextval,?,?,default,?,?,'transfer',?,?)");
					ps.setLong(1,sacc);
					ps.setString(2, a0.getAccount_type());
					ps.setLong(3, dacc);
					ps.setString(4, a1.getAccount_type());
					ps.setDouble(5, amt);
					ps.setDouble(6, sb);
					ps.executeUpdate();
					ps=con.prepareStatement("insert into transaction_group_G values(transid.nextval,?,?,default,?,?,'credit',?,?)");
					ps.setLong(1,dacc);
					ps.setString(2, a0.getAccount_type());
					ps.setLong(3,sacc );
					ps.setString(4, a1.getAccount_type());
					ps.setDouble(5, amt);
					ps.setDouble(6, db);
					ps.executeUpdate();
					
					ps=con.prepareStatement("update acc_status set message='Transaction' where accid=?");
					ps.setLong(1,sacc);
					ps.executeUpdate();
					ps=con.prepareStatement("update acc_status set message='Transaction' where accid=?");
					ps.setLong(1,dacc);
					ps.executeUpdate();
					
					res=1;
				}
				else
				{
					res=0;
				}
				
				
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				DatabaseUtil.closeConnection(con);
			}
			return res;
		}

	 
	 public long createseq() throws SQLException{
			Statement st=null;
			Connection con=null;
			ResultSet rs=null;
			 long id=-1;
			try{
				con=DatabaseUtil.getConnection();
				 st=con.createStatement();
				String sql2="select accid.NEXTVAL from dual ";
				rs=	st.executeQuery(sql2);	
				if(rs.next())
				 id = rs.getLong(1);
				
			}finally{
				con.close();
				st.close();
			}
			return id;
		}
	 public int addAccount(Account acc) throws SQLException{
			Connection con=null;
			 int id=-1;
			 long acid=0;
			PreparedStatement pst= null;
			//PreparedStatement pst2= null;
			try{
				con=DatabaseUtil.getConnection();
				String sq="select accid.nextval from dual";
				pst=con.prepareStatement(sq);
				rs=pst.executeQuery();
				if(rs.next())
				{
					acid=rs.getLong(1);
					acc.setAccount_id(acid);
				}
				String sql="INSERT INTO account_12345 VALUES(?,?,?,?,default,current_date)";
				pst=con.prepareStatement(sql);
				pst.setLong(1,acc.getAccount_id());
				pst.setLong(2,acc.getCustomer_id());
				pst.setString(3,acc.getAccount_type());
				pst.setDouble(4,acc.getBalance());
				int r= pst.executeUpdate();
				if(r>0){
					id=1;
					ps=con.prepareStatement("insert into acc_status values(?,?,?,'Active','Verified',default)");
					ps.setLong(1, acc.getCustomer_id());
					ps.setLong(2, acc.getAccount_id());
					ps.setString(3, acc.getAccount_type());
					ps.executeUpdate();
				}
			}finally{
				con.close();
				pst.close();
			}
			return id;
			}
	 
	 public boolean deleteAccount(long id) throws SQLException {
			Connection con=null;
			PreparedStatement pst= null;
			try{
				con=DatabaseUtil.getConnection();
				
				String sql="delete from account_12345 where accid=?";
				pst=con.prepareStatement(sql);
				pst.setLong(1,id);
				int r=pst.executeUpdate();
				if(r>0){
					ps=con.prepareStatement("update acc_status set status='Inactive' where accid=?");
					ps.setLong(1,id);
					ps.executeUpdate();
					return true;
				}
				
			}finally{
				
			}
			return false;
		}
	 
		public Account searchAcc(long accId) throws SQLException{
			
			Connection con=null;
			PreparedStatement pst= null;
			try{
				con=DatabaseUtil.getConnection();
				String sql="select * from account_12345 where accid=?";
				pst=con.prepareStatement(sql);
				pst.setLong(1,accId);
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
				Account a= new Account();
				a.setAccount_id(rs.getLong(1));
				a.setCustomer_id(rs.getLong(2));
				a.setAccount_type(rs.getString(3));
				a.setBalance(rs.getDouble(4));
				a.setCR_data(rs.getDate(5));
				a.setCR_last(rs.getDate(6));
				return a;
				}
			  }finally{
				con.close();
				pst.close();
			}
			return null;	
		}

	public Account searchId(long id) {
		
		con=DatabaseUtil.getConnection();
		Account a=new Account();
		String sql="select * from account_12345 where accid=?";
	    try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setLong(1, id);
			rs=ps.executeQuery();
			if(rs.next())
			{
				a.setAccount_id(rs.getLong(1));
				a.setAccount_type(rs.getString(3));
				a.setBalance(rs.getDouble(4));
				a.setCR_data(rs.getDate(5));
				a.setCR_last(rs.getDate(6));
			}
		} 
	    catch (SQLException e)
		{
			e.printStackTrace();
		}
		return a;
	}
	public boolean updateBalancedeposit(Account a1,double amt) 
	{
		con=DatabaseUtil.getConnection();
		String sql="update  account_12345 set balance=? where accid=?";
			PreparedStatement ps;
			try 
			{
				ps = con.prepareStatement(sql);
				ps.setDouble(1, a1.getBalance());
				ps.setLong(2, a1.getAccount_id());
				rs=ps.executeQuery();
				if(rs.next())
				{
					ps=con.prepareStatement("update acc_status set message='Deposit' where accid=?");
					ps.setLong(1,a1.getAccount_id());
					ps.executeUpdate();
					ps=con.prepareStatement("insert into transaction_group_G values(transid.nextval,?,?,default,0000,'xxxx','credit',?,?)");
					ps.setLong(1,a1.getAccount_id());
					ps.setString(2, a1.getAccount_type());
					ps.setDouble(3, amt);
					ps.setDouble(4, a1.getBalance());
					ps.executeUpdate();
					return true;
				}
			
		
			} catch (SQLException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			

		return false;
	}
	public boolean updateBalancewithdraw(Account a1, double amt) 
	{
		con=DatabaseUtil.getConnection();
		String sql="update  account_12345 set balance=? where accid=?";
			PreparedStatement ps;
			try 
			{
				ps = con.prepareStatement(sql);
				ps.setDouble(1, a1.getBalance());
				ps.setLong(2, a1.getAccount_id());
				rs=ps.executeQuery();
				if(rs.next())
				{
					ps=con.prepareStatement("update acc_status set message='Withdraw' where accid=?");
					ps.setLong(1,a1.getAccount_id());
					ps.executeUpdate();
					ps=con.prepareStatement("insert into transaction_group_G values(transid.nextval,?,?,default,0000,'xxxx','debit',?,?)");
					ps.setLong(1,a1.getAccount_id());
					ps.setString(2, a1.getAccount_type());
					ps.setDouble(3, amt);
					ps.setDouble(4, a1.getBalance());
					ps.executeUpdate();
					return true;
				}
			
			
			} catch (SQLException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			

		return false;
	}
	public Customer viewCustomer(long customerid)
	{
		Customer cust=new Customer();
		Connection con = DatabaseUtil.getConnection();
		String sql="select * from customer_12345 where custid=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1,customerid);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				cust.setCustid(rs.getLong(1));
				cust.setSsnid(rs.getLong(2));
				cust.setName(rs.getString(3));
				cust.setAge(rs.getInt(4));
				cust.setAddress(rs.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return cust;
	}
	public Customer viewCustomer1(long ssnid)
	{
		Customer cust1=new Customer();
		Connection con = DatabaseUtil.getConnection();
		String sql="select * from customer_12345 where ssnid=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1,ssnid);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				cust1.setCustid(rs.getLong(1));
				cust1.setSsnid(rs.getLong(2));
				cust1.setName(rs.getString(3));
				cust1.setAge(rs.getInt(4));
				cust1.setAddress(rs.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		System.out.println(cust1.getCustid());
		return cust1;
	}
	public ArrayList<AccountStatus> viewall()
	{
		
		ArrayList<AccountStatus> als=new ArrayList<AccountStatus>();
		con=DatabaseUtil.getConnection();
		String sql="select * from acc_status order by custid";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				AccountStatus ast= new AccountStatus();
				ast.setAccid(rs.getLong(2));
				ast.setCustid(rs.getLong(1));
				ast.setAcctype(rs.getString(3));
				ast.setStatus(rs.getString(4));
				ast.setMessage(rs.getString(5));
				ast.setLastupdated(rs.getDate(6));
				als.add(ast);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return als;
	}
	public ArrayList<CustomerStatus> viewallC()
	{
		
		ArrayList<CustomerStatus> als=new ArrayList<CustomerStatus>();
		con=DatabaseUtil.getConnection();
		String sql="select * from cust_status order by custid";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				CustomerStatus ast= new CustomerStatus();
				ast.setCustid(rs.getLong(1));
				ast.setSsnid(rs.getLong(2));
				ast.setStatus(rs.getString(3));
				ast.setMessage(rs.getString(4));
				ast.setLastupdated(rs.getDate(5));
				als.add(ast);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return als;
	}
	public ArrayList<AccountStatus> viewcustomer()
	{
	ArrayList<AccountStatus> as=new ArrayList<AccountStatus>();
		
		con=DatabaseUtil.getConnection();
		String sql="select * from acc_status order by custid";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				AccountStatus ast= new AccountStatus();
				ast.setAccid(rs.getLong(2));
				ast.setCustid(rs.getLong(1));
				ast.setAcctype(rs.getString(3));
				ast.setStatus(rs.getString(4));
				ast.setMessage(rs.getString(5));
				ast.setLastupdated(rs.getDate(6));
				as.add(ast);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return as;
	}
	  
	public ArrayList<CustomerStatus> viewcustomerC()
	{
	ArrayList<CustomerStatus> as=new ArrayList<CustomerStatus>();
		
		con=DatabaseUtil.getConnection();
		String sql="select * from cust_status order by custid";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				CustomerStatus ast= new CustomerStatus();
				ast.setSsnid(rs.getLong(2));
				ast.setCustid(rs.getLong(1));
				ast.setStatus(rs.getString(3));
				ast.setMessage(rs.getString(4));
				ast.setLastupdated(rs.getDate(5));
				as.add(ast);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return as;
	}
	public ArrayList<TransactionGroup_G> alltransaction(long accid,int n)
	{
		ArrayList<TransactionGroup_G> tr= new ArrayList<TransactionGroup_G>();
		
		con=DatabaseUtil.getConnection();
		String sql="SELECT TRANSID,ACCIDS,TRANSDATE,DESCR,AMOUNT,BALANCE FROM (SELECT TRANSID,ACCIDS,TRANSDATE,DESCR,AMOUNT,BALANCE from transaction_group_G WHERE ACCIDS=? ORDER BY TRANSDATE desc) where ROWNUM <=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setLong(1, accid);
			ps.setInt(2, n);
			rs=ps.executeQuery();
			while(rs.next())
			{
				TransactionGroup_G ts= new TransactionGroup_G();
				ts.setTransid(rs.getLong(1));
				ts.setAccids(rs.getLong(2));
				ts.setTransdate(rs.getTimestamp(3));
				ts.setDescr(rs.getString(4));
				ts.setAmount(rs.getDouble(5));
				ts.setBalance(rs.getDouble(6));
				tr.add(ts);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return tr;
	}

	public ArrayList<TransactionGroup_G> alltransactionByDate(long accid,String sd, String ld) 
	{
		ArrayList<TransactionGroup_G> tr1= new ArrayList<TransactionGroup_G>();
		
		/*
		String[] arrDate = sd.split("/");
		String month = arrDate[1];
		String day = arrDate[2];
		String year = arrDate[0];
		int d=Integer.parseInt(day);
		d--;
		day=Integer.toString(d);
		sd=year+"/"+month+"/"+day;
		
		String[] arrDate1 = ld.split("/");
		String month1 = arrDate1[1];
		String day1 = arrDate1[2];
		String year1 = arrDate1[0];
		int d1=Integer.parseInt(day1);
		d1++;
		day1=Integer.toString(d1);
		ld=year1+"/"+month1+"/"+day1;*/
		
		Calendar cal=Calendar.getInstance();
		try {
			cal.setTime(new SimpleDateFormat("yyyy/MM/dd").parse(sd));
			cal.add(Calendar.DATE, -1);
			sd=new SimpleDateFormat("yyyy/MM/dd").format(cal.getTime());
			cal.setTime(new SimpleDateFormat("yyyy/MM/dd").parse(ld));
			cal.add(Calendar.DATE, 1);
			ld=new SimpleDateFormat("yyyy/MM/dd").format(cal.getTime());
			
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		con=DatabaseUtil.getConnection();
		String sql="select TRANSID,ACCIDS,TRANSDATE,DESCR,AMOUNT,BALANCE FROM transaction_group_G WHERE ACCIDS=? and TRANSDATE BETWEEN TO_DATE(?, 'YYYY/MM/DD')AND TO_DATE(?, 'YYYY/MM/DD') ORDER BY TRANSDATE DESC";
	
			try {
				ps=con.prepareStatement(sql);
				ps.setLong(1, accid);
				ps.setString(2, sd);
				ps.setString(3, ld);
				rs=ps.executeQuery();
				while(rs.next())
				{
					TransactionGroup_G ts= new TransactionGroup_G();
					ts.setTransid(rs.getLong(1));
					ts.setAccids(rs.getLong(2));
					ts.setTransdate(rs.getTimestamp(3));
					ts.setDescr(rs.getString(4));
					ts.setAmount(rs.getDouble(5));
					ts.setBalance(rs.getDouble(6));
					tr1.add(ts);
				}
				
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
        return tr1;
	}

	public boolean searchaccountstatus(long custid)
	{
		boolean f=false;
		ArrayList<AccountStatus> ala=new ArrayList<AccountStatus>();
		try
		{
			con=DatabaseUtil.getConnection();
			ps=con.prepareStatement("select * from acc_status where status='Active' and custid=?");
			ps.setLong(1, custid);
			rs=ps.executeQuery();
			while(rs.next())
			{
				AccountStatus as=new AccountStatus();
				as.setAccid(rs.getLong(2));
				ala.add(as);
			}
			if(ala.size()==0)
				f=true;
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			DatabaseUtil.closeConnection(con);
		}
		return f;
	}
	public boolean searchById(long accid) 
	{
		con=DatabaseUtil.getConnection();
		Account a=new Account();
		String sql="select * from account_12345 where accid=?";
	    try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setLong(1, accid);
			rs=ps.executeQuery();
			if(rs.next())
			{
				return true;
				
			}
	    } 
	    catch (SQLException e)
		{
			e.printStackTrace();
		}
	    
		return false;
	}

}

