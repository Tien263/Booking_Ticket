/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import MD5.BCrypt;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Employee;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import java.sql.*;

/**
 *
 * @author ADMIN
 */
public class EmployeeDao extends DBContext<Employee> {

    public boolean updateUserEId(String username, int eId) {
        String sql = "UPDATE Users SET e_id = ? WHERE u_username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, eId);
            ps.setString(2, username);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("✅ Updated e_id for user: " + username + " -> e_id: " + eId);
                return true;
            } else {
                System.out.println("⚠️ Failed to update e_id for user: " + username);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateEmployee(Employee emp) {
        String sql = "UPDATE Employee SET e_name = ?, e_phone = ?, e_address = ?, e_gender = ? WHERE e_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, emp.getName());
            ps.setString(2, emp.getPhone());
            ps.setString(3, emp.getAddress());
            ps.setBoolean(4, emp.isGender());
            ps.setInt(5, emp.getId());

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Employee updated successfully! e_id: " + emp.getId());
                return true;
            } else {
                System.out.println("No rows updated! Check if e_id exists: " + emp.getId());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean insertEmployee(Employee emp) {
        String sql = "INSERT INTO Employee (e_name, e_phone, e_address, e_gender) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, emp.getName());
            ps.setString(2, emp.getPhone());
            ps.setString(3, emp.getAddress());
            ps.setBoolean(4, emp.isGender());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    emp.setId(generatedKeys.getInt(1)); // Cập nhật e_id cho Employee
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

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

    public User getUserByUsernameAndPassword(String username, String password) {
        User user = null;
        BCrypt bCrypt = new BCrypt();
        String sql = "SELECT u.u_username, u.u_password, COALESCE(u.e_id, -1) AS e_id "
                + "FROM Users u WHERE u.u_username = ? AND u.u_password = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User(rs.getString("u_username"), bCrypt.hashpw(rs.getString("u_password"),bCrypt.gensalt()));
                int retrievedEId = rs.getInt("e_id"); // Lấy e_id từ DB, sql));
                user.seteId(retrievedEId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
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
        String sql = "SELECT * FROM Employee WHERE e_id = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                return new Employee(
                        rs.getInt("e_id"),
                        rs.getString("e_name"),
                        rs.getString("e_phone"),
                        rs.getString("e_address"),
                        rs.getBoolean("e_gender"),
                        rs.getInt("r_id")
                );
            }
        } catch (Exception e) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (Exception e) {
                Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return null;
    }
    public Employee getEmployeeById(int eId) {
    Employee employee = null;
    String sql = "SELECT e_id, e_name, e_phone, e_address, e_gender FROM Employee WHERE e_id = ?";

    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, eId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            employee = new Employee();
            employee.setId(rs.getInt("e_id"));
            employee.setName(rs.getString("e_name"));
            employee.setPhone(rs.getString("e_phone"));
            employee.setAddress(rs.getString("e_address"));
            employee.setGender(rs.getBoolean("e_gender"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return employee;
}


}
