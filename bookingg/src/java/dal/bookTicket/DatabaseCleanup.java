/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.bookTicket;

import dal.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DatabaseCleanup extends DBContext {

    public void cleanUpDatabase() {
        try {
            System.out.println("🔹 Đang chạy cleanup...");

            // DELETE bookTicket
            String sql1 = "DELETE FROM BookTickets WHERE bt_status ='pending'"
                    + "AND bt_bookingDate < DATEADD(MINUTE, -10, GETDATE());";
            try (PreparedStatement stmt = connection.prepareStatement(sql1)) {
                int rows = stmt.executeUpdate();
                System.out.println("✅ Đã xóa " + rows + " BookTickets (pending quá 10 phút).");
            }

            // DELETE ticket
            String sql2 = "DELETE FROM Tickets WHERE t_status = 'pending'"
                    + "AND t_id NOT IN (SELECT t_id FROM BookTickets WHERE t_id IS NOT NULL);";
            try (PreparedStatement stmt = connection.prepareStatement(sql2)) {
                int rows = stmt.executeUpdate();
                System.out.println("✅ Đã xóa " + rows + " ticket (không còn trong bookTicket).");
            }

            // UPDATE seat
            String sql3 = "UPDATE Seats SET s_status = 'available'"
                    + "WHERE s_status <> 'available'"
                    + "AND s_id NOT IN (SELECT s_id FROM Tickets WHERE t_status = 'confirmed' AND s_id IS NOT NULL);";
            try (PreparedStatement stmt = connection.prepareStatement(sql3)) {
                int rows = stmt.executeUpdate();
                System.out.println("✅ Đã cập nhật " + rows + " ghế thành available.");
            }

            System.out.println("🔹 Cleanup hoàn tất!");

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseCleanup.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }
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
