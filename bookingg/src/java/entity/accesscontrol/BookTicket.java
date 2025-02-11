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
    private int bt_status;
    private Date bt_bookingDate;
    private int c_id;
    private float bt_ticketNumber;
    private int t_id;
    private int i_id;

    public BookTicket() {
    }

    public BookTicket(int bt_id, int bt_status, Date bt_bookingDate, int c_id, float bt_ticketNumber, int t_id, int i_id) {
        this.bt_id = bt_id;
        this.bt_status = bt_status;
        this.bt_bookingDate = bt_bookingDate;
        this.c_id = c_id;
        this.bt_ticketNumber = bt_ticketNumber;
        this.t_id = t_id;
        this.i_id = i_id;
    }

    public int getBt_id() {
        return bt_id;
    }

    public void setBt_id(int bt_id) {
        this.bt_id = bt_id;
    }

    public int getBt_status() {
        return bt_status;
    }

    public void setBt_status(int bt_status) {
        this.bt_status = bt_status;
    }

    public Date getBt_bookingDate() {
        return bt_bookingDate;
    }

    public void setBt_bookingDate(Date bt_bookingDate) {
        this.bt_bookingDate = bt_bookingDate;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public float getBt_ticketNumber() {
        return bt_ticketNumber;
    }

    public void setBt_ticketNumber(float bt_ticketNumber) {
        this.bt_ticketNumber = bt_ticketNumber;
    }

    public int getT_id() {
        return t_id;
    }

    public void setT_id(int t_id) {
        this.t_id = t_id;
    }

    public int getI_id() {
        return i_id;
    }

    public void setI_id(int i_id) {
        this.i_id = i_id;
    }

    

    
}
