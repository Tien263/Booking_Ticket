/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.accesscontrol.User;

/**
 *
 * @author ADMIN
 */
public class Customer extends User{
    private String email;
    private String fullname;
    private String phone;
    private String address;
    private boolean gender;

    public Customer() {
    }

    public Customer(String email, String fullname, String phone, String address, boolean gender, String username, String password) {
        super(username, password);
        this.email = email;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }
    
    
    
}
