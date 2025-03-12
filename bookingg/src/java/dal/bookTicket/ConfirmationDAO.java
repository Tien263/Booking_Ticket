/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.bookTicket;

import dal.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ConfirmationDAO extends DBContext {
    // Xác nhận thanh toán

    public boolean confirmPayment(int bookingId) {
        try {
            connection.setAutoCommit(false); // Bắt đầu transaction

            // Câu lệnh SQL cập nhật vé
            String updateTicketsQuery = "UPDATE t "
                    + "SET t.t_status = 'confirmed' "
                    + "FROM Tickets t "
                    + "JOIN BookTickets b ON t.bt_id = b.bt_id "
                    + "WHERE b.bt_id = ?";

            // Câu lệnh SQL cập nhật BookTickets
            String updateBookTicketsQuery = "UPDATE BookTickets "
                    + "SET bt_status = 'confirmed' "
                    + "WHERE bt_id = ?";

            // Chuẩn bị câu lệnh
            PreparedStatement pstmtTickets = connection.prepareStatement(updateTicketsQuery);
            PreparedStatement pstmtBookTickets = connection.prepareStatement(updateBookTicketsQuery);

            // Cập nhật trạng thái vé
            pstmtTickets.setInt(1, bookingId);
            int updatedRowsTickets = pstmtTickets.executeUpdate();

            // Cập nhật trạng thái đặt vé
            pstmtBookTickets.setInt(1, bookingId);
            int updatedRowsBookTickets = pstmtBookTickets.executeUpdate();

            // Kiểm tra có ít nhất một cập nhật thành công
            if (updatedRowsTickets > 0 && updatedRowsBookTickets > 0) {
                connection.commit(); // Xác nhận transaction
                return true;
            } else {
                connection.rollback(); // Rollback nếu không có gì cập nhật
                return false;
            }
        } catch (SQLException e) {
            try {
                connection.rollback(); // Rollback nếu có lỗi
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                connection.setAutoCommit(true); // Đặt lại auto-commit
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
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
