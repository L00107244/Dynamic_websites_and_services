package java_classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class AdminContact
{
  private int id;
  private String Department;
  private String message;
  
  static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
  static final String DB_URL ="jdbc:mysql://localhost/buy-sell-repeat";
  private static Statement statement = null;
  private static ResultSet resultSet = null;
  
  static final String User = "root";
  static final String pass ="password";
  
  public AdminContact(int idin, String departin, String mess)
  {
	  this.id = idin;
	  this.Department = departin;
	  this.message = mess;
  }
  public AdminContact(String department, String message)
  {
	  this.Department = department;
	  this.message = message;
  }
  public AdminContact()
  {
	  
  }
  public void setDepartment(String departin)
  {
	  this.Department = departin;
  }
  public void setMessage(String messageIn)
  {
	  this.message = messageIn;
  }
  public int getID()
  {
	  return id;
  }
  public String getDepartment()
  {
	  return Department;
  }
  public String getMessage()
  {
	  return message;
  }
  public static int add(AdminContact newMessage)
  {
	  int addStatus = 0;
	  
	  String sql = "insert into contact_admin( Department, message) values(\'"+newMessage.getDepartment()+
			  "\', \'"+newMessage.getMessage()+"\')";
	  
	  addStatus = databaseUpdate(sql);
	  return addStatus;
  }
	public static ArrayList<AdminContact>getMessageByDepartment(String Departin)
	{
	  AdminContact ac = new AdminContact();
	  ArrayList<AdminContact> arr = new ArrayList<AdminContact>();
	  try
	  {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(DB_URL,User,pass);
        statement=conn.createStatement();
        resultSet=statement.executeQuery("SELECT * FROM `contact_admin` WHERE Department ='"+Departin+"'");
        
        while ( resultSet.next() )      {
            ac = new AdminContact( resultSet.getInt("ID"),
          		            resultSet.getString("Department"),   
           		    	    resultSet.getString("message")); 
           		arr.add(ac);    	                  
         }   
         conn.close();
	  }
    catch (Exception e) {
        e.printStackTrace();
     }  
     return arr;
		
	}
  public static int databaseUpdate(String sqlUpdate)
  {
		int status = 0;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(DB_URL, User, pass);
			statement=conn.createStatement();
			status=statement.executeUpdate(sqlUpdate);
			conn.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return status;
  }
  @Override
  public String toString()
  {
	  return "ID: "+this.id+" Department: "+this.Department+" Message: "+this.message;
  }
}
