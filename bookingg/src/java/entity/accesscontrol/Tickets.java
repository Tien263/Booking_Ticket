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
public class Tickets {

    private int t_id;
    private String t_status;
    private float t_price;
    private int bt1_id;
    private String s_id;
    private Date t_purchaseDate;

    public Tickets() {
    }

    public Tickets(int t_id, String t_status, float t_price, int bt1_id, String s_id, Date t_purchaseDate) {
        this.t_id = t_id;
        this.t_status = t_status;
        this.t_price = t_price;
        this.bt1_id = bt1_id;
        this.s_id = s_id;
        this.t_purchaseDate = t_purchaseDate;
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

    public float getT_price() {
        return t_price;
    }

    public void setT_price(float t_price) {
        this.t_price = t_price;
    }

    public int getBt1_id() {
        return bt1_id;
    }

    public void setBt1_id(int bt1_id) {
        this.bt1_id = bt1_id;
    }

    public String getS_id() {
        return s_id;
    }

    public void setS_id(String s_id) {
        this.s_id = s_id;
    }

    public Date getT_purchaseDate() {
        return t_purchaseDate;
    }

    public void setT_purchaseDate(Date t_purchaseDate) {
        this.t_purchaseDate = t_purchaseDate;
    }
    
    
}
