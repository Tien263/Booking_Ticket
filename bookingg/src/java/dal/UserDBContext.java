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
import model.Role;

/**
 *
 * @author ADMIN
 */
public class UserDBContext extends DBContext<User> {

    public User checkAuthen(String username, String password) {
        String sql = "SELECT * FROM Users WHERE u_username = ? AND u_password = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("u_username"));
                user.setPassword(rs.getString("u_password"));
                user.seteId(rs.getInt("e_id"));
                user.setRoleID(rs.getInt("r_id"));
                return user;
            }
        } catch (Exception e) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (Exception e) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return null;
    }

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

    @Override
    public void insert(User entity) {
        String sql = "INSERT INTO [dbo].[Users] ([u_username], [u_password], [r_id]) VALUES (?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, entity.getUsername());
            ps.setString(2, entity.getPassword());
            ps.setInt(3, entity.getRole().getId());
            ps.executeUpdate();
//            int rowsAffected = ps.executeUpdate();
//            if (rowsAffected > 0) {
//                ResultSet generatedKeys = ps.getGeneratedKeys();
//                if (generatedKeys.next()) {
//                    entity.set(generatedKeys.getInt(1)); // Cập nhật e_id cho Employee
//                }
//                return true;
//            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

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
