package java_classes;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.Scanner;

public class sign_up_backend 
{
	private static int id;
	private static String first_name;
	private static String surname;
	private static String username;
	private static String password;
	private static String email;
	private static String phoneNumber;
	// JDBC driver name and database URL
	 static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	 static final String DB_URL = "jdbc:mysql://localhost/buy-sell-repeat";
	 private static Statement statement = null;
	 private static ResultSet resultSet;
	 public static sign_up_backend ConnectedUser;

	 //  Database credentials
	 static final String USER = "root";
	 static final String PASS = "password";
	 
	 public sign_up_backend(String fn, String sn, String user, String pass, String em, String phoneNum)
	 {

		 this.first_name = fn;
		 this.surname = sn;
		 this.username = user;
		 this.password = pass;
		 this.email = em;
		 this.phoneNumber = phoneNum;
	 }
	 public sign_up_backend(int id,String fn, String sn, String user, String pass, String em, String phoneNum)
	 {
         this.id =id;
		 this.first_name = fn;
		 this.surname = sn;
		 this.username = user;
		 this.password = pass;
		 this.email = em;
		 this.phoneNumber = phoneNum;
	 }
	 public sign_up_backend()
	 {
		 
	 }
	 protected static void setFirstName(String fnIn)
	 {
		 first_name = fnIn;
	 }
	 protected static void setSurname(String snIn)
	 {
		 surname = snIn;
	 }
	 protected static void setusername(String userIn)
	 {
		 username = userIn;
	 }
	 protected static void setpassword(String passIn)
	 {
		 password = passIn;
	 }
	 protected static void setEmail(String emIn)
	 {
		 email = emIn;
	 }
	 protected static void setPhoneNumber(String phoneIn)
	 {
		 phoneNumber = phoneIn;
	 }
	 protected int getid()
	 {
		 return id;
	 }
	 protected String getFirstName()
	 {
		 return first_name;
	 }
	 protected String getSurname()
	 {
		 return surname;
	 }
	 protected String getusername()
	 {
		 return username;
	 }
	 protected String getpassword()
	 {
		 return password;
	 }
	 protected String getEmail()
	 {
		 return email;
	 }
	 protected String getPhoneNumber()
	 {
		 return phoneNumber;
	 }
	 
	public static int add(sign_up_backend signin)
	{

			int status = 0;

			String sqlString= "insert into SignUp( first_name, surname,username, password, email, phoneNumber) values(\'"+signin.getFirstName()+ 
					"\', \'"+signin.getSurname()+ 
					"\', \'"+signin.getusername() + 
					"\', \'"+signin.getpassword() +
					"\', \'"+signin.getEmail() +
					"\', \'"+ signin.getPhoneNumber()+"\')";
			status = databaseUpdate(sqlString);
			System.out.print(sqlString);  
			return status;
		}
	  protected static ArrayList<sign_up_backend> viewAllUsers()
	  {
		  ArrayList<sign_up_backend> AllAdmins = new ArrayList<sign_up_backend>();
		  try{
			  Class.forName("com.mysql.jdbc.Driver");
			  Connection conn = DriverManager.getConnection(DB_URL,USER, PASS);
			  statement = conn.createStatement();
			  resultSet = statement.executeQuery("select * FROM signUp");
			  
			  while(resultSet.next ())
			  {
				  sign_up_backend nextUser = new sign_up_backend(resultSet.getInt("id"),
								                                 resultSet.getString("first_name"),
								                                 resultSet.getString("surname"),
								                                 resultSet.getString("username"),
								                                 resultSet.getString("password"),
								                                 resultSet.getString("email"),
								                                 resultSet.getString("phoneNumber"));
								     
				  AllAdmins.add(nextUser);
			  }
		  conn.close();
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		   return AllAdmins; 
		}
	    protected int updateRecord(int IDNoIn, String usernamein, String passwordin, String emailin, String PhoneNumin)   
	    {
	        int status = 0;
	        String sqlString="update signup set username=\'"+usernamein+"',password = '"+passwordin+"',email = '"+emailin+
	        		        "',phoneNumber = '"+PhoneNumin+"\' where id="+IDNoIn;
	        status = databaseUpdate(sqlString);                                            
	        return status;
	      
	     }
	protected  static int databaseUpdate(String sqlUpdate)
	{
		int status = 0;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
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
}
