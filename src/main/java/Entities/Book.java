package Entities;

public class Book {
	private String bookName;
	private int bookId;
	private String author;
	private String edition;
	private String quantity;
	private String issueDate;
	private String returnDate;
	public Book()
	{
		
	}
	
	Book(String bookName, int bookId, String author, String edition, String quantity)
	{
		this.setBookName(bookName);
		this.bookId=bookId;
		this.setAuthor(author);
		this.setEdition(edition);
		this.setQuantity(quantity);
	}
	
	public void setBook(String bookName, String bookId, String author, String edition, String quantity)
	{
		this.setBookName(bookName);
		
		this.setAuthor(author);
		this.setEdition(edition);
		this.setQuantity(quantity);
	}
	public Book get()
	{
		return this;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public void setIssueDate(String issueDate)
	{
		this.issueDate=issueDate;
	}
	public String getIssueDate()
	{
		return issueDate;
	}
    public void setReturnDate(String returnDate)
    {
    	this.returnDate=returnDate;
    }
    public String getReturnDate()
    {
    	return returnDate;
    }
	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getEdition() {
		return edition;
	}

	public void setEdition(String edition) {
		this.edition = edition;
	}

	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId)
	{
		this.bookId=bookId;
	}
	

	
}
