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
public class DAOBookTickets extends DBContext {

    public int bookTicket(int ticketId) {
        int n = 0;
        String query = "INSERT INTO [dbo].[BookTickets]\n"
                + "           ([bt_status],[bt_bookingDate],[c_id]\n"
                + "           ,[bt_ticketNumber],[t_id])\n"
                + "     VALUES (1,GETDATE(),1,1 ,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, ticketId);
            n = ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBookTickets.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static void main(String[] args) {
        DAOBookTickets dao = new DAOBookTickets();
        int n = dao.bookTicket(1);
        if (n > 0) {
            System.out.println("inserted");
        }
    }
}
