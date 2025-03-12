package model;

import java.util.ArrayList;

public class User {

    private String username;
    private String password;
    private int eId = -1; // Default is -1 if no Employee
    private ArrayList<Employee> emp = new ArrayList<>();
    private int RoleID;

    public int getFirstEmployeeId() {
        if (!emp.isEmpty()) {
            return emp.get(0).getId(); // Return first Employee ID
        }
        return -1; // Return -1 if no Employee
    }

    public boolean hasEmployeeInfo() {
        System.out.println("🔍 Checking Employee Info: e_id = " + eId);
        return eId > 0; // Return true if list is not empty
    }

    public int getRoleID() {
        return RoleID;
    }

    public void setRoleID(int roleID) {
        this.RoleID = roleID;
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
