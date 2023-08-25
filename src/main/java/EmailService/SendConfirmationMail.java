package EmailService;


//package com.lib.service;

import javax.mail.*;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendConfirmationMail {


    
    String from = "rpathare332@gmail.com";




	public  void sendEmail(  String to, String name,int id,String password) {
		// TODO Auto-generated method stub
		//variable for gmail host
		String host = "smtp.gmail.com";
		String from="rpathare332@gmail.com";
		//get the system properties
		Properties properties = System.getProperties();
		System.out.println("Properties:" + properties);
		
		//set host
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.starttls.enable","true");
		properties.put("mail.smtp.auth", "true");
		properties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");


		
		//step1 : to get session object
		Session session = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(from, "alupwdjlusmalfqy");
			}
			
			
		} );
		
		session.setDebug(true);
		MimeMessage m = new MimeMessage(session);
		try {
		//from email
	
		m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		m.setFrom(new InternetAddress(from));
			
		String subject = "Confirmation Email";
		m.setSubject(subject);
		
		String msg = "This is Confirnation message for you \n you are successfully registered to our Library Application your id is "+id+"and password is "+password;
		
		m.setText(msg);
		
		Transport.send(m);
	
		System.out.println("sent...");
		
		
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}


}
