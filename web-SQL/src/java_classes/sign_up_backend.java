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
	 public static void setFirstName(String fnIn)
	 {
		 first_name = fnIn;
	 }
	 public static void setSurname(String snIn)
	 {
		 surname = snIn;
	 }
	 public static void setusername(String userIn)
	 {
		 username = userIn;
	 }
	 public static void setpassword(String passIn)
	 {
		 password = passIn;
	 }
	 public static void setEmail(String emIn)
	 {
		 email = emIn;
	 }
	 public static void setPhoneNumber(String phoneIn)
	 {
		 phoneNumber = phoneIn;
	 }
	 public int getid()
	 {
		 return id;
	 }
	 public String getFirstName()
	 {
		 return first_name;
	 }
	 public String getSurname()
	 {
		 return surname;
	 }
	 public String getusername()
	 {
		 return username;
	 }
	 public String getpassword()
	 {
		 return password;
	 }
	 public String getEmail()
	 {
		 return email;
	 }
	 public String getPhoneNumber()
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
	  public static ArrayList<sign_up_backend> viewAllUsers()
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
	    public int updateRecord(int IDNoIn, String usernamein, String passwordin, String emailin, String PhoneNumin)   
	    {
	        int status = 0;
	        String sqlString="update signup set username=\'"+usernamein+"',password = '"+passwordin+"',email = '"+emailin+
	        		        "',phoneNumber = '"+PhoneNumin+"\' where id="+IDNoIn;
	        status = databaseUpdate(sqlString);                                            
	        return status;
	      
	     }
	public  static int databaseUpdate(String sqlUpdate)
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
