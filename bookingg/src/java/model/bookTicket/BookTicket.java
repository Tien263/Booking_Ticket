/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.bookTicket;

import model.*;
import java.util.Date;

/**
 *
 * @author Admin
 */public class BookTicket {

    private int t_id;
    private String c_fullname;
    private String c_phone;
    private Date bt_purchaseDate;
    private Date bt_bookingDate;
    private String br_adress;
    private String bt1_time;
    private String s_name;
    private float br_price;
    private String bt_status;
    private int bt_id;
    private double TotalAmount;
    // Thêm các thuộc tính liên quan đến khuyến mãi
    private Integer pbcId; // ID của mã khuyến mãi (Promotions_By_Code)
    private Integer pbdId; // ID của chương trình khuyến mãi theo ngày (Promotions_By_Date)
    private Integer pbpId; // ID của chương trình khuyến mãi theo hành khách (Promotions_By_Passengers)

    public BookTicket(int t_id, String c_fullname, String c_phone, Date bt_purchaseDate, Date bt_bookingDate, String br_adress, String bt1_time, String s_name, float br_price, String bt_status, int bt_id, double TotalAmount, Integer pbcId, Integer pbdId, Integer pbpId) {
        this.t_id = t_id;
        this.c_fullname = c_fullname;
        this.c_phone = c_phone;
        this.bt_purchaseDate = bt_purchaseDate;
        this.bt_bookingDate = bt_bookingDate;
        this.br_adress = br_adress;
        this.bt1_time = bt1_time;
        this.s_name = s_name;
        this.br_price = br_price;
        this.bt_status = bt_status;
        this.bt_id = bt_id;
        this.TotalAmount = TotalAmount;
        this.pbcId = pbcId;
        this.pbdId = pbdId;
        this.pbpId = pbpId;
    }

    public Integer getPbcId() {
        return pbcId;
    }

    public void setPbcId(Integer pbcId) {
        this.pbcId = pbcId;
    }

    public Integer getPbdId() {
        return pbdId;
    }

    public void setPbdId(Integer pbdId) {
        this.pbdId = pbdId;
    }

    public Integer getPbpId() {
        return pbpId;
    }

    public void setPbpId(Integer pbpId) {
        this.pbpId = pbpId;
    }
    
    

    public int getBt_id() {
        return bt_id;
    }

    public void setBt_id(int bt_id) {
        this.bt_id = bt_id;
    }

    public double getTotalAmount() {
        return TotalAmount;
    }

    public void setTotalAmount(double TotalAmount) {
        this.TotalAmount = TotalAmount;
    }

    

    public String getBt_status() {
        return bt_status;
    }

    public void setBt_status(String bt_status) {
        this.bt_status = bt_status;
    }
    
    

    public BookTicket() {
    }

    public BookTicket(int t_id, String c_fullname, String c_phone, Date bt_purchaseDate, Date bt_bookingDate, String br_adress, String bt1_time, String s_name, float br_price) {
        this.t_id = t_id;
        this.c_fullname = c_fullname;
        this.c_phone = c_phone;
        this.bt_purchaseDate = bt_purchaseDate;
        this.bt_bookingDate = bt_bookingDate;
        this.br_adress = br_adress;
        this.bt1_time = bt1_time;
        this.s_name = s_name;
        this.br_price = br_price;
    }

    public Date getBt_purchaseDate() {
        return bt_purchaseDate;
    }

    public void setBt_purchaseDate(Date bt_purchaseDate) {
        this.bt_purchaseDate = bt_purchaseDate;
    }

    public int getT_id() {
        return t_id;
    }

    public void setT_id(int t_id) {
        this.t_id = t_id;
    }

    public String getC_fullname() {
        return c_fullname;
    }

    public void setC_fullname(String c_fullname) {
        this.c_fullname = c_fullname;
    }

    public String getC_phone() {
        return c_phone;
    }

    public void setC_phone(String c_phone) {
        this.c_phone = c_phone;
    }

    public Date getBt_bookingDate() {
        return bt_bookingDate;
    }

    public void setBt_bookingDate(Date bt_bookingDate) {
        this.bt_bookingDate = bt_bookingDate;
    }

    public String getBr_adress() {
        return br_adress;
    }

    public void setBr_adress(String br_adress) {
        this.br_adress = br_adress;
    }

    public String getBt1_time() {
        return bt1_time;
    }

    public void setBt1_time(String bt1_time) {
        this.bt1_time = bt1_time;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public float getBr_price() {
        return br_price;
    }

    public void setBr_price(float br_price) {
        this.br_price = br_price;
    }
    
    
}
