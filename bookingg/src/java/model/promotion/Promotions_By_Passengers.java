/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.promotion;

public class Promotions_By_Passengers {
    private int id;
    private String name;
    private double discount;
    private int minTickets;
    private int minPoints;
    private Integer eId; // Liên kết với bảng Employee, có thể null
    private Integer priority; // Có thể null

    public Promotions_By_Passengers() {
    }

    public Promotions_By_Passengers(int id, String name, double discount, int minTickets, int minPoints, Integer eId, Integer priority) {
        this.id = id;
        this.name = name;
        this.discount = discount;
        this.minTickets = minTickets;
        this.minPoints = minPoints;
        this.eId = eId;
        this.priority = priority;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getMinTickets() {
        return minTickets;
    }

    public void setMinTickets(int minTickets) {
        this.minTickets = minTickets;
    }

    public int getMinPoints() {
        return minPoints;
    }

    public void setMinPoints(int minPoints) {
        this.minPoints = minPoints;
    }

    public Integer getEId() {
        return eId;
    }

    public void setEId(Integer eId) {
        this.eId = eId;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    @Override
    public String toString() {
        return "Promotions_By_Passengers{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", discount=" + discount +
                ", minTickets=" + minTickets +
                ", minPoints=" + minPoints +
                ", eId=" + eId +
                ", priority=" + priority +
                '}';
    }
}