/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.ticket;

import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class BookedTicket {
    private int btId;
    private String btStatus;
    private LocalDate btBookingDate;
    private String btTicketNumber;
    private Double btTotalAmount;
    private String cEmail;
    private String cFullname;
    private String cPhone;

    public BookedTicket() {
    }

    public BookedTicket(int btId, String btStatus, LocalDate btBookingDate, String btTicketNumber, Double btTotalAmount, String cEmail, String cFullname, String cPhone) {
        this.btId = btId;
        this.btStatus = btStatus;
        this.btBookingDate = btBookingDate;
        this.btTicketNumber = btTicketNumber;
        this.btTotalAmount = btTotalAmount;
        this.cEmail = cEmail;
        this.cFullname = cFullname;
        this.cPhone = cPhone;
    }

    
    
    public int getBtId() {
        return btId;
    }

    public void setBtId(int btId) {
        this.btId = btId;
    }

    public String getBtStatus() {
        return btStatus;
    }

    public void setBtStatus(String btStatus) {
        this.btStatus = btStatus;
    }

    public LocalDate getBtBookingDate() {
        return btBookingDate;
    }

    public void setBtBookingDate(LocalDate btBookingDate) {
        this.btBookingDate = btBookingDate;
    }

    public String getBtTicketNumber() {
        return btTicketNumber;
    }

    public void setBtTicketNumber(String btTicketNumber) {
        this.btTicketNumber = btTicketNumber;
    }

    public Double getBtTotalAmount() {
        return btTotalAmount;
    }

    public void setBtTotalAmount(Double btTotalAmount) {
        this.btTotalAmount = btTotalAmount;
    }

    public String getcEmail() {
        return cEmail;
    }

    public void setcEmail(String cEmail) {
        this.cEmail = cEmail;
    }

    public String getcFullname() {
        return cFullname;
    }

    public void setcFullname(String cFullname) {
        this.cFullname = cFullname;
    }

    public String getcPhone() {
        return cPhone;
    }

    public void setcPhone(String cPhone) {
        this.cPhone = cPhone;
    }
    
    
}
