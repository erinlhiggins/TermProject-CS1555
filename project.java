//jdbc for project

import java.sql.*;  
import java.text.ParseException;
import java.util.Scanner;
import java.util.Calendar;

public class project {
    private static Connection connection; 
    private Statement statement; 
    private PreparedStatement prepStatement; 
    private ResultSet resultSet; 
    private String query;  
	private String fname;
	private String lname;
	private int x;
	private int k;
	
	
	public project(int question_no) {
	
	switch ( question_no) {
	case 1:
	    createUser();
	    break;
	//case 2:
	   // initiateFriendship();
	    //break;
	case 3:
	   establishFriendship();
	    break;
	//case 4:
	  //  displayFriends();
	    //break;
	case 5: 
	  createGroup();
	   break;
	//case 6:
	  //  addToGroup();
	    //break; 
	case 7:
	  sendMessageTouser();
	    break;
	//case 8:
	  //  sendMessageToGroup();
	    //break;
	case 9: 
	   displayMessages();
	   break;
	//case 10:
	  //  displayNewMessages();
	    //break;
	case 11:
	  searchForUser();
	  break;
	 //case 12:
	  // threeDegrees();
	   // break;
	case 13:
		topMessages(x, k);
		break;
    //case 14:
	  //  dropUser();
	    //break;
	default:
	    System.out.println("Example not found for your entry: " + question_no);
	    try {
		connection.close();
	    }
	    catch(Exception Ex)  {
		System.out.println("Error connecting to database.  Machine Error: " +
				   Ex.toString());
	    }
	    break;
	}
			
    }
	public void createUser(){
		try{
	
	    query = "insert into Profiles values (?,?,?,?,?,?)";
	    prepStatement = connection.prepareStatement(query);
		int id = 111;
	    String user = "Zac Efron";
	    String email = "Zacattack@gmail.com";
		
	  
	    java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
	    java.sql.Date date_reg = new java.sql.Date (df.parse("1989-05-13").getTime());
	    java.sql.Timestamp lastlogin  = new java.sql.Timestamp(new java.util.Date().getTime());
	    
		
	    String group = "NULL";
	    
		prepStatement.setInt(1,id);
	    prepStatement.setString(2, user); 
	    prepStatement.setString(3, email);
	    prepStatement.setDate(4, date_reg);
		prepStatement.setTimestamp(5,lastlogin);
		prepStatement.setString(6,group);
	    
	    prepStatement.executeUpdate();
		System.out.println("Adding: " + id + " " + user +  " " + email + " " + date_reg + " " + lastlogin + " " + group + " " + "to Profiles");
		}
	catch(SQLException Ex) {
	    System.out.println("Error running the sample queries.  Machine Error: " +
			       Ex.toString());
	} catch (ParseException e) {
		System.out.println("Error parsing the date. Machine Error: " +
		e.toString());
	}
	finally{
		try {
			if (statement != null) statement.close();
			if (prepStatement != null) prepStatement.close();
		} catch (SQLException e) {
			System.out.println("Cannot close Statement. Machine error: "+e.toString());
		}
	}
	}
	
 //FUNCTION 2 : initiateFriendship


 
	
	
	//Function 3 : establishFriendship

	public void establishFriendship(){
		try{
		
		  query = "UPDATE Friendships" +  "SET request = ? WHERE nameofuser = ?";
		  prepStatement = connection.prepareStatement(query);
		  System.out.println("here1");
		  
		  
		  int request = 0;
		  String nameofuser = "Harry Styles";
		  
		  
			prepStatement.setInt(1,request);
			prepStatement.setString(2,nameofuser);
			
			
			System.out.println("here3");
			
			 prepStatement.executeUpdate();
	         System.out.println("here5");
		  
			
		
			//query = "update Friendships SET status = friends" + "where nameofuser = Harry Styles";
			//int result1 = statement.executeUpdate(query);
			
			
		}
		catch(Exception Ex)  
	{
		System.out.println("Machine Error: " +
				   Ex.toString());
	}
	finally{
		try {
			if (statement!=null) statement.close();
		} catch (SQLException e) {
			System.out.println("Cannot close Statement. Machine error: "+e.toString());
		}
	}	
		
	}
	
