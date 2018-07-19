package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.bean.Account;
import com.bean.AccountStatus;
import com.bean.Customer;
import com.bean.CustomerStatus;
import com.bean.TransactionGroup_G;
import com.bean.UserStore;

import java.text.ParseException;
import java.text.SimpleDateFormat;  
import com.service.Service;



public class Controller extends HttpServlet 
{
	static Logger logger = Logger.getLogger(Controller.class);
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		if(request.getParameter("action").equals("user"))
		{
			logger.info("the page has loaded");
			UserStore u=new UserStore();
		    String uid=request.getParameter("userid");
		    logger.debug("usser id passed"+uid);
			String pass=request.getParameter("password");
			HttpSession session=request.getSession(true);
			session.setAttribute("User",uid);
			Service ss=new Service();
		    u=ss.searchuser(uid,pass);
		    if(u.getUserid()==null || u.getPassword()==null || u.getType()==null)
		    {
		    	 request.setAttribute("message", "Please enter valid Id and password ");
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);	
		    }
		    else if(u.getUserid().equals(uid) && u.getPassword().equals(pass))
		    {
		    	if(u.getType().equalsIgnoreCase("executive"))
		    	{
		    		logger.info("executive log in");
					request.getRequestDispatcher("Executive.jsp").forward(request, response);
				}
		    	
				else if(u.getType().equalsIgnoreCase("teller"))
					request.getRequestDispatcher("Teller.jsp").forward(request, response);
		    		logger.info("Teller log in");
		    	
		    }
		    	   
			 
		}
		else if(request.getParameter("action").equals("home"))
		{
			
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
			request.getRequestDispatcher("BankHome.jsp").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
		}
		else if(request.getParameter("action").equals("menu"))
		{
			
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
				
			request.getRequestDispatcher("Executive.jsp").forward(request, response);
			logger.info("executive log in");
	
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);
				

			}
		}
		else if(request.getParameter("action").equals("menu1"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
			request.getRequestDispatcher("Teller.jsp").forward(request, response);
			logger.info("executive log in");
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
		}
		else if(request.getParameter("action").equals("createcustomer"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
			request.getRequestDispatcher("CreateCustomer.jsp").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
		}
		else if(request.getParameter("action").equals("createaccount"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
			request.getRequestDispatcher("SearchBeforeAccount.jsp").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
		}
		else if(request.getParameter("action").equals("updatecustomer"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
			request.getRequestDispatcher("UpdateCustomer.jsp").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
		}
		else if(request.getParameter("action").equals("deletecustomer"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			
			if(si!=null)
			{
			RequestDispatcher rd = request.getRequestDispatcher("delete.jsp");
			logger.info("customer deleted");
			rd.forward(request,response);
			
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);
				logger.info("Error occured while deleting ");

			}
		}
		
		else if(request.getParameter("action").equals("customercreation"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			
			if(si!=null)
			{
				Service s=new Service();
				long ssnid=Long.parseLong(request.getParameter("ssnid"));
				long sid=s.searchbyssnid(ssnid);
				if(sid==0)
				{
				Customer c=new Customer();
				c.setSsnid(Long.parseLong(request.getParameter("ssnid")));
				c.setName(request.getParameter("name"));
				c.setAge(Integer.parseInt(request.getParameter("age")));
				c.setAddress(request.getParameter("add1")+","+request.getParameter("add2")+","+request.getParameter("city")+","+request.getParameter("state"));
				long custid=s.createcustomer(c);
				
				
				if(custid>0)
				{
					request.setAttribute("message","Customer created with id "+custid);
					logger.info("new customer created");
					
					request.getRequestDispatcher("Result1.jsp").forward(request, response);
				}
				else
				{
					request.setAttribute("message","Sorry customer not created");
					logger.info("some error occured while creating new customer");
					request.getRequestDispatcher("Result1.jsp").forward(request, response);
				}
				}
				else
				{
					request.setAttribute("message", "This SSN ID was used previously");
					request.getRequestDispatcher("Result1.jsp").forward(request, response);
				}
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
			
		}
		
		else if(request.getParameter("action").equals("searchbeforeupdate"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
				if(request.getParameter("ssnid").equals("")==false)
				{
					long ssnid=Long.parseLong(request.getParameter("ssnid"));
					Service s=new Service();
					Customer c=s.searchcustomerbyssnid(ssnid);
					if(c.getName()!=null)
					{
						request.setAttribute("customerobj", c);
						request.getRequestDispatcher("UpdateFinal.jsp").forward(request, response);
					}
					else
					{
						request.setAttribute("message","Invalid credentials");
						request.getRequestDispatcher("Result1.jsp").forward(request, response);
					}
			  
			     }
				else if(request.getParameter("custid").equals("")==false)
				{
						long custid=Long.parseLong(request.getParameter("custid"));
						Service s=new Service();
						Customer c=s.searchcustomerbycustid(custid);
						if(c.getName()!=null)
						{
							request.setAttribute("customerobj", c);
							request.getRequestDispatcher("UpdateFinal.jsp").forward(request, response);
						}
						else
						{
							request.setAttribute("message","Invalid credentials");
							request.getRequestDispatcher("Result1.jsp").forward(request, response);
						}
				    
					
				}
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);		
			}
		  }	
		
			
			
		
		else if(request.getParameter("action").equals("updatefinal"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
		    {
				
				Customer cust=new Customer();
				cust.setCustid(Long.parseLong(request.getParameter("custid")));
				cust.setSsnid(Long.parseLong(request.getParameter("ssnid")));
				cust.setName(request.getParameter("name"));
				cust.setAddress(request.getParameter("address"));
				cust.setAge(Integer.parseInt(request.getParameter("age")));
				Service s=new Service();
				long custid=s.update(cust.getCustid(), cust);
				if(custid>0)
				{
					request.setAttribute("message","Customer updated with id : "+custid);
					request.getRequestDispatcher("Result1.jsp").forward(request, response);
				}
				else
				{
					request.setAttribute("message","Invalid id");
					request.getRequestDispatcher("Result1.jsp").forward(request, response);
				}
		    }
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
		}
		
		else if(request.getParameter("action").equals("deleteid"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
		    {
				long custid=Long.parseLong(request.getParameter("custid"));
				Service sc= new Service();
				Customer c=sc.search(custid);
				System.out.println(c.getName());
				if(c.getName()!=null)
				{
					request.setAttribute("search",c);
					RequestDispatcher rd = request.getRequestDispatcher("deleteid.jsp");
					rd.forward(request,response);
				}
				else
				{
					request.setAttribute("message","Customer not present");
					request.getRequestDispatcher("Result1.jsp").forward(request, response);
				}
		    }
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
				
		}
		else if(request.getParameter("action").equals("deleted"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
		    {
				long custid=Integer.parseInt(request.getParameter("ctid"));
				boolean c=false;
				Service sc= new Service();
				c=sc.searchaccountstatus(custid);
				if(c==true)
				{
					sc.deletecus(custid);
					request.setAttribute("message","Customer Deleted successfully");
					request.getRequestDispatcher("Result1.jsp").forward(request, response);
				}
				else
				{
					request.setAttribute("message","Customer cant't be deleted. He has existing account");
					request.getRequestDispatcher("Result1.jsp").forward(request, response);
				}
		    }
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
		}	
			


		else if(request.getParameter("action").equals("accountstatus"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
		    {
			RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);
		    }
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
			
		}
		else if(request.getParameter("action").equals("hidden1"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
		 if(si!=null)
		   {
				String s1=request.getParameter("Customer_ID");
				String s2=request.getParameter("Account_ID");
				if(s1==""&&s2!="")
				{
					long la=Long.parseLong(request.getParameter("Account_ID"));
					Service bs=new Service();
					long l2=bs.searchaccountid2(la);
					if(l2==la)
					{
						Service bs1=new Service();
	
						Account a=bs1.viewdetails2(la);
						request.setAttribute("obj", a);
						RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
						rd.forward(request, response);
				   }		
					else
					{
					request.setAttribute("msg", "Please enter correct Account Id");
					RequestDispatcher rd=request.getRequestDispatcher("fail.jsp");
					rd.forward(request, response);
					}
			    }
			
			   else if(s2==""&&s1!="")
			    {
					long lc=Long.parseLong(request.getParameter("Customer_ID"));
					Service bs=new Service();
					long l1=bs.searchaccountid(lc);
					if(l1==lc)
					{
					ArrayList<Account> a1= bs.viewcustomer(lc);
					request.setAttribute("obj1", a1);
					RequestDispatcher rd=request.getRequestDispatcher("view2.jsp");
					rd.forward(request, response);	
					}
					else
					{
						request.setAttribute("msg", "Please enter correct Customer Id");
						RequestDispatcher rd=request.getRequestDispatcher("fail.jsp");
						rd.forward(request, response);
					}
				
			    }
			 else if(s1!=""&&s2!="")
			  {
				long la=Long.parseLong(request.getParameter("Account_ID"));
				long lc=Long.parseLong(request.getParameter("Customer_ID"));
				Service bs=new Service();

				long l3=bs.searchaccountid2(la);
				long l4=bs.searchaccountid(lc);
				if(la==l3&&lc==l4)
				{
					Account a=bs.viewdetails(la, lc);
					request.setAttribute("obj", a);
					RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
					rd.forward(request, response);
				}
				else
				{
					RequestDispatcher rd=request.getRequestDispatcher("fail3.jsp");
					rd.forward(request, response);
				}
			}
		   }
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}	
			
		}
		else if(request.getParameter("action").equals("hidden3"))
		  {
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
		 if(si!=null)
		   {
			  long ln=Long.parseLong(request.getParameter("id"));
				Service bs=new Service();

			   Account a=bs.viewdetails2(ln);
				request.setAttribute("obj", a);
				RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
				rd.forward(request, response); 
		   }
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}	
		  }
		else if(request.getParameter("action").equals("Transfer"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
		 if(si!=null)
		   {
			long sb=(Long.parseLong(request.getParameter("sacc")));
			System.out.println(sb);
			request.setAttribute("sacc1", sb);
			request.getRequestDispatcher("Transfer.jsp").forward(request, response);
		   }
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}	
		}
		else if(request.getParameter("action").equals("transfer"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
		  if(si!=null)
		   {
				double amt=(Double.parseDouble(request.getParameter("amount")));
				long  sacc=(Long.parseLong(request.getParameter("sacc")));
				long  dacc=(Long.parseLong(request.getParameter("dacc")));
				Service ts=new Service();
				Account a0=ts.searchId(sacc);
				Account a1=ts.searchId(dacc);
				double olds=a0.getBalance();
				double oldd=a1.getBalance();
				request.setAttribute("olds", olds);
				request.setAttribute("oldd", oldd);
	
				
			if(a1.getAccount_id()==0 && a1.getAccount_type()==null && a1.getBalance()==0 && a1.getCR_data()==null && a1.getCR_last()==null )
		      {
				request.getRequestDispatcher("Invalidacc.jsp").forward(request, response);
		      }
		    else if(a1!=null)
		     {
				 double result=ts.transfer(a0,a1,amt, sacc, dacc);
				    
					Account a2=ts.searchId(sacc);
					Account a3=ts.searchId(dacc);
					request.setAttribute("accObj1", a2);
					request.setAttribute("accObj2", a3);
					if(a2.getAccount_id()==a3.getAccount_id())
					{
						request.getRequestDispatcher("Invalidacc.jsp").forward(request, response);
					}
				
					else if(result>0)
				   {
					request.setAttribute("message","Balance transfered");
					request.getRequestDispatcher("Result.jsp").forward(request, response);
				    }
				  else
				   {
					request.setAttribute("message","Insufficient balance");
					request.getRequestDispatcher("Result2.jsp").forward(request, response);
				   }
		    }

		}
		  else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);
			}	
		}
		
		else if(request.getParameter("action").equals("Withdraw"))

		{

			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
		  if(si!=null)
		   {
			long ac=Long.parseLong(request.getParameter("acc"));
			System.out.println(ac);
		    request.setAttribute("accid", ac);

            request.getRequestDispatcher("Withdraw.jsp").forward(request, response);
		   }
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}	
            

		}
		
		else if(request.getParameter("action").equals("with1"))
		{

			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
		   if(si!=null)
		   {
			long ac=Long.parseLong(request.getParameter("acc1"));
  
			Service bs=new Service();

			String amount=request.getParameter("amount");
			double amt=Double.parseDouble(amount);

			Account a1=new Account();
	
			a1=bs.searchId(ac);
			request.setAttribute("accObj", a1);

				if(a1.getAccount_id()==0 && a1.getAccount_type()==null && a1.getBalance()==0 && a1.getCR_data()==null && a1.getCR_last()==null)
				{
					request.getRequestDispatcher("Invalidacc.jsp").forward(request, response);
				}
				else if(a1!=null)
				{
						if(amt<0)
						{
							request.getRequestDispatcher("Negative.jsp").forward(request, response);
						}
						else if((a1.getAccount_type().equalsIgnoreCase("saving"))&&(a1.getBalance()-amt)>=500)
						{
							double oldbal=a1.getBalance();
							double newbal=oldbal-amt;
							a1.setBalance(newbal);
							boolean b=bs.updateBalancewithdraw(a1,amt);
							System.out.println(b);
							request.setAttribute("oldbal", oldbal);
							request.getRequestDispatcher("Withdraw1.jsp").forward(request, response);
						}
						else if((a1.getAccount_type().equals("current"))&&(amt<=a1.getBalance()))
						{
							double oldbal=a1.getBalance();
							double newbal=oldbal-amt;
							a1.setBalance(newbal);
							boolean b=bs.updateBalancewithdraw(a1,amt);
							System.out.println(b);
							request.setAttribute("oldbal", oldbal);
							request.getRequestDispatcher("Withdraw1.jsp").forward(request, response);
						}
						else
						{
							request.setAttribute("message","Insufficient balance");
							request.getRequestDispatcher("Result2.jsp").forward(request, response);
						}
				 }
		     }
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}	

		}
		else if(request.getParameter("action").equals("searchbeforeaccount"))
			
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
		   if(si!=null)
		   {
				Service ser = new Service();
				long id1=Long.parseLong(request.getParameter("CuID"));
				Customer c=ser.searchcustomerbycustid(id1);
				if(c.getName()==null)
				{
					request.setAttribute("message","Customer ID not present");
					request.getRequestDispatcher("Result1.jsp").forward(request, response);
				}
				else{
					request.setAttribute("custid11", id1);
					request.getRequestDispatcher("AddAccount.jsp").forward(request, response);
				}
				
			}
		   else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}	
		}

		else if(request.getParameter("action").equals("add2acc"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
		   if(si!=null)
		   {
			Service ser = new Service();
			long cId=Long.parseLong(request.getParameter("cucid"));
			String act=request.getParameter("cuat");
			double acs=Double.parseDouble((request.getParameter("bal")));
			Account ac= new Account();
			ac.setCustomer_id(cId);
			ac.setAccount_type(act);
			ac.setBalance(acs);
			try {
				System.out.println(ser.addAccount(ac));
				request.setAttribute("message","Account created with account id " +ac.getAccount_id());
				request.getRequestDispatcher("successwhenadded.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		    }
		   else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}	
		}
		else if(request.getParameter("action").equals("deleteaccount")){
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
		   if(si!=null)
		   {
			request.getRequestDispatcher("searchAccount.jsp").forward(request, response);
		   }
		   else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}	
		}
		else if(request.getParameter("action").equals("searchacc"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
		   if(si!=null)
		   {
			Service ser = new Service();			
			long aid=Long.parseLong(request.getParameter("searchaccunt"));
			System.out.println(aid);
		
				Account acc=new Account();
				try {
					acc = ser.searchAcc(aid);
					if(acc==null)
					{
						request.setAttribute("message","Account not present");
						request.getRequestDispatcher("Result1.jsp").forward(request, response);
					}
					else
					{
						request.setAttribute("acc", acc);
						request.getRequestDispatcher("searchedAccount.jsp").forward(request, response);
					}
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		   }
		   else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}	
		}
		else if(request.getParameter("action").equals("delete"))
		{
		HttpSession session =request.getSession(false);
		String si=(String)session.getAttribute("User");
		   if(si!=null)
		   {
			Service ser = new Service();
			long aid=Long.parseLong(request.getParameter("deletacc"));
			
			try {
				boolean b =ser.delAccount(aid);
				if(b==true){
					request.setAttribute("message","Account deleted with id "+aid);
					request.getRequestDispatcher("successDeleteaccount.jsp").forward(request, response);
				}
				else{
					request.getRequestDispatcher("erroronDelete.jsp").forward(request, response);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   }
		   else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}	
		}
	

		else if(request.getParameter("action").equals("Deposit"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
		if(si!=null)
		{
			long ac=Long.parseLong(request.getParameter("acc"));
			System.out.println(ac);
		    request.setAttribute("accid", ac);

		    request.getRequestDispatcher("Deposit.jsp").forward(request, response);
		 }
		   else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
		
		}
		else if(request.getParameter("action").equals("viewcustomer"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
		if(si!=null)
		{
			request.getRequestDispatcher("View1.jsp").forward(request, response);
		}
		else
		{
			request.getRequestDispatcher("BankHome.jsp").forward(request, response);

		}	   
		}
		else if(request.getParameter("action").equals("view1"))
		{
		HttpSession session =request.getSession(false);
		String si=(String)session.getAttribute("User");
		if(si!=null)
		{
			if(request.getParameter("customerID").equals("")==false)
			{
				long cust=Long.parseLong(request.getParameter("customerID"));
				Customer c1=new Customer();
				Service s1=new Service();
				c1=s1.viewCustomer(cust);
				if(c1.getName()!=null)
				{
					request.setAttribute("customer",c1);
			
					request.getRequestDispatcher("show.jsp").forward(request, response);
				}
				else
				{
					request.getRequestDispatcher("errorview.jsp").forward(request, response);
				}
	
			 }
			else if(request.getParameter("ssnid").equals("")==false)
			{
				long ssn=Long.parseLong(request.getParameter("ssnid"));
				Customer c2=new Customer();
				Service s1=new Service();
				c2=s1.viewCustomer1(ssn);
				if(c2.getName()!=null)
				{
					request.setAttribute("customer",c2);
					request.getRequestDispatcher("show.jsp").forward(request, response);
				}
				else
				{
					request.getRequestDispatcher("errorview.jsp").forward(request, response);
				}
	
			}
		}
		else
		{
			request.getRequestDispatcher("BankHome.jsp").forward(request, response);

		}	
    

		}
		else if(request.getParameter("action").equals("dep1"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
				long ac=Long.parseLong(request.getParameter("acc1"));
				Service bs=new Service();
				String amount=request.getParameter("amount");
				double amt=Double.parseDouble(amount);
	 			Account a1=new Account();
	 			a1=bs.searchId(ac);
				request.setAttribute("accObj", a1);
	
	
				if(a1.getAccount_id()==0 && a1.getAccount_type()==null && a1.getBalance()==0 && a1.getCR_data()==null && a1.getCR_last()==null)
				{
					request.getRequestDispatcher("Invalidacc.jsp").forward(request, response);
	
				}
				else if(a1!=null)
				{
					if(amt<0)
					{
						request.getRequestDispatcher("Negative.jsp").forward(request, response);
					}
					
						double oldbal=a1.getBalance();
						double newbal=oldbal+(amt);
						a1.setBalance(newbal);
						boolean b=bs.updateBalancedeposit(a1,amt);
						System.out.println(b);
						request.setAttribute("oldbal", oldbal);
						request.getRequestDispatcher("Deposit1.jsp").forward(request, response);
				
				}
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
		}
		else if(request.getParameter("action").equals("accountstatus1"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
			ArrayList<AccountStatus> ac= new ArrayList<AccountStatus>();
			Service sc= new Service();
			ac=sc.view();
			request.setAttribute("viewall",ac);
			RequestDispatcher rd = request.getRequestDispatcher("viewall.jsp");
			rd.forward(request,response);
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
			
		}
		else if(request.getParameter("action").equals("customerstatus"))
		{
		HttpSession session =request.getSession(false);
		String si=(String)session.getAttribute("User");
		if(si!=null)
		{
			ArrayList<CustomerStatus> ac= new ArrayList<CustomerStatus>();
			Service sc= new Service();
			ac=sc.viewC();
			request.setAttribute("viewallC",ac);
			RequestDispatcher rd = request.getRequestDispatcher("viewallC.jsp");
			rd.forward(request,response);
		}
		else
		{
			request.getRequestDispatcher("BankHome.jsp").forward(request, response);

		}
			
		}
		else if(request.getParameter("action").equals("view2"))
		{
			
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
			Service sc= new Service();
			ArrayList<AccountStatus> ac=sc.view1();
			request.setAttribute("view",ac);
			RequestDispatcher rd = request.getRequestDispatcher("viewall1.jsp");
			rd.forward(request,response);
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
		}
		else if(request.getParameter("action").equals("view2C"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
			Service sc= new Service();
			ArrayList<CustomerStatus> ac=sc.view1C();
			request.setAttribute("view",ac);
			RequestDispatcher rd = request.getRequestDispatcher("viewall1C.jsp");
			rd.forward(request,response);
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
		}
		else if(request.getParameter("action").equals("statement"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
			RequestDispatcher rd = request.getRequestDispatcher("transactionstatement1.jsp");
			rd.forward(request,response);
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}
		}
		
		else if(request.getParameter("action").equals("transactionState"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
				 if(request.getParameter("TransactionHistory").equals("ByNtrans"))
				{
					RequestDispatcher rd = request.getRequestDispatcher("transactionstatement.jsp");
					rd.forward(request,response);
				}
				if(request.getParameter("TransactionHistory").equals("ByDatetrans"))
				{
					RequestDispatcher rd = request.getRequestDispatcher("transactionStatByDate.jsp");
					rd.forward(request,response);
	
				}
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}	

		}
		else if(request.getParameter("action").equals("searchacc1"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
			Service sc= new Service();
			long accid=Long.parseLong(request.getParameter("searchaccunt"));
			int n=Integer.parseInt(request.getParameter("tran"));
			 boolean b=sc.searchById(accid);
			if(b!=true)
			{
				request.setAttribute("message","Account Id not present");
				request.getRequestDispatcher("Result2.jsp").forward(request, response);
			}
			ArrayList<TransactionGroup_G> tr=new ArrayList<TransactionGroup_G>();
			tr=sc.alltransaction(accid,n);
			request.setAttribute("TranList",tr);
			request.getRequestDispatcher("Ministatment.jsp").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}	
			
		}
		else if(request.getParameter("action").equals("searchacc11"))
		{
			HttpSession session =request.getSession(false);
			String si=(String)session.getAttribute("User");
			if(si!=null)
			{
				Service sc= new Service();
				long accid=Long.parseLong(request.getParameter("searchaccunt"));
			    boolean b=sc.searchById(accid);
				if(b!=true)
				{
					request.setAttribute("message","Account Id not present");
					request.getRequestDispatcher("Result2.jsp").forward(request, response);
				}
	
	
				String s=request.getParameter("sdate");
				String s1=request.getParameter("ldate");
				
				ArrayList<TransactionGroup_G> tr1=new ArrayList<TransactionGroup_G>();
				tr1=sc.alltransactionByDate(accid,s,s1);
				request.setAttribute("TranList",tr1);
				request.getRequestDispatcher("Ministatment.jsp").forward(request, response);
			
			}
			else
			{
				request.getRequestDispatcher("BankHome.jsp").forward(request, response);

			}	
				
		 } 
		else if(request.getParameter("action").equals("home1"))
			{
			 HttpSession session=request.getSession(false);
			 session.invalidate();
			 request.getRequestDispatcher("BankHome.jsp").forward(request, response);
			

			}

			

			

		

		}
}



