/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.accesscontrol.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class UserDBContext extends DBContext<User> {

    public User get(String username, String password) {
    String sql = "SELECT u.UserName FROM [User] u " +
                 "WHERE u.UserName = ? AND u.[password] = ?";
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
