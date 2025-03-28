/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.feedback;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Feedback {
     private int feedbackID;
    private int bookTicketID;
    private int rating;
    private String comment;
    private Date feedbackDate;
    private String status;

    public Feedback() {
    }

    public Feedback(int feedbackID, int bookTicketID, int rating, String comment, Date feedbackDate, String status) {
        this.feedbackID = feedbackID;
        this.bookTicketID = bookTicketID;
        this.rating = rating;
        this.comment = comment;
        this.feedbackDate = feedbackDate;
        this.status = status;
    }

    public Feedback(int bookTicketID, int rating, String comment) {
        this.bookTicketID = bookTicketID;
        this.rating = rating;
        this.comment = comment;
    }
    

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public int getbookTicketID() {
        return bookTicketID;
    }

    public void setbookTicketID(int bookTicketID) {
        this.bookTicketID = bookTicketID;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getFeedbackDate() {
        return feedbackDate;
    }

    public void setFeedbackDate(Date feedbackDate) {
        this.feedbackDate = feedbackDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
