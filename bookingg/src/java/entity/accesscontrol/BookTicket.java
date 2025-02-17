/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity.accesscontrol;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class BookTicket {

    private int bt_id;
    private String c_fullname;
    private String c_phone;
    private Date bt_bookingDate;
    private String br_from;
    private String br_to;
    private String bt1_departureTime;
    private String bt1_arrivalTime;
    private String s_name;
    private float t_price;

    public BookTicket() {
    }

    public BookTicket(int bt_id, String c_fullname, String c_phone, Date bt_bookingDate, String br_from, String br_to, String bt1_departureTime, String bt1_arrivalTime, String s_name, float t_price) {
        this.bt_id = bt_id;
        this.c_fullname = c_fullname;
        this.c_phone = c_phone;
        this.bt_bookingDate = bt_bookingDate;
        this.br_from = br_from;
        this.br_to = br_to;
        this.bt1_departureTime = bt1_departureTime;
        this.bt1_arrivalTime = bt1_arrivalTime;
        this.s_name = s_name;
        this.t_price = t_price;
    }

    public int getBt_id() {
        return bt_id;
    }

    public void setBt_id(int bt_id) {
        this.bt_id = bt_id;
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

    public String getBr_from() {
        return br_from;
    }

    public void setBr_from(String br_from) {
        this.br_from = br_from;
    }

    public String getBr_to() {
        return br_to;
    }

    public void setBr_to(String br_to) {
        this.br_to = br_to;
    }

    public String getBt1_departureTime() {
        return bt1_departureTime;
    }

    public void setBt1_departureTime(String bt1_departureTime) {
        this.bt1_departureTime = bt1_departureTime;
    }

    public String getBt1_arrivalTime() {
        return bt1_arrivalTime;
    }

    public void setBt1_arrivalTime(String bt1_arrivalTime) {
        this.bt1_arrivalTime = bt1_arrivalTime;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public float getT_price() {
        return t_price;
    }

    public void setT_price(float t_price) {
        this.t_price = t_price;
    }
    
    
}
