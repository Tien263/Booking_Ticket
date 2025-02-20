/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.promotion;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class Promotions_By_Code {
    private int id;
    private String code;
    private double discount;
    private Date endDate;
    private int quantity;

    public Promotions_By_Code() {
    }

    public Promotions_By_Code(int id, String code, double discount, Date endDate, int quantity) {
        this.id = id;
        this.code = code;
        this.discount = discount;
        this.endDate = endDate;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    
    
}
