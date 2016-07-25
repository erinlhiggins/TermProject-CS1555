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
	case 2:
	   initiateFriendship();
	   break;
	case 3:
	   establishFriendship();
	    break;
	case 4:
	    displayFriends();
	    break;
	case 5: 
	  createGroup();
	   break;
	case 6:
	    addToGroup();
	    break; 
	case 7:
	  sendMessageTouser();
	    break;
	case 8:
	    sendMessageToGroup();
	    break;
	case 9: 
	   displayMessages();
	   break;
	case 10:
	    displayNewMessages();
	    break;
	case 11:
	  searchForUser();
	  break;
	 case 12:
	   threeDegrees();
	    break;
	case 13:
		topMessages(x, k);
		break;
        case 14:
	    dropUser();
	    break;
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
	
	    connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	    connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
	    query = "insert into Profiles values (?,?,?,?,?,?)";
	    prepStatement = connection.prepareStatement(query);
		
		
	  Scanner scanner = new Scanner(System.in);
		System.out.println("Enter new id:");
		int id = scanner.nextInt();
		System.out.println("Enter new username:");
		String user = scanner.next();
		System.out.println("Enter new email:");
		String email = scanner.next();
		
		
	    java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
	    java.sql.Date date_reg = new java.sql.Date (df.parse("1989-05-13").getTime());
	    java.sql.Timestamp lastlogin  = new java.sql.Timestamp(new java.util.Date().getTime());
	    
		
	    String group = "Null";
	    
		prepStatement.setInt(1,id);
	    prepStatement.setString(2, user); 
	    prepStatement.setString(3, email);
	    prepStatement.setDate(4, date_reg);
		prepStatement.setTimestamp(5,lastlogin);
		prepStatement.setString(6,group);
	    
	    prepStatement.executeUpdate();
		System.out.println("Adding: " + id + " " + user +  " " + email + " " + date_reg + " " + lastlogin + " " + group + " " + "to Profiles");
		connection.commit();
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

        public void initiateFriendship() {

	try{
	    connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	    connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
	    query = "insert into Friendships values (?,?,?,?,?)";
    	prepStatement = connection.prepareStatement(query);
    	
    	Scanner keyboard = new Scanner(System.in);
		System.out.println("Your username:");
		String name1 = keyboard.nextLine();
		System.out.println("Friend to request:");
		String name2 = keyboard.nextLine();
		
		String status = "pending";
	    long request = 0;
	    java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
	    java.sql.Date date_reg = new java.sql.Date (df.parse("2016-07-10").getTime());
		
		prepStatement.setString(1, name1); 
	    prepStatement.setString(2, name2);
	    prepStatement.setLong(3, request);
	    prepStatement.setString(4, status);
	    prepStatement.setDate(5, date_reg);
	    prepStatement.executeUpdate();
	    connection.commit();
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
 
	
	
	//Function 3 : establishFriendship

	public void establishFriendship(){
		try{
            connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	    connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
		  query = "UPDATE Friendships" +  "SET status = ? AND request = ? WHERE nameofuser = ?";
		  prepStatement = connection.prepareStatement(query);
		  System.out.println("here1");
		  
		  
		  Scanner keyboard = new Scanner(System.in);
		System.out.println("Your username:");
		String name1 = keyboard.nextLine();
		System.out.println("Accept request to:");
		String name2 = keyboard.nextLine();
		
		String status = "Friends";
	    int request = 0;
	    java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
	    java.sql.Date date_reg = new java.sql.Date (df.parse("2016-07-10").getTime());
		
		prepStatement.setString(1, status); 
	    prepStatement.setInt(2, request);
		prepStatement.setString(3,name1);
		
	
	   
	    prepStatement.executeUpdate();
		
	connection.commit();	
			
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
	public void displayFriends() {
	try {
	 connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	 connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
	   query ="select * from Friendships where nameofuser = ?";
	   prepStatement = connection.prepareStatement(query);
	   Scanner keyboard = new Scanner(System.in);
	   System.out.println("Your username:");
	   String name1 = keyboard.nextLine();
	   prepStatement.setString(1, name1);
	   
	    ResultSet resultSet = prepStatement.executeQuery();
	    System.out.println("NAMEOFUSER\tREQUESTTO\tREQUEST\tSTATUS\tDATEOFFRIENDSHIP");
	    while(resultSet.next())
	    {
	    	System.out.println(resultSet.getString(1)+"\t"+resultSet.getString(2)+"\t"+resultSet.getLong(3)+"\t"+resultSet.getString(4)+"\t"+resultSet.getDate(5));
	    }
	    resultSet.close();
	    connection.commit();
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
	
	
	
	//Function 5 : CreateGroup
public void createGroup(){
	try{
	 connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	 connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);	
		query = "insert into Groups values(?,?,?,?)";
		
		prepStatement = connection.prepareStatement(query);
      
	    String subject = "Ski Club";
	    String description = "Snow lovers";
		int members = 5;
		int memberlimit = 50;
	
	    prepStatement.setString(1, subject); 
	    prepStatement.setString(2, description);
	    prepStatement.setInt(3, members);
		prepStatement.setInt(4,memberlimit);
	    prepStatement.executeUpdate();
		
		System.out.println("Adding: " + subject +  " " + description + " " + members + " " + memberlimit + " " + "to Groups");
	    connection.commit();	
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
    public void addToGroup() {
	
	try {
    	 connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	 connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
    	Scanner keyboard = new Scanner(System.in);
		System.out.println("Username:");
		String name1 = keyboard.nextLine();
		System.out.println("Group:");
		String name2 = keyboard.nextLine();
	    
	    query = "update Profiles set ingroup = ? where username = ?";
	    prepStatement = connection.prepareStatement(query);
	    prepStatement.setString(1, name2);
	    prepStatement.setString(2, name1);
	    prepStatement.executeUpdate();
	    
	    query = "update Groups set numofmembers = numofmembers + 1 where groupname = ?";
    	prepStatement = connection.prepareStatement(query);
		prepStatement.setString(1, name2); 
	    prepStatement.executeUpdate();
	    connection.commit();
	}	
	catch(Exception Ex)  {
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



//Function 7 : sendMessageTouser
public void sendMessageTouser(){
	try{
            connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	    connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
		query = "insert into Messages values(?,?,?,?,?,?)";
		//System.out.println("here1");
		prepStatement = connection.prepareStatement(query);
      System.out.println("here2");
	    String subject = "Workout";
	//	System.out.println("here3");
	    String textmsg = "Wanna workout at 7 tomorrow?";
		//System.out.println("here4");
		String sender = "Lena Ortmann";
		//System.out.println("here5");
		String recipient= "Hannah Barton";
		//System.out.println("here6");
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
	    java.sql.Date datereg = new java.sql.Date (df.parse("2016-05-13").getTime());
		//System.out.println("here7");
		int groupmsg = 0;
		//System.out.println("here8");
	
	    prepStatement.setString(1, subject); 
		//System.out.println("here9");
	    prepStatement.setString(2, textmsg);
		//System.out.println("here10");
	    prepStatement.setString(3, sender);
		//System.out.println("here11");
		prepStatement.setString(4,recipient);
		//System.out.println("here12");
		prepStatement.setDate(5,datereg);
		//System.out.println("here13");
		prepStatement.setInt(6,groupmsg);
		//System.out.println("here14");
		 prepStatement.executeUpdate();
		//System.out.println("here15");
		System.out.println("Adding: " + subject +  " " + textmsg + " " + sender + " " + recipient + " " + datereg + " " + groupmsg + " " + "to Messages");
		//System.out.println("here16");
		resultSet.close();
		
		connection.commit();
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
    public void sendMessageToGroup() {
	try{
            connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	    connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
	    query = "select username from Profiles where ingroup = ?";
	    prepStatement = connection.prepareStatement(query);
	    
	    Scanner keyboard = new Scanner(System.in);
	    System.out.println("Enter your username: ");
	    String user = keyboard.nextLine();
		System.out.println("Group to send to:");
		String name1 = keyboard.nextLine();
		System.out.println("Subject: ");
		String sub = keyboard.nextLine();
		System.out.println("Message: ");
		String message = keyboard.nextLine();
		
		prepStatement.setString(1, name1);
		
		ResultSet resultset = prepStatement.executeQuery();
		while(resultset.next())
		{
		    String value = resultset.getString(1);
			query = "insert into Messages values (?, ?, ?, ?, ?, ?)";
			prepStatement = connection.prepareStatement(query);
			
			prepStatement.setString(1, sub);
			prepStatement.setString(2, message);
			prepStatement.setString(3, user);
			prepStatement.setString(4, value);
			 java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
	         java.sql.Date date_reg = new java.sql.Date (df.parse("2012-02-24").getTime());
			prepStatement.setDate(5, date_reg);
			prepStatement.setString(6, name1);
			
			prepStatement.executeUpdate();
		}
		connection.commit();
	}	
	catch(Exception Ex) {
	    System.out.println("Machine Error: " +
			       Ex.toString());
	}
	finally{
		try {
			if (statement !=null) statement.close();
		} catch (SQLException e) {
			System.out.println("Cannot close Statement. Machine error: "+e.toString());
		}
	}
   }



//Function 9 : displayMessages
public void displayMessages(){
	try{
	 connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	 connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);	
		query = "select * from Messages where recipient = ?";
    	prepStatement = connection.prepareStatement(query);
    	
    	Scanner keyboard = new Scanner(System.in);
		System.out.println("recipient:");
		String name1 = keyboard.nextLine();
		
		prepStatement.setString(1, name1); 
	    
	    ResultSet resultSet = prepStatement.executeQuery();
	    System.out.println("SUBJECT\t\tTEXTMSG\t\t\t\t\tSENDER\t\tDATEOFMSG");
	    while(resultSet.next())
	    {
	    	System.out.println(resultSet.getString(1)+"\t"+resultSet.getString(2)+"\t"+resultSet.getString(3)+"\t"+resultSet.getString(4));
	    }
	    resultSet.close();
		
	connection.commit();	

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
	public void displayNewMessages() {
		try {
		 connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	         connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
		query = "select * from Messages where recipient = ? AND dateofmsg > (select timeoflastlogin from Profiles where username = ?)";
    	prepStatement = connection.prepareStatement(query);
    	
    	Scanner keyboard = new Scanner(System.in);
		System.out.println("Username:");
		String name1 = keyboard.nextLine();
		
		prepStatement.setString(1, name1); 
	    prepStatement.setString(2, name1);
	    
	    ResultSet resultSet = prepStatement.executeQuery();
	    System.out.println("SUBJECT\t\tTEXTMSG\t\t\t\t\tSENDER\t\tRECIPIENT\tDATEOFMSG\tGROUPMSG");
	    while(resultSet.next())
	    {
	    	System.out.println(resultSet.getString(1)+"\t"+resultSet.getString(2)+"\t"+resultSet.getString(3)+"\t"+resultSet.getString(4)+"\t"+resultSet.getDate(5)+"\t"+resultSet.getString(6));
	    }
	    resultSet.close();
	    connection.commit();
			
		} catch (Exception Ex) {
			System.out.println("Machine Error: " + Ex.toString());
		}
		finally{
			try {
				if (statement!=null) statement.close();
			} catch (SQLException e) {
				System.out.println("Cannot close Statement. Machine error: "+e.toString());
			}
		}

	}
	
//Question 11: searchForUser
public void searchForUser()
{ 
Scanner scanner = new Scanner(System.in);

	try{
	 connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	 connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
		int counter = 1;
		
		query = "select username from Profiles where username = ?";
		prepStatement = connection.prepareStatement(query);
		
		
	//	System.out.println("here1");
		System.out.println("Enter name");
		String fname = scanner.next();
		
		
		//System.out.println("here2");
	
		prepStatement.setString(1, fname); 
		//System.out.println("here3");
	    resultSet = prepStatement.executeQuery();
		
		 
		 while (resultSet.next()) //exists but moves us forward to the first record
	    {
		    System.out.println( "counter: ");
		    String text = resultSet.getString("username");
			System.out.println(text);
		    counter++;
	    } 
		resultSet.close();
		
	
		//System.out.println("here4");
		
		connection.commit();
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
	public void threeDegrees() {
		try {
		connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	        connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
		int found = 0;
		query = "select requestto from Friendships where (nameofuser = ? AND requestto = ?) OR (nameofuser = ? AND requestto = ?) AND status = 'Friends'";
		prepStatement = connection.prepareStatement(query);
		
		Scanner keyboard = new Scanner(System.in);
		System.out.println("Username:");
		String name1 = keyboard.nextLine();
		System.out.println("Other Person:");
		String name2 = keyboard.nextLine();
		prepStatement.setString(1, name1);
		prepStatement.setString(2, name2);
		prepStatement.setString(3, name2);
		prepStatement.setString(4, name1);
		
		ResultSet resultSet = prepStatement.executeQuery();
		if(!resultSet.next())
		{
		 query = "select requestto from Friendships where nameofuser = ? AND status = 'Friends'";
		 prepStatement = connection.prepareStatement(query);
		 prepStatement.setString(1, name1);
		 
		 ResultSet resultSet2 = prepStatement.executeQuery();
		 
		while(resultSet2.next())
	    {
	        String value = resultSet2.getString(1);
	    	query = "select requestto from Friendships where (nameofuser = ? and requestto = ?) OR (nameofuser = ? and requestto = ?) AND status = 'Friends'";
	    	prepStatement = connection.prepareStatement(query);
	    	
	    	prepStatement.setString(1, value);
	    	prepStatement.setString(2, name2);
	    	prepStatement.setString(3, name2);
	    	prepStatement.setString(4, value);
	    	
	    	ResultSet resultSet3 = prepStatement.executeQuery();
	    	if(resultSet3.next())
	    	{
	    	    found = 1;
	    		System.out.println(name1+" --> "+resultSet2.getString(1)+" --> "+name2+" These users are connected.");
	    		break;
	    	}
	    }
		 
		}
		else{
		    found = 1;
			System.out.println(name1+" --> "+name2+" These users are friends.");
		}
		
		if(found == 0)
		{
			System.out.println("These users are not connected");
		}
		
	    resultSet.close();
	    connection.commit();	
		} catch (Exception Ex) {
			System.out.println("Machine Error: " + Ex.toString());
		}
		finally{
			try {
				if (statement!=null) statement.close();
			} catch (SQLException e) {
				System.out.println("Cannot close Statement. Machine error: "+e.toString());
			}
		}

	}

 
//Question 13: topMessages
public void topMessages(int x, int k)
{
	try
	{
            connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	    connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
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
	        statement.executeQuery(query);
	connection.commit();	
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
        public void dropUser() {
		try {
		 connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	         connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
			
			Scanner keyboard = new Scanner(System.in);
			System.out.println("Username to drop:");
			String name1 = keyboard.nextLine();
			
			query = "delete from Friendships where nameofuser = ? OR requestto = ?";
			prepStatement = connection.prepareStatement(query);
			prepStatement.setString(1, name1);
			prepStatement.setString(2, name1);
			prepStatement.executeUpdate();
			
			query = "select * from Messages where sender = ? OR recipient = ?";
			prepStatement = connection.prepareStatement(query);
			prepStatement.setString(1, name1);
			prepStatement.setString(2, name1);
			ResultSet resultset2 = prepStatement.executeQuery();
			
			while(resultset2.next())
			{
			    String sender = resultset2.getString(3);
			    String rec = resultset2.getString(4);
			    String sub = resultset2.getString(1);
			    if(sender.equals(name1))
			    {
			    	query = "select * from Profiles where username = ?";
			    	prepStatement = connection.prepareStatement(query);
			    	prepStatement.setString(1, rec);
			    	ResultSet resultset3 = prepStatement.executeQuery();
			    	if(!resultset3.next())
			    	{
			    		query = "delete from Messages where sender = ? AND recipient = ? AND subject = ?";
			    		prepStatement = connection.prepareStatement(query);
			    		prepStatement.setString(1, sender);
			    		prepStatement.setString(2, rec);
			    		prepStatement.setString(3, sub);
			    		prepStatement.executeUpdate();
			    	}
			    }
			    else
			    {
			    	query = "select * from Profiles where username = ?";
			    	prepStatement = connection.prepareStatement(query);
			    	prepStatement.setString(1, sender);
			    	ResultSet resultset4 = prepStatement.executeQuery();
			    	if(!resultset4.next())
			    	{
			    		query = "delete from Messages where sender = ? AND recipient = ? AND subject = ?";
			    		prepStatement = connection.prepareStatement(query);
			    		prepStatement.setString(1, sender);
			    		prepStatement.setString(2, rec);
			    		prepStatement.setString(3, sub);
			    		prepStatement.executeUpdate();
			    	}
			    }
			}
			
			query = "delete from Profiles where username = ?";
			prepStatement = connection.prepareStatement(query);
			prepStatement.setString(1, name1);
			prepStatement.executeUpdate();
		connection.commit();	
			
		} catch (Exception Ex) {
			System.out.println("Machine Error: " + Ex.toString());
		}
		finally{
			try {
				if (statement!=null) statement.close();
			} catch (SQLException e) {
				System.out.println("Cannot close Statement. Machine error: "+e.toString());
			}
		}

	}
	
	
	
 public static void main(String args[]) throws SQLException
  {
    String username, password;
	username = "elh76"; //This is your username in oracle
	password = "3776754"; //This is your password in oracle
	
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
	
