/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity.accesscontrol;

/**
 *
 * @author Admin
 */
public class BusRoutes {

    private int br_id;
    private int br_distance;
    private String br_from;
    private String br_to;
    private String br_description;
    private int c_id;

    public BusRoutes() {
    }

    public BusRoutes(int br_id, int br_distance, String br_from, String br_to, String br_description, int c_id) {
        this.br_id = br_id;
        this.br_distance = br_distance;
        this.br_from = br_from;
        this.br_to = br_to;
        this.br_description = br_description;
        this.c_id = c_id;
    }

    public int getBr_id() {
        return br_id;
    }

    public void setBr_id(int br_id) {
        this.br_id = br_id;
    }

    public int getBr_distance() {
        return br_distance;
    }

    public void setBr_distance(int br_distance) {
        this.br_distance = br_distance;
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

    public String getBr_description() {
        return br_description;
    }

    public void setBr_description(String br_description) {
        this.br_description = br_description;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }
    
    
}
