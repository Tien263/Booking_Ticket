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
    private String name;
    private String code;
    private double discount;
    private Date endDate;
    private int quantity;
<<<<<<< HEAD

    public Promotions_By_Code() {
    }

=======
    private Integer aId; // Liên kết với bảng Advertise, có thể null
    private Integer eId; // Liên kết với bảng Employee, có thể null
    private Integer priority; // Có thể null

    
    
    public Promotions_By_Code() {
    }

    public Promotions_By_Code(int id, String name, String code, double discount, Date endDate, int quantity, Integer aId, Integer eId, Integer priority) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.discount = discount;
        this.endDate = endDate;
        this.quantity = quantity;
        this.aId = aId;
        this.eId = eId;
        this.priority = priority;
    }
    
>>>>>>> main
    public Promotions_By_Code(int id, String name, String code, double discount, Date endDate, int quantity) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.discount = discount;
        this.endDate = endDate;
        this.quantity = quantity;
    }

<<<<<<< HEAD
=======
    public Integer getaId() {
        return aId;
    }

    public void setaId(Integer aId) {
        this.aId = aId;
    }

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
    
<<<<<<< HEAD
=======
   @Override
    public String toString() {
        return "Promotions_By_Code{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", discount=" + discount +
                ", endDate=" + endDate +
                ", quantity=" + quantity +
                ", aId=" + aId +
                ", eId=" + eId +
                ", priority=" + priority +
                '}';
    }
>>>>>>> main
    
}
