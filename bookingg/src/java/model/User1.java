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
  
    private String c_fullname;
    private String c_email;
    private String oh_date;
    private String p1_date;
    private String pm_name;
    private int t_id;
    private String bt1_departureTime;
    private String bt1_arrivalTime;
    private String t_status;
    private double oh_totalAmount;

    
    // Constructor

    public User1(String c_fullname, String c_email, String oh_date, String p1_date, String pm_name, int t_id, String bt1_departureTime, String bt1_arrivalTime, String t_status, double oh_totalAmount) {
        this.c_fullname = c_fullname;
        this.c_email = c_email;
        this.oh_date = oh_date;
        this.p1_date = p1_date;
        this.pm_name = pm_name;
        this.t_id = t_id;
        this.bt1_departureTime = bt1_departureTime;
        this.bt1_arrivalTime = bt1_arrivalTime;
        this.t_status = t_status;
        this.oh_totalAmount = oh_totalAmount;
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

    public String getOh_date() {
        return oh_date;
    }

    public void setOh_date(String oh_date) {
        this.oh_date = oh_date;
    }

    public String getP1_date() {
        return p1_date;
    }

    public void setP1_date(String p1_date) {
        this.p1_date = p1_date;
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

    
    public String getT_status() {
        return t_status;
    }

    
    public void setT_status(String t_status) {
        this.t_status = t_status;
    }

    public double getOh_totalAmount() {
        return oh_totalAmount;
    }

    
    public void setOh_totalAmount(double oh_totalAmount) {
        this.oh_totalAmount = oh_totalAmount;
    }
    
}
