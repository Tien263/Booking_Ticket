/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class Email {

    public Email() {
    }
    
    public boolean  sendEmail(String to, String subject, String content) {
        final String from = "anhttphe181589@fpt.edu.vn";
        final String password = "pzwj oapb renr rnmx";

        // Properties :
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // create Authenticator
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        //Phien lam viec
        Session session = Session.getInstance(properties, authenticator);

        //Sending email
        MimeMessage message = new MimeMessage(session);

        try {
            message.addHeader("Content-type", "text/HTML; charset=UTF-8");
            message.setFrom(from);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            message.setSubject(subject, "UTF-8");
            message.setSentDate(new Date());
            //message.setReplyTo(InternetAddress.parse(from, false));
            message.setText(content, "UTF-8");
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            System.out.println("SendEmail " + e);
            return false;
        }
    }
}
