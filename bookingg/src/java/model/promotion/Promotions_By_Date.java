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
public class Promotions_By_Date {
    private int id;
    private String name;
    private Date startDate;
    private Date endDate;
    private double discount;
    private int quantity;
<<<<<<< HEAD
=======
    private Integer eId; // Liên kết với bảng Employee, có thể null
    private Integer priority; // Có thể null
>>>>>>> main

    public Promotions_By_Date() {
    }

<<<<<<< HEAD
=======
    public Promotions_By_Date(int id, String name, Date startDate, Date endDate, double discount, int quantity, Integer eId, Integer priority) {
        this.id = id;
        this.name = name;
        this.startDate = startDate;
        this.endDate = endDate;
        this.discount = discount;
        this.quantity = quantity;
        this.eId = eId;
        this.priority = priority;
    }
    
>>>>>>> main
    public Promotions_By_Date(int id, String name, Date startDate, Date endDate, double discount, int quantity) {
        this.id = id;
        this.name = name;
        this.startDate = startDate;
        this.endDate = endDate;
        this.discount = discount;
        this.quantity = quantity;
    }

<<<<<<< HEAD
=======
    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }
    
    

>>>>>>> main
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
<<<<<<< HEAD
    
=======
    @Override
    public String toString() {
        return "Promotions_By_Date{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", discount=" + discount +
                ", quantity=" + quantity +
                ", eId=" + eId +
                ", priority=" + priority +
                '}';
    }
>>>>>>> main
    
}
