/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.bookTicket;

/**
 *
 * @author Nguyen Minh Duc
 */

public class BusTrip {
    private int brId;
    private String bt1DepartureTime;
    private String bt1ArrivalTime;
    private float tPrice;
    private String brFrom;
    private String brTo;
    private String brDescription;
    private double brDistance;
    private int v_id;
    private int bt1_id;

    public BusTrip(int brId, String bt1DepartureTime, String bt1ArrivalTime, float tPrice, String brFrom, String brTo, String brDescription, double brDistance, int v_id, int bt1_id) {
        this.brId = brId;
        this.bt1DepartureTime = bt1DepartureTime;
        this.bt1ArrivalTime = bt1ArrivalTime;
        this.tPrice = tPrice;
        this.brFrom = brFrom;
        this.brTo = brTo;
        this.brDescription = brDescription;
        this.brDistance = brDistance;
        this.v_id = v_id;
        this.bt1_id = bt1_id;
    }

    public int getBrId() {
        return brId;
    }

    public void setBrId(int brId) {
        this.brId = brId;
    }

    public String getBt1DepartureTime() {
        return bt1DepartureTime;
    }

    public void setBt1DepartureTime(String bt1DepartureTime) {
        this.bt1DepartureTime = bt1DepartureTime;
    }

    public String getBt1ArrivalTime() {
        return bt1ArrivalTime;
    }

    public void setBt1ArrivalTime(String bt1ArrivalTime) {
        this.bt1ArrivalTime = bt1ArrivalTime;
    }

    public float gettPrice() {
        return tPrice;
    }

    public void settPrice(float tPrice) {
        this.tPrice = tPrice;
    }

    public String getBrFrom() {
        return brFrom;
    }

    public void setBrFrom(String brFrom) {
        this.brFrom = brFrom;
    }

    public String getBrTo() {
        return brTo;
    }

    public void setBrTo(String brTo) {
        this.brTo = brTo;
    }

    public String getBrDescription() {
        return brDescription;
    }

    public void setBrDescription(String brDescription) {
        this.brDescription = brDescription;
    }

    public double getBrDistance() {
        return brDistance;
    }

    public void setBrDistance(double brDistance) {
        this.brDistance = brDistance;
    }

    public int getV_id() {
        return v_id;
    }

    public void setV_id(int v_id) {
        this.v_id = v_id;
    }

    public int getBt1_id() {
        return bt1_id;
    }

    public void setBt1_id(int bt1_id) {
        this.bt1_id = bt1_id;
    }

    
}
