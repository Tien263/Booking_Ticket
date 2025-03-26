/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * @author ADMIN
 */
public class Customer {
    private int id;
    private String email;
    private String fullname;
    private String phone;
    private String address;
    private boolean gender;
    private String username;
    private String password;
    private String membershipLevel;
    private int points;

    public Customer() {
    }

    public String getMembershipLevel() {
        return membershipLevel;
    }

    public void setMembershipLevel(String membershipLevel) {
        this.membershipLevel = membershipLevel;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    
    public Customer(int id, String email, String fullname, String phone, String address, boolean gender, String username, String password, String membershipLevel, int points) {
        this.id = id;
        this.email = email;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
        this.username = username;
        this.password = password;
        this.membershipLevel = membershipLevel;
        this.points = points;
    }

    
    
    public Customer(int id, String email, String fullname, String phone, String address, boolean gender, String username, String password) {
        this.id = id;
        this.email = email;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
        this.username = username;
        this.password = password;
    }
    

    public Customer(String email, String fullname, String phone, String address, boolean gender, String username, String password) {
        this.email = email;
        this.fullname = fullname;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
        this.username = username;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
    
}
