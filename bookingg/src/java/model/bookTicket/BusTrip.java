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
    private double tPrice;
    private String brFrom;
    private String brTo;
    private String brDescription;
    private double brDistance;

    public BusTrip(int brId, String bt1DepartureTime, String bt1ArrivalTime, double tPrice, String brFrom, String brTo, String brDescription, double brDistance) {
        this.brId = brId;
        this.bt1DepartureTime = bt1DepartureTime;
        this.bt1ArrivalTime = bt1ArrivalTime;
        this.tPrice = tPrice;
        this.brFrom = brFrom;
        this.brTo = brTo;
        this.brDescription = brDescription;
        this.brDistance = brDistance;
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

    public double getTPrice() {
        return tPrice;
    }

    public void setTPrice(double tPrice) {
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
}
