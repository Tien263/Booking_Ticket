/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.bookTicket;

/**
 *
 * @author ADMIN
 */

import java.util.Date;

public class Tickets {
    private int id;
    private String status;
    private int btId;
    private int sId;
    private Date purchaseDate;

    public Tickets() {
    }

    public Tickets(int id, String status, int btId, int sId, Date purchaseDate) {
        this.id = id;
        this.status = status;
        this.btId = btId;
        this.sId = sId;
        this.purchaseDate = purchaseDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getBtId() {
        return btId;
    }

    public void setBtId(int btId) {
        this.btId = btId;
    }

    public int getSId() {
        return sId;
    }

    public void setSId(int sId) {
        this.sId = sId;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }
}