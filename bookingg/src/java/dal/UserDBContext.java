/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import model.User1;
/**
 *
 * @author ADMIN
 */
public class UserDBContext extends DBContext<User> {

    public List<String> getRolesByUsername(String username) {
        List<String> roles = new ArrayList<>();
        String sql = "SELECT r.r_name FROM Roles r "
                + "JOIN Employee_Role er ON r.r_id = er.r_id "
                + "JOIN Employee e ON er.e_id = e.e_id "
                + "JOIN Users u ON e.e_id = u.e_id "
                + "WHERE u.u_username = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                roles.add(rs.getString("r_name"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return roles;
    }

    // Lấy thông tin User theo username
    public User getUserByUsername(String username) {
        String query = "select * from Users where u_username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getString("u_username"), rs.getString("u_password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User get(String username, String password) {
        String sql = "SELECT u.UserName FROM [User] u "
                + "WHERE u.UserName = ? AND u.[password] = ?";
        PreparedStatement stm = null;
        User user = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUsername(rs.getString("UserName"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return user;
    }

    // Cập nhật mật khẩu
    public boolean updatePassword(String username, String newPassword) {
        String query = "UPDATE Users SET u_password = ? WHERE u_username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<User1> getUserTransactions() {
        List<User1> userList = new ArrayList<>();
        String sql = "SELECT c.c_id, c.c_fullname, c.c_email, o.oh_id, o.oh_date, o.oh_status, o.oh_totalAmount, " +
                     "p.p1_date, p.p1_amount, pm.pm_name, t.t_id, t.t_status, bt.bt1_departureTime, " +
                     "bt.bt1_arrivalTime, i.i_totalPrice " +
                     "FROM dbo.Customer c " +
                     "JOIN dbo.Users u ON c.c_username = u.u_username " +
                     "JOIN dbo.Bill b ON c.c_id = b.b_id " +
                     "JOIN dbo.Payment p ON b.p1_id = p.p1_id " +
                     "JOIN dbo.PaymentMethods pm ON p.pm_id = pm.pm_id " +
                     "JOIN dbo.OrderHistory o ON p.p1_id = o.p1_id " +
                     "JOIN dbo.Tickets t ON o.oh_id = t.t_id " +
                     "JOIN dbo.BusTrips bt ON t.bt1_id = bt.bt1_id " +
                     "JOIN dbo.Invoice i ON pm.i_id = i.i_id " +
                     "ORDER BY o.oh_date DESC";

        try (
             PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User1 user = new User1(
                        rs.getInt("c_id"),
                        rs.getString("c_fullname"),
                        rs.getString("c_email"),
                        rs.getInt("oh_id"),
                        rs.getString("oh_date"),
                        rs.getString("oh_status"),
                        rs.getDouble("oh_totalAmount"),
                        rs.getString("p1_date"),
                        rs.getDouble("p1_amount"),
                        rs.getString("pm_name"),
                        rs.getInt("t_id"),
                        rs.getString("t_status"),
                        rs.getString("bt1_departureTime"),
                        rs.getString("bt1_arrivalTime"),
                        rs.getDouble("i_totalPrice")
                );
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public void insert(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(User entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
