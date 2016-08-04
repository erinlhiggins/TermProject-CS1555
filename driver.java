//Lena Ortmann and Erin Higgins final project driver

import java.sql.*;  
import java.text.ParseException;
import java.util.Scanner;
import java.util.Calendar;

public class driver {
    private static Connection connection; 
    private static Statement statement; 
    private static PreparedStatement prepStatement; 
    private static ResultSet resultSet; 
    private static String query;  
	private static String fname;
	private static String lname;
	private static int x;
	private static int k;
	private static int casenum;
	private static int counter;	
    
    
    //adding a new user to Profiles
	public static void createUser(int casenum){
		try{
	
		    connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	    connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
	    query = "insert into Profiles values (?,?,?,?,?,?)";
	    prepStatement = connection.prepareStatement(query);
		
		
		String user = "Zachary Quinto";
		String email = "zq95@gmail";
		
		
	    java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
	    java.sql.Date date_reg = new java.sql.Date (df.parse("1989-05-13").getTime());
	    java.sql.Timestamp lastlogin  = new java.sql.Timestamp(new java.util.Date().getTime());
	    
		
	    String group = "NULL";
	    
		prepStatement.setInt(1, 200);
	    prepStatement.setString(2, user); 
	    prepStatement.setString(3, email);
	    prepStatement.setDate(4, date_reg);
		prepStatement.setTimestamp(5,lastlogin);
		prepStatement.setString(6,group);
	    
	   prepStatement.executeUpdate();
	   
	//Selecting new user
	  query ="select * from Profiles where userID = ?";
	  
	   prepStatement = connection.prepareStatement(query);
	   int userID = 200;
	   prepStatement.setInt(1, userID);
	   
	    ResultSet resultSet = prepStatement.executeQuery();
	   System.out.println("userID" + " " + "nameofuser" + " " + "email" + " " + "dob" + " " + "timeoflastlogin" + " " + "ingroup");
	//printing new user
		while(resultSet.next())
		{
	    System.out.println(resultSet.getInt(1)+"   "+ resultSet.getString(2)+"   "+resultSet.getString(3)+"   "+resultSet.getDate(4)+"   "+resultSet.getDate(5) + "   " + resultSet.getString(6));
		}
	    resultSet.close();
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

//takes in input then inserts into the Friendship table	
 //FUNCTION 2 : initiateFriendship

        public static void initiateFriendship(int casenum) {

	try{
	    connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	    connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
	    query = "insert into Friendships values (?,?,?,?,?)";
    	prepStatement = connection.prepareStatement(query);

		String name1 = "Erin Higgins";
		String name2 = "Zachary Quinto";
		
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

	public static void establishFriendship(int casenum){
		try{
                 connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	    connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
		  query = "update Friendships set status = ?, request = ? WHERE nameofuser = ?";
		  prepStatement = connection.prepareStatement(query);
		  
		String name1 = "Erin Higgins"; //user
		String name2 = "Zachary Quinto"; //request to
		
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
	
	//searches through the friends list for when the username is the inputted value
	//FUNCTION 4: displayFriends
	public static void displayFriends(int casenum) {
	try {
	 connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	 connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
	   query ="select * from Friendships where nameofuser = ?";
	   prepStatement = connection.prepareStatement(query);
	   String name1 = "Erin Higgins";
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
public static void createGroup(int casenum){
	try{
		 connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	 connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);	
		query = "insert into Groups values(?,?,?,?)";
		
		prepStatement = connection.prepareStatement(query);
      
	    String groupname = "FFA";
	    String description = "Future Farmers of America";
	    int memberlimit = 2;
		int members = 0;
	
	    prepStatement.setString(1, groupname); 
	    prepStatement.setString(2, description);
	    prepStatement.setInt(3, members);
		prepStatement.setInt(4,memberlimit);
	    prepStatement.executeUpdate();
		
	//Selecting new group	
	  query ="select * from Groups where groupname = ?";
	  
	   prepStatement = connection.prepareStatement(query);
	   prepStatement.setString(1, groupname);
		 ResultSet resultSet = prepStatement.executeQuery();
	   System.out.println("groupname" + " " + "description" + " " + "numofmembers" + " " + "membershiplimit");
	//Printing new group	
		while(resultSet.next())
		{
	    System.out.println(resultSet.getString(1)+"   "+ resultSet.getString(2)+"   "+resultSet.getInt(3) + " " +  resultSet.getInt(4));
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

//FUNCTION 6: addToGroup
    public static void addToGroup(int casenum) {
	
	try {
	
	if(casenum == 0){
    	 connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	 connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
		String name1 = "Erin Higgins";
		String name2 = "FFA";
	    
	    query = "update Profiles set ingroup = concat(ingroup, ?) where username = ?";
	    prepStatement = connection.prepareStatement(query);
	    prepStatement.setString(1, name2+", ");
	    prepStatement.setString(2, name1);
	    prepStatement.executeUpdate();
	    
	    query = "update Groups set numofmembers = numofmembers + 1 where groupname = ?";
    	prepStatement = connection.prepareStatement(query);
		prepStatement.setString(1, name2); 
	    prepStatement.executeUpdate();
	    connection.commit();
	    }
	    
	if(casenum == 1){
	connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	 connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
		String name1 = "Zachary Quinto";
		String name2 = "FFA";
	    
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
    if(casenum == 2){
        connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	 connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
		String name1 = "Gabby Means";
		String name2 = "FFA";
	    
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
public static void sendMessageTouser(int casenum){
	try{
         connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	    connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
		query = "insert into Messages values(?,?,?,?,?,?)";
		prepStatement = connection.prepareStatement(query);
		
	   String subject = "Food";
	   String textmsg = "I love Perogies";
	   String sender = "Joe Lynch";
	   String recipient = "Erin Higgins";
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
	    java.sql.Date datereg = new java.sql.Date (df.parse("2016-05-13").getTime());
		int groupmsg = 0;
	
	    prepStatement.setString(1, subject); 
	    prepStatement.setString(2, textmsg);
	    prepStatement.setString(3, sender);
		prepStatement.setString(4,recipient);
		prepStatement.setDate(5,datereg);
		prepStatement.setInt(6,groupmsg);
		prepStatement.executeUpdate();
				
				
				
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
    public static void sendMessageToGroup(int casenum) {
	try{
            connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	    connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
	    query = "select username from Profiles where ingroup LIKE ?";
	    prepStatement = connection.prepareStatement(query);

	    String user = "Gabby Means";
		String name1 = "FFA";
		String sub = "Joining";
		String message = "Please allow more members into your group";
		
		prepStatement.setString(1, "%"+name1+"%");
		
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
public static void displayMessages(int casenum){
	try{
	 connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	 connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);	
		query = "select * from Messages where recipient = ?";
    	prepStatement = connection.prepareStatement(query);
    	
		String name1 = "Erin Higgins"; //recipient
		
		prepStatement.setString(1, name1); 
	    
	    ResultSet resultSet = prepStatement.executeQuery();
	    System.out.println("SUBJECT\t\tTEXTMSG\t\t\t\t\tSENDER\t\tDATEOFMSG");
	 //Printing messages from recipient
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
	public static void displayNewMessages(int casenum) {
		try {
		connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	    connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
		query = "select * from Messages where recipient = ? AND dateofmsg > (select timeoflastlogin from Profiles where username = ?)";
    	prepStatement = connection.prepareStatement(query);

		String name1 = "Erin Higgins";
		
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
public static void searchForUser(int casenum)
{ 
Scanner scanner = new Scanner(System.in);

	try{
	 connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	 connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
	
		query = "select * from Profiles where username LIKE ? OR email LIKE ?";
		prepStatement = connection.prepareStatement(query);
		Scanner keyboard = new Scanner(System.in);

		String name1 = "in";
		

		prepStatement.setString(1, "%"+name1+"%");
		prepStatement.setString(2, "%"+name1+"%");
		
		resultSet = prepStatement.executeQuery();
		
		System.out.println("Users with username or email containing that string:");
		if(!resultSet.next())
		{
			System.out.println("No matches found!");
		}
		else
		{
			while(resultSet.next())
			{
				System.out.println(resultSet.getString(2));
			}
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

//FUNCTION  12: threeDegrees
	public static void threeDegrees(int casenum) {
		try {
		connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	        connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
		int found = 0;
		query = "select requestto from Friendships where (nameofuser = ? AND requestto = ?) OR (nameofuser = ? AND requestto = ?) AND status = 'Friends'";
		prepStatement = connection.prepareStatement(query);
		
		String name1 = "start";
		String name2 = "start";
		
		if(casenum == 0)
		{
		name1 = "Joe Lynch";
		name2 = "Erin Higgins";
		}
		if(casenum == 1)
		{
		name1 = "Joe Lynch";
		name2 = "Maggie Devine";
		}
		if(casenum == 2)
		{
		name1 = "Joe Lynch";
		name2 = "David Spade";
		}
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
public static void topMessages(int x, int k)
{
	try
	{
	    counter = 0;
        connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	    connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
		
				
		query = "SELECT recipient, COUNT(*) from Messages where dateofmsg > ADD_MONTHS(sysdate, -?) group by recipient order by COUNT(*) DESC";
		prepStatement = connection.prepareStatement(query);
		prepStatement.setInt(1, x);
		resultSet = prepStatement.executeQuery(); 
		
		System.out.println("RECIPIENT\t\tNUMMESSAGES");
	//printing top messages

		while(resultSet.next() && counter < k) //exists but moves us forward to the first record
	    {
			System.out.println(resultSet.getString(1)+"\t\t"+resultSet.getString(2));
			counter++;
	    } 
		resultSet.close();
		
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
        public static void dropUser(int casenum) {
		try {
		 connection.setAutoCommit(false); //the default is true and every statement executed is considered a transaction.
	         connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
	         String name1 = "start";
			
			if(casenum == 0){
			name1 = "Joe Lynch";
			}
			if(casenum == 1){
			name1 = "Erin Higgins";
			}
			
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
	    System.out.println("Using createUser");
	    System.out.println("New user: ID 200 username Zachary Quinto email zq95@gmail.com being added to the network");
	    createUser(0);          // create user
	    System.out.println("Successfully added");
	    System.out.println("Trying to add Zachary Quinto again");
	    createUser(0);          // try to create user that already exists
	    System.out.println("Fails because he is already in the system");
	    System.out.println("-----------------------------------------------------------------------------------------");
	    System.out.println("Using initaiteFriendship");
	    System.out.println("Initiating friendship between Erin Higgins and Zachary Quinto");
	    initiateFriendship(0);  // initiate a friendship between newly created user and another person
	    System.out.println("Successful");
	    System.out.println("Displaying Erin Higgins friends to prove the request worked and to prove the functionality of displayFriends:");
	    displayFriends(0);      // show the friends to prove the above function worked
	    System.out.println("Using establishFriendship");
	    System.out.println("Accepting the friendship between Erin and Zachary");
	    establishFriendship(0);  // make the new friendship accepted instead of pending
	    System.out.println("Using displayFriends again to show that the status has changed to accepted");
	    displayFriends(0);      // show friends again to show change in the status of friendship   
	    System.out.println("-----------------------------------------------------------------------------------------");
	    System.out.println("Using createGroup");
	    System.out.println("Creating group Animal Friends with a group limit of 2");  
	    createGroup(0);         // create group
	    System.out.println("-----------------------------------------------------------------------------------------");
	    System.out.println("Using addToGroup");
	    System.out.println("Adding Erin Higgins to group");
	    addToGroup(0);          // add one user to a group
	    System.out.println("Adding Zachary Quinto to group");
	    addToGroup(1);          // add another group member
	    System.out.println("Trying to add Gabby Means to group");
	    addToGroup(2);          // too many people
	    System.out.println("Too many people, cannot join group");
	    System.out.println("-----------------------------------------------------------------------------------------");
	    System.out.println("Showing messaging sending functionality:");
	    System.out.println("Using sendMessageTouser");
	    System.out.println("Sending message from Joe Lynch to Erin Higgins");
	    sendMessageTouser(0);   // send message to one person
	    System.out.println("Using displayMessages to prove it works");
	    displayMessages(0);     // show the messages to prove
	    System.out.println("Using sendMessageToGroup");
	    System.out.println("Sending message from Gabby Means to the group FFA");
	    sendMessageToGroup(0);  // send message to group with a lot of people
	    System.out.println("Using displayMessages to prove it works by showing Erin has received a messages because of the group FFA:");
	    displayMessages(0);     // prove that this worked
	    System.out.println("Using displayNewMessages");
	    System.out.println("Show just new messages to Erin Higgins");
	    displayNewMessages(0);  // prove that new messages can be displayed
	    System.out.println("-----------------------------------------------------------------------------------------");
	    System.out.println("Use search to try and find anyone with the string in in their name");
	    System.out.println("Searching for: in");
	    searchForUser(0);       // search for user name of new user added at beginning
	    System.out.println("-----------------------------------------------------------------------------------------");
	    System.out.println("Using threeDegrees");
	    System.out.println("Show relationship between Joe Lynch and Erin Higgins");
	    threeDegrees(0);        // show that direct relationships can be found
	    System.out.println("Show relationship between Joe Lynch and Kalyn Sigg");
	    threeDegrees(1);        // show that three hops can be found
	    System.out.println("Show relationship between Joe Lynch and David Spade");
	    threeDegrees(2);        // show that sometimes there is no connection
	    System.out.println("-----------------------------------------------------------------------------------------");
	    System.out.println("Test of top messages:");
	    System.out.println("Show top message receivers for the past 12 months");
	    topMessages(12, 12);         // show last year
	    System.out.println("Show top message receivers for the past 144 months");
	    topMessages(144, 12);         // show last couple years
	    System.out.println("-----------------------------------------------------------------------------------------");
	    System.out.println("Testing drop user:");
	    System.out.println("Drop Joe Lynch");
	    dropUser(0);            // drop user then show that he is not found in any of the places that he was in before including messages
	    System.out.println("Showing that messages are still in there from Joe if the other user is still in the db");
	    displayMessages(0);
	    System.out.println("Dropping Erin Higgins");
	    dropUser(1);
	    System.out.println("Showing that these messages are now gone");
	    displayMessages(0);
	    
	    
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
