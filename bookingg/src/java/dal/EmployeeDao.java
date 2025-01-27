/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Employee;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author ADMIN
 */
public class EmployeeDao extends DBContext<Employee> {

    public boolean hasEmployeeInfo(int userId) {
        String sql = "SELECT COUNT(*) FROM Employee WHERE e_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Nếu số bản ghi > 0, tức là đã có thông tin Employee
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Trả về false nếu có lỗi hoặc không tìm thấy
    }

    public User getEmployeeByUsername(String username, String password) {
        User user = null;
        String sql = "SELECT u.u_username, u.u_password, e.e_id, e.e_name, e.e_phone, e.e_address, e.e_gender "
                + "FROM Users u LEFT JOIN Employee e ON u.e_id = e.e_id "
                + "WHERE u.u_username = ? AND u.u_password = ?"; // Loại bỏ dấu nháy đơn xung quanh ?

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username); // Thay thế ? đầu tiên bằng username
            stm.setString(2, password); // Thay thế ? thứ hai bằng password
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                if (user == null) {
                    // Tạo đối tượng User khi tìm thấy kết quả
                    user = new User(rs.getString("u_username"), rs.getString("u_password"));
                }

                int eId = rs.getInt("e_id");
                if (!rs.wasNull()) {
                    // Nếu có thông tin Employee
                    Employee emp = new Employee();
                    emp.setId(eId);
                    emp.setName(rs.getString("e_name"));
                    emp.setPhone(rs.getString("e_phone"));
                    emp.setAddress(rs.getString("e_address"));
                    emp.setGender(rs.getBoolean("e_gender"));
                    user.getEmp().add(emp); // Thêm Employee vào danh sách của User
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return user; // Trả về đối tượng User hoặc null nếu không tìm thấy
    }

    public boolean checkUserNameExist(String username) {
        try {
            String sql = "select* from Users\n"
                    + "Where u_username = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public void insert(Employee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Employee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Employee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Employee> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Employee get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
