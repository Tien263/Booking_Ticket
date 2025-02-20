/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Seats {

    private int s_id;
    private String s_name;
    private String s_status;
    private int v_id;
    private int bt1_id;
    private int level;

    public Seats() {
    }

    public Seats(int s_id, String s_name, String s_status, int v_id, int bt1_id, int level) {
        this.s_id = s_id;
        this.s_name = s_name;
        this.s_status = s_status;
        this.v_id = v_id;
        this.bt1_id = bt1_id;
        this.level = level;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
    
    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public String getS_status() {
        return s_status;
    }

    public void setS_status(String s_status) {
        this.s_status = s_status;
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
    
    public boolean isAvailable() {
        return "available".equalsIgnoreCase(s_status);
    }
}
