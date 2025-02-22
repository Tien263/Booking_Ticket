/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Contact;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.List;
/**
 *
 * @author Quang Anh
 */
public class ContactDAO extends DBContext{
    public void insertContact(Contact contact) {
        String sql = "INSERT INTO Contact (name, email, message) VALUES (?, ?, ?)";
        try {
            
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, contact.getName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getMessage());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Contact> getAllContacts() {
    List<Contact> contactList = new ArrayList<>();
    String sql = "SELECT * FROM Contact ORDER BY created_at DESC";
    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Contact contact = new Contact();
            contact.setContactId(rs.getInt("contact_id"));
            contact.setName(rs.getString("name"));
            contact.setEmail(rs.getString("email"));
            contact.setMessage(rs.getString("message"));
            contact.setCreatedAt(rs.getString("created_at"));
            contactList.add(contact);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return contactList;
}
    @Override
    public void insert(Object entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Object entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Object entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Object get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
