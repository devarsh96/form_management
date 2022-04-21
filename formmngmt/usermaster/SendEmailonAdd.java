package com.efive.formmngmt.usermaster;

import java.io.IOException;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendEmailonAdd {

	// mail is send from here
	public static void sendEmailmethod(String fstnm, String email, String lstnm, String phno, String image){

		// variable.email host
		String host = "smtp.gmail.com";

		// get the system properties
		Properties prop = System.getProperties();
		System.err.println("Properties====>" + prop);

		// setting imp info to properties object
		prop.put("mail.smtp.host", host);
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.socketFactory.port", "465");
	    prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		// sTEP 1 TO GET THE SESSION OBJECT
		Session session = Session.getInstance(prop, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication("devarshpatel962001@gmail.com", "hello@962001");
			}

		});
		session.setDebug(true);

		MimeMessage mm = new MimeMessage(session);
		try {
																							//Details
			mm.setFrom("devarshpatel962001@gmail.com");

			mm.setRecipient(Message.RecipientType.TO, new InternetAddress(email));

			mm.setSubject("Login Alert!");

			mm.setText("this is first mail through java");
																							//HTML
			MimeMultipart multipart = new MimeMultipart("related");
	        MimeBodyPart messageBodyPart = new MimeBodyPart();
	        String htmlText = "<img src=\"cid:image\">"+ "<H1>"+fstnm+" "+lstnm+",</H1>\n" + "<H4>This is a login alert in system </H4>\n\n"
	        					+ "<H4>details :-\n  name : "+fstnm+" "+lstnm+"\n</H4>"
	        							+ "<H4>email : "+email+"\n</H4>"
	        							+ "<H4>phone : "+phno+"\n\n</H4>"
	        							;
	        messageBodyPart.setContent(htmlText, "text/html");
	        
	        multipart.addBodyPart(messageBodyPart);
	        																			//attachment
	        MimeBodyPart imagePart = new MimeBodyPart();
	        String fimg =  image.substring(4);																				
	        try {
				imagePart.attachFile("C:\\Users\\devar\\eclipse-Enterprise\\efive-forms-management\\src\\main\\resources\\static\\img\\"+fimg+"");
			} catch (IOException e) {
				
				e.printStackTrace();
			}
	         
	        multipart.addBodyPart(imagePart);
	        																			//body image
	        messageBodyPart = new MimeBodyPart();
	        DataSource fds = new FileDataSource("C:\\Users\\devar\\eclipse-Enterprise\\efive-forms-management\\src\\main\\resources\\static\\img\\welcomee.jpg");

	         messageBodyPart.setDataHandler(new DataHandler(fds));
	         messageBodyPart.setHeader("Content-ID", "<image>");

	     
	         multipart.addBodyPart(messageBodyPart);
	        
	        mm.setContent(multipart);
	        
			Transport.send(mm);
			System.err.println("SUCCESS.........");

		} catch (MessagingException e) {

			e.printStackTrace();
		}

	}

}
