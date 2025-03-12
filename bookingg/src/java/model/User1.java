/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Nguyen Minh Duc
 */
public class User1 {
    private int c_id;
    private String c_fullname;
    private String c_email;
    private int oh_id;
    private String oh_date;
    private String oh_status;
    private double oh_totalAmount;
    private String p1_date;
    private double p1_amount;
    private String pm_name;
    private int t_id;
    private String t_status;
    private String bt1_departureTime;
    private String bt1_arrivalTime;
    private double i_totalPrice;

    // Constructor
    public User1(int c_id, String c_fullname, String c_email, int oh_id, String oh_date, 
                 String oh_status, double oh_totalAmount, String p1_date, double p1_amount, 
                 String pm_name, int t_id, String t_status, String bt1_departureTime, 
                 String bt1_arrivalTime, double i_totalPrice) {
        this.c_id = c_id;
        this.c_fullname = c_fullname;
        this.c_email = c_email;
        this.oh_id = oh_id;
        this.oh_date = oh_date;
        this.oh_status = oh_status;
        this.oh_totalAmount = oh_totalAmount;
        this.p1_date = p1_date;
        this.p1_amount = p1_amount;
        this.pm_name = pm_name;
        this.t_id = t_id;
        this.t_status = t_status;
        this.bt1_departureTime = bt1_departureTime;
        this.bt1_arrivalTime = bt1_arrivalTime;
        this.i_totalPrice = i_totalPrice;
    }

    // Getters and Setters
    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getC_fullname() {
        return c_fullname;
    }

    public void setC_fullname(String c_fullname) {
        this.c_fullname = c_fullname;
    }

    public String getC_email() {
        return c_email;
    }

    public void setC_email(String c_email) {
        this.c_email = c_email;
    }

    public int getOh_id() {
        return oh_id;
    }

    public void setOh_id(int oh_id) {
        this.oh_id = oh_id;
    }

    public String getOh_date() {
        return oh_date;
    }

    public void setOh_date(String oh_date) {
        this.oh_date = oh_date;
    }

    public String getOh_status() {
        return oh_status;
    }

    public void setOh_status(String oh_status) {
        this.oh_status = oh_status;
    }

    public double getOh_totalAmount() {
        return oh_totalAmount;
    }

    public void setOh_totalAmount(double oh_totalAmount) {
        this.oh_totalAmount = oh_totalAmount;
    }

    public String getP1_date() {
        return p1_date;
    }

    public void setP1_date(String p1_date) {
        this.p1_date = p1_date;
    }

    public double getP1_amount() {
        return p1_amount;
    }

    public void setP1_amount(double p1_amount) {
        this.p1_amount = p1_amount;
    }

    public String getPm_name() {
        return pm_name;
    }

    public void setPm_name(String pm_name) {
        this.pm_name = pm_name;
    }

    public int getT_id() {
        return t_id;
    }

    public void setT_id(int t_id) {
        this.t_id = t_id;
    }

    public String getT_status() {
        return t_status;
    }

    public void setT_status(String t_status) {
        this.t_status = t_status;
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

    public double getI_totalPrice() {
        return i_totalPrice;
    }

    public void setI_totalPrice(double i_totalPrice) {
        this.i_totalPrice = i_totalPrice;
    }

    @Override
    public String toString() {
        return "User1{" +
                "c_id=" + c_id +
                ", c_fullname='" + c_fullname + '\'' +
                ", c_email='" + c_email + '\'' +
                ", oh_id=" + oh_id +
                ", oh_date='" + oh_date + '\'' +
                ", oh_status='" + oh_status + '\'' +
                ", oh_totalAmount=" + oh_totalAmount +
                ", p1_date='" + p1_date + '\'' +
                ", p1_amount=" + p1_amount +
                ", pm_name='" + pm_name + '\'' +
                ", t_id=" + t_id +
                ", t_status='" + t_status + '\'' +
                ", bt1_departureTime='" + bt1_departureTime + '\'' +
                ", bt1_arrivalTime='" + bt1_arrivalTime + '\'' +
                ", i_totalPrice=" + i_totalPrice +
                '}';
    }
}