	//FUNCTION 4: displayFriends
	
	
	
	
	//Function 5 : CreateGroup
public void createGroup(){
	try{
		
		query = "insert into Groups values(?,?,?,?)";
		
		prepStatement = connection.prepareStatement(query);
      
	    String subject = "Ski Club";
	    String description = "Snow lovers";
		int members = 5;
		String memberlist = "Lena Ortmann, Eric Egler, Tommy Becker, Eli Becker, Bridget Egler";
	
	    prepStatement.setString(1, subject); 
	    prepStatement.setString(2, description);
	    prepStatement.setInt(3, members);
		prepStatement.setString(4,memberlist);
	    prepStatement.executeUpdate();
		
		System.out.println("Adding: " + subject +  " " + description + " " + members + " " + memberlist + " " + "to Groups");
		
		}
		
		catch(SQLException Ex) {
	    System.out.println("Error running the sample queries.  Machine Error: " +
			       Ex.toString());
	}
	finally{
		try {
			if (statement != null) statement.close();
			if (prepStatement != null) prepStatement.close();
		} catch (SQLException e) {
			System.out.println("Cannot close Statement. Machine error: "+e.toString());
		}
	}
		
}

//FUNCTION 6: addToGroup




//Function 7 : sendMessageTouser
public void sendMessageTouser(){
	try{
		query = "insert into Messages values(?,?,?,?,?,?)";
		System.out.println("here1");
		prepStatement = connection.prepareStatement(query);
      System.out.println("here2");
	    String subject = "Workout";
		System.out.println("here3");
	    String textmsg = "Wanna workout at 7 tomorrow?";
		System.out.println("here4");
		String sender = "Lena Ortmann";
		System.out.println("here5");
		String recipient= "Hannah Barton";
		System.out.println("here6");
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
	    java.sql.Date datereg = new java.sql.Date (df.parse("2016-05-13").getTime());
		System.out.println("here7");
		int groupmsg = 0;
		System.out.println("here8");
	
	    prepStatement.setString(1, subject); 
		System.out.println("here9");
	    prepStatement.setString(2, textmsg);
		System.out.println("here10");
	    prepStatement.setString(3, sender);
		System.out.println("here11");
		prepStatement.setString(4,recipient);
		System.out.println("here12");
		prepStatement.setDate(5,datereg);
		System.out.println("here13");
		prepStatement.setInt(6,groupmsg);
		System.out.println("here14");
		 prepStatement.executeUpdate();
		System.out.println("here15");
		System.out.println("Adding: " + subject +  " " + textmsg + " " + sender + " " + recipient + " " + datereg + " " + groupmsg + " " + "to Messages");
		System.out.println("here16");
		resultSet.close();
		}
		
		catch(SQLException Ex) {
	    System.out.println("Error running the sample queries.  Machine Error: " +
			       Ex.toString());
				   
	}
	catch (ParseException e) {
		System.out.println("Error parsing the date. Machine Error: " +
		e.toString());
	}
	finally{
		try {
			if (statement != null) statement.close();
			if (prepStatement != null) prepStatement.close();
		} catch (SQLException e) {
			System.out.println("Cannot close Statement. Machine error: "+e.toString());
		}
	}
}

//FUNCTION 8: sendMessageToGroup




//Function 9 : displayMessages
public void displayMessages(){
	try{
		
		int counter = 1;
		
		statement = connection.createStatement();
		 System.out.println("here1");
		query = "SELECT textmsg from Messages where recipient = Lena Ortmann";
		 System.out.println("here2");    
		resultSet = prepStatement.executeQuery(query) ;  
		 System.out.println("here3");
		 
		 while (resultSet.next()) //exists but moves us forward to the first record
	    {
		    System.out.println("Record " + counter + ": ");
		    String text = resultSet.getString(("textmsg") + ", " );//since the first item was of type
		    counter++;
	    } 
		resultSet.close();

}
catch(SQLException Ex) {
	    System.out.println("Error running the sample queries.  Machine Error: " +
			       Ex.toString());
	}
	
	finally{
		try {
			if (statement != null) statement.close();
			if (prepStatement != null) prepStatement.close();
		} catch (SQLException e) {
			System.out.println("Cannot close Statement. Machine error: "+e.toString());
		}
	}

}


//FUNCTION 10: displayNewMessages

//Question 11: searchForUser
public void searchForUser()
{ 
Scanner scanner = new Scanner(System.in);

	try{
		int counter = 1;
		
		query = "select username from Profiles where username = ?";
		prepStatement = connection.prepareStatement(query);
		
		
		System.out.println("here1");
		System.out.println("Enter name");
		String fname = scanner.next();
		
		
		System.out.println("here2");
	
		prepStatement.setString(1, fname); 
		System.out.println("here3");
	    resultSet = prepStatement.executeQuery();
		
		 
		 while (resultSet.next()) //exists but moves us forward to the first record
	    {
		    System.out.println( "counter: ");
		    String text = resultSet.getString("username");
			System.out.println(text);
		    counter++;
	    } 
		resultSet.close();
		
	
		System.out.println("here4");
		}
	
	
	catch(SQLException Ex) {
	    System.out.println("Error running the sample queries.  Machine Error: " +
			       Ex.toString());
	}
	
	finally{
		try {
			if (statement != null) statement.close();
			if (prepStatement != null) prepStatement.close();
		} catch (SQLException e) {
			System.out.println("Cannot close Statement. Machine error: "+e.toString());
		}
	}

}

//FUNCTION  12: threeDegrees


 
//Question 13: topMessages
public void topMessages(int x, int k)
{
	try
	{
		int counter = 1;
		statement = connection.createStatement();
		Calendar calendar = Calendar.getInstance();
		java.util.Date currentDate = calendar.getTime();
	    //java.sql.Date date_reg = new java.sql.Date (df.getTime());
		
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -k);
		
				
		query = "SELECT from Messages where dateofmsg between cal and currentDate ";
		resultSet = prepStatement.executeQuery(query) ; 
		
		 
		 while (resultSet.next()) //exists but moves us forward to the first record
	    {
		    System.out.println( "counter: ");
		    Date dateofmsg = resultSet.getDate("dateofmsg");
			System.out.println(dateofmsg);
		    counter++;
	    } 
		resultSet.close();
		
		
		query = "SELECT textmsg,sender,recipient from Messages";
		resultSet = prepStatement.executeQuery(query);
		
		
		 while (resultSet.next()) //exists but moves us forward to the first record
	    {
		    System.out.println( "counter: ");
		    String textmsg = resultSet.getString("textmsg");
			System.out.println(textmsg);
			
			String sender = resultSet.getString("sender");
			System.out.println(sender);
			
			String recipient = resultSet.getString("recipient");
			System.out.println(recipient);
		    counter++;
	    } 
		resultSet.close();
		
		query ="SELECT COUNT(textmsg) from Messages";
		
		
		
		
		
		
		}
	catch(SQLException Ex) {
	    System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());
	}
	
	finally{
		try {
			if (statement != null) statement.close();
			if (prepStatement != null) prepStatement.close();
		} catch (SQLException e) {
			System.out.println("Cannot close Statement. Machine error: "+e.toString());
		}
	}

}
	
	//FUNCTION 14: dropUser
	
	
	
	
 public static void main(String args[]) throws SQLException
  {
    String username, password;
	username = "leo10"; //This is your username in oracle
	password = "3720791"; //This is your password in oracle
	
	try{
	    // Register the oracle driver.  
	    DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	    
	    //This is the location of the database.  This is the database in oracle
	    //provided to the class
	    String url = "jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass"; 
	    
	    //create a connection to DB on class3.cs.pitt.edu
	    connection = DriverManager.getConnection(url, username, password); 
	    project demo = new project(Integer.parseInt(args[0]));
	    
	}
	catch(Exception Ex)  {
	    System.out.println("Error connecting to database.  Machine Error: " +
			       Ex.toString());
	}
	finally
	{
	
		connection.close();
	}
  }
}
	