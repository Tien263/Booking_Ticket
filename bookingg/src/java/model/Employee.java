package model;

import java.util.ArrayList;

public class Employee {
    private int id;
    private String name;
    private String phone;
    private String address;
    private boolean gender;
    private int RoleID;
    private Role role;

    public Employee(int id, String name, String phone, String address, boolean gender, int RoleID, Role role) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
        this.RoleID = RoleID;
        this.role = role;
    }

    

    public Employee() {
    }

    

    public Employee(int id, String name, String phone, String address, boolean gender, int RoleID) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
        this.RoleID = RoleID;
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

    public int getRoleID() {
        return RoleID;
    }

    public void setRoleID(int roleID) {
        RoleID = roleID;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
    
}
