package DatabaseOperations;

import java.sql.*;
import Entities.*;
import EmailService.*;

import javax.mail.*;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class DatabaseOperationsClass {

	
	 Statement statement;
	Connection con;
	public DatabaseOperationsClass()
	{
		try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/librarySystem","root","root");
    statement=con.createStatement();
	}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	public  int InsertBook(String bookName,String author,String edition,String quantity)
	{
	
     String query="insert into bookdetails (bookname,author,edition,quantity) values ('"+bookName+"','"+author+"','"+edition+"','"+quantity+"')";
    try {
     statement.executeUpdate(query);
     query="select * from bookdetails where bookname='"+bookName+"' and author='"+author+"' and edition='"+edition+"' and quantity='"+quantity+"'";
     ResultSet rs=statement.executeQuery(query);
     if(rs.next())
     {
     int bookId=Integer.parseInt(rs.getString(5));
     return bookId;
     }
        }catch(Exception e)
        {
    	System.out.println(e);
        }
      return 0;
	}
	private ResultSet executeQuery(String query) {
		// TODO Auto-generated method stub
		return null;
	}
	public  boolean  updateBook(String bookName,String author,String edition,String quantity,int bookid)
	{
		 String query="update bookdetails set bookname='"+bookName+"',author='"+author+"', edition='"+edition+"', quantity='"+quantity+"' where bookid="+bookid;
		    try {
		     statement.executeUpdate(query);
			  query="update bookissue set bookname='"+bookName+"',author='"+author+"', edition='"+edition+"' where bookid="+bookid;
			  statement.executeUpdate(query);

		     return true;
		    }catch(Exception e)
		    {
		    	System.out.println(e);
		    	return false;
		    }
	}
	public boolean delete(int bookId)
	{
	String query="delete from bookdetails where bookId="+bookId;
	try {
		statement.executeUpdate(query);
	    query="delete from bookissue where bookId="+bookId;
	    statement.executeUpdate(query);

		return true;
	    }
	catch(Exception e)
	{
		System.out.println(e);
		return false;
	}
	}
	public Book getBook(int bookId) {
		Book book =new Book();
		try {
		String query="select * from bookdetails where bookid="+bookId;
		ResultSet rs=statement.executeQuery(query);
		if(rs.next())
	    {
			book.setBookName(rs.getString(1));;
			book.setAuthor(rs.getString(2));
			book.setEdition(rs.getString(3));
			book.setQuantity(rs.getString(4));
		    book.setBookId(Integer.parseInt(rs.getString(5)));
		}
	    }
	    catch(Exception e)
	    {
		System.out.println(e);
	    }
		return book;
	}
	public Book getBook(String bookName,String bookEdition) {
		Book book =new Book();
		try {
		String query="select * from bookdetails where bookname='"+bookName+"' AND edition='"+bookEdition+"'";
		ResultSet rs=statement.executeQuery(query);
		if(rs.next())
	    {
			book.setBookName(rs.getString(1));
			book.setAuthor(rs.getString(2));
			book.setEdition(rs.getString(3));
			book.setQuantity(rs.getString(4));
		    book.setBookId(Integer.parseInt(rs.getString(5)));
	    }
	    }
	    catch(Exception e)
	    {
		System.out.println(e);
	    }
		return book;
	}
	public Book getIssuedBook(String bookName,String bookEdition,Integer membershipNo) {
		Book book =new Book();
		try {
		String query="select * from bookissue where bookname='"+bookName+"' AND edition='"+bookEdition+"' and issueTo="+membershipNo;
		ResultSet rs=statement.executeQuery(query);
		if(rs.next())
	    {
			book.setBookName(rs.getString(1));
			book.setEdition(rs.getString(2));
			book.setBookId(Integer.parseInt(rs.getString(3)));
			book.setIssueDate(rs.getString(4));
			book.setReturnDate(rs.getString(5));
			book.setAuthor(rs.getString(6));			
	    }
	    }
	    catch(Exception e)
	    {
		System.out.println(e);
	    }
		return book;
	}
	
	public boolean isbookPresent(int bookId)
	{
		boolean ispresent=false;
		ResultSet rs;
		try {
		String query="select * from bookdetails where bookid="+bookId;
		rs=statement.executeQuery(query);
		ispresent=rs.next();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		if(ispresent)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	public boolean isbookpresent(String bookName,String bookEdition)
	{
		boolean ispresent=false;
	try{


		String query="select * from bookdetails where bookname='"+bookName+"' AND edition='"+bookEdition+"'";
		ResultSet rs=statement.executeQuery(query);
		if(rs.next())
		ispresent=true;
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	return ispresent;
	}
	public boolean isbookpresentInIssue(String bookName,String bookEdition)
	{
		boolean ispresent=false;
	try{


		String query="select * from bookdetails where bookname='"+bookName+"' AND edition='"+bookEdition+"'";
		ResultSet rs=statement.executeQuery(query);
		if(rs.next())
		ispresent=true;
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	return ispresent;
	}
	public boolean returnBook(int bookId,int issueTo)
	{
		try {
			int quantity=0;
		String query="delete from bookissue where issueto='"+issueTo+"' and bookid="+bookId;
		statement.executeUpdate(query);
		query="select * from bookdetails where bookid="+bookId;
		ResultSet rs=statement.executeQuery(query);
		if(rs.next())
		{
			quantity=(Integer.parseInt(rs.getString(4)));
			System.out.println(quantity);
		}
		++quantity;
		System.out.println(quantity);
	    query="update bookdetails set quantity="+quantity+" where bookid="+bookId ;
	    statement.executeUpdate(query);
			return true;
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return false;
		
	}
	public boolean renewBook(int bookId,String returnDate,String issueTo)
	{
		try {
		String query="update  bookissue set returnDate='"+returnDate+"'  where bookid="+bookId+" AND issueTo='"+issueTo+"'";
		//UPDATE Customers SET ContactName = 'Alfred Schmidt', City = 'Frankfurt'		WHERE CustomerID = 1;
		statement.executeUpdate(query);
		System.out.println(bookId+" "+returnDate+" "+issueTo);
			return true;
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return false;
		
	}
	public boolean alreadyIssued(String bookName,String edition,int membershipNo)
	{
	boolean	isIssued=false;
		try {
		String query="select * from bookissue where bookname='"+bookName+"' and edition='"+edition+"' and issueto='"+membershipNo+"'";
		ResultSet rs=statement.executeQuery(query);
		if(rs.next())
		{
			isIssued=true;
			System.out.println(isIssued);
		}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		System.out.println(isIssued);

		return isIssued;
	}
	public  int addAdmin(String adminName,String libraryName,String address,String e_mail,String role,String password)
	{
	
     String query="insert into userdata (name,libraryName,address,email,role,password) values ('"+adminName+"','"+libraryName+"','"+address+"','"+e_mail+"','"+role+"','"+password+"')";
    try {
     statement.executeUpdate(query);
     query="select * from userdata order by membershipNo desc limit 1";
     ResultSet rs=statement.executeQuery(query);
     if(rs.next())
     {
     int memberShipNo=Integer.parseInt(rs.getString(7));


     SendConfirmationMail email=new SendConfirmationMail();
     email.sendEmail(e_mail,adminName,memberShipNo,password);
     return memberShipNo;
     }
        }catch(Exception e)
        {
    	System.out.println(e);
    	
        }
      return 0;
	}
	
	public String checkPassword(int membershipNo,String password)
	{
		String status="";
	
		try {
		String query="select * from UserData where membershipNo="+membershipNo+" and password='"+password+"'";
		ResultSet rs=statement.executeQuery(query);
		if(rs.next())
		status = rs.getString("role");
	        }
	    catch(Exception e)
	    {
		System.out.println(e);
	    }
	return status ;
	}
	public  int addStudent(String name,String e_mail,String role,String password)
	{
	
     String query="insert into userdata (name,email,role,password) values ('"+name+"','"+e_mail+"','"+role+"','"+password+"')";
    try {
     statement.executeUpdate(query);
     query="select * from userdata order by membershipNo desc limit 1";
     ResultSet rs=statement.executeQuery(query);
     if(rs.next())
     {
     int memberShipNo=Integer.parseInt(rs.getString(7));


     SendConfirmationMail email=new SendConfirmationMail();
     email.sendEmail(e_mail,name,memberShipNo,password);
     return memberShipNo;
     }
        }catch(Exception e)
        {
    	System.out.println(e);
    	
        }
      return 0;
	}
}
