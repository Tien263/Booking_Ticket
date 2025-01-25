/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Customer;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class CustomerDao extends DBContext<Customer> {

    public boolean checkEmailExist(String email) {
        try {
            String sqlcheck = "select * from customer where c_email = ?";
            PreparedStatement stm = connection.prepareStatement(sqlcheck);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            return rs.next(); // Trả về true nếu tồn tại
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean checkUsernameExist(String username) {
        try {
            String sql = "select * from Customer where c_username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkPhoneExist(String phone) {
        try {
            String sql = "select * from Customer where c_phone = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true; // Trả về true nếu số điện thoại đã tồn tại
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void insert(Customer entity) {
        String sql_insert = "INSERT INTO [dbo].[Customer]\n"
                + "           ([c_email]\n"
                + "           ,[c_fullName]\n"
                + "           ,[c_phone]\n"
                + "           ,[c_gender]\n"
                + "           ,[c_username]\n"
                + "           ,[c_address]\n"
                + "           ,[c_password])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        PreparedStatement stm_insert = null;
        try {
            stm_insert = connection.prepareStatement(sql_insert);
            stm_insert.setString(1, entity.getEmail());
            stm_insert.setString(2, entity.getFullname());
            stm_insert.setString(3, entity.getPhone());
            stm_insert.setBoolean(4, true);
            stm_insert.setString(6, entity.getAddress());
            stm_insert.setString(5, entity.getUsername());
            stm_insert.setString(7, entity.getPassword());
            stm_insert.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void update(Customer entity) {
        String sql_update = "UPDATE [dbo].[Customer]\n"
                + "   SET [c_email] = ?\n"
                + "      ,[c_fullname] = ?\n"
                + "      ,[c_phone] = ?\n"
                + "      ,[c_gender] = ?\n"
                + "      ,[c_address] = ?\n"
                + "      ,[c_username] = ?\n"
                + "      ,[c_password] = ?\n"
                + " WHERE [c_email] = ?";

        PreparedStatement stm_update = null;
        try {
            stm_update = connection.prepareStatement(sql_update);
            stm_update.setString(1, entity.getEmail());
            stm_update.setString(2, entity.getFullname());
            stm_update.setString(3, entity.getPhone());
            stm_update.setBoolean(4, entity.isGender());
            stm_update.setString(5, entity.getUsername());
            stm_update.setString(6, entity.getPassword());
            stm_update.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void delete(Customer entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Customer> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Customer get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Customer getCustomerByEmail(String email, String password) {
        try {
            String sqlcheck = "select * from customer where c_email = ? and c_password = ?";
            PreparedStatement stm = connection.prepareStatement(sqlcheck);
            stm.setString(1, email);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Customer c = new Customer();
                c.setEmail(email);
                c.setFullname(rs.getString("c_fullname"));
                c.setPhone(rs.getString("c_phone"));
                c.setGender(rs.getBoolean("c_gender"));
                c.setAddress(rs.getString("c_address"));
                c.setUsername(rs.getString("c_username"));
                c.setPassword(password);
                return c;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

}
