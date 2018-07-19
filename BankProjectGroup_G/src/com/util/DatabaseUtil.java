package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DatabaseUtil 
{
	private static final String url="jdbc:oracle:thin:@intvmoradb04:1521:ORAJAVADB";
	private static final String username="TVM1718_TVM05_TJA27_DEV";
	private static final String password="tcstvm05";
	private static final String driver="oracle.jdbc.driver.OracleDriver";
	
	public static Connection getConnection()
	{
		Connection con=null;
		try
		{
			Class.forName(driver);
			con=DriverManager.getConnection(url,username, password);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		return con;
	}
	public static void closeConnection(Connection con)
	{
		if(con!=null)
		{
			try
			{
				con.close();
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
	}
	
	}

