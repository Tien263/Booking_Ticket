/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class User {

    private String username;
    private String password;
    private int eId = -1; // Mặc định là -1 nếu chưa có Employee
    private ArrayList<Employee> emp = new ArrayList<>();

    // Lấy e_id của nhân viên đầu tiên nếu có (tránh lỗi khi Employee trống)
    public int getFirstEmployeeId() {
        if (!emp.isEmpty()) {
            return emp.get(0).getId(); // Lấy e_id của nhân viên đầu tiên
        }
        return -1; // Trả về -1 nếu không có Employee nào
    }

    public boolean hasEmployeeInfo() {
        System.out.println("🔍 Checking Employee Info: e_id = " + eId);
        return eId > 0; //trả về true nếu danh sách không trống
    }

    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
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

    public ArrayList<Employee> getEmp() {
        return emp;
    }

    public void setEmp(ArrayList<Employee> emp) {
        this.emp = emp;
    }

    // Thêm Employee vào danh sách
    public void addEmployee(Employee employee) {
        this.emp.add(employee);
    }

    public int geteId() {
        return eId;
    }

    public void seteId(int eId) {
        this.eId = eId;
    }

}
