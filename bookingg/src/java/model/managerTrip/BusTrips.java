/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.managerTrip;

import model.*;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author Admin
 */
public class BusTrips {

    private int bt1_id;
    private LocalDate bt1_date;
    private LocalTime bt1_departureTime;
    private LocalTime bt1_arrivalTime;
    private String bt1_status;
    private int br_id;
    private String v_licensePlate;

    public BusTrips() {
    }

    public BusTrips(int bt1_id, LocalDate bt1_date, LocalTime bt1_departureTime, LocalTime bt1_arrivalTime, String bt1_status, int br_id) {
        this.bt1_id = bt1_id;
        this.bt1_date = bt1_date;
        this.bt1_departureTime = bt1_departureTime;
        this.bt1_arrivalTime = bt1_arrivalTime;
        this.bt1_status = bt1_status;
        this.br_id = br_id;
    }

    
    
    public BusTrips(int bt1_id, LocalDate bt1_date, LocalTime bt1_departureTime, LocalTime bt1_arrivalTime, String bt1_status, int br_id, String v_licensePlate) {
        this.bt1_id = bt1_id;
        this.bt1_date = bt1_date;
        this.bt1_departureTime = bt1_departureTime;
        this.bt1_arrivalTime = bt1_arrivalTime;
        this.bt1_status = bt1_status;
        this.br_id = br_id;
        this.v_licensePlate = v_licensePlate;
    }

    public String getV_licensePlate() {
        return v_licensePlate;
    }

    public void setV_licensePlate(String v_licensePlate) {
        this.v_licensePlate = v_licensePlate;
    }
       
    public int getBt1_id() {
        return bt1_id;
    }

    public void setBt1_id(int bt1_id) {
        this.bt1_id = bt1_id;
    }

    public LocalDate getBt1_date() {
        return bt1_date;
    }

    public void setBt1_date(LocalDate bt1_date) {
        this.bt1_date = bt1_date;
    }

    public LocalTime getBt1_departureTime() {
        return bt1_departureTime;
    }

    public void setBt1_departureTime(LocalTime bt1_departureTime) {
        this.bt1_departureTime = bt1_departureTime;
    }

    public LocalTime getBt1_arrivalTime() {
        return bt1_arrivalTime;
    }

    public void setBt1_arrivalTime(LocalTime bt1_arrivalTime) {
        this.bt1_arrivalTime = bt1_arrivalTime;
    }

    public String getBt1_status() {
        return bt1_status;
    }

    public void setBt1_status(String bt1_status) {
        this.bt1_status = bt1_status;
    }

    public int getBr_id() {
        return br_id;
    }

    public void setBr_id(int br_id) {
        this.br_id = br_id;
    }
    
    
}
