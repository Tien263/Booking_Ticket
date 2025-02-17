/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DatabaseCleanup extends DBContext {

    public void cleanUpDatabase() {
        try {
            System.out.println("🔹 Đang chạy cleanup...");

            // DELETE bookTicket
            String sql1 = "DELETE FROM BookTickets WHERE bt_status ='pending'"
                    + "AND bt_bookingDate < DATEADD(MINUTE, -15, GETDATE());";
            try (PreparedStatement stmt = connection.prepareStatement(sql1)) {
                int rows = stmt.executeUpdate();
                System.out.println("✅ Đã xóa " + rows + " BookTickets (pending quá 5 phút).");
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
            Logger.getLogger(DatabaseCleanup.class.getName()).log(Level.SEVERE, "❌ Lỗi khi cleanup: " + ex.getMessage(), ex);
        }
    }
}
