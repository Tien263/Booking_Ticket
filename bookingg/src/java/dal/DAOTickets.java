/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOTickets extends DBContext {

    public int createTicket(int seatId, int tripId, double price) {
        int n = 0;
        String sql = "INSERT INTO Tickets (s_id, bt1_id, t_price, t_status, t_purchaseDate) VALUES (?, ?, ?, 'Pending', GETDATE())";      
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, seatId);
            ps.setInt(2, tripId);
            ps.setDouble(3, price);
            n = ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTickets.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public static void main(String[] args) {
        DAOTickets dao = new DAOTickets();
        int n = dao.createTicket(4, 5, 5);
        if(n>0){
            System.out.println("inserted");
        }
    }
}
