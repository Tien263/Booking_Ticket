/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.accesscontrol.BookTicket;
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

    //Đặt vé trả về ID của vé
    public int createTicket(int seatId, int tripId, double price) {
        int n = 0;
        //Tạo một vé 
        String sql = "INSERT INTO Tickets (s_id, bt1_id, t_price, t_status, t_purchaseDate) VALUES (?, ?, ?, 'pending', GETDATE())";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);//Cho phép lấy ID tự động tăng sau khi chèn
            ps.setInt(1, seatId);
            ps.setInt(2, tripId);
            ps.setDouble(3, price);
            n = ps.executeUpdate();//thực thi câu lệnh
            ResultSet rs = ps.getGeneratedKeys();//Lấy các khóa chính vừa được tạo sau câu lệnh insert
            if (rs.next()) {
                return rs.getInt(1);//lấy t_id vừa tạo
            }

        } catch (SQLException ex) {
            Logger.getLogger(DAOTickets.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    //tạo BookTicket
    public int bookTicket(int userId, int ticketId) {
        int n = 0;
        String query = "INSERT INTO [dbo].[BookTickets]\n"
                + "           ([bt_status],[bt_bookingDate],[c_id]\n"
                + "           ,[bt_ticketNumber],[t_id])\n"
                + "     VALUES ('pending',GETDATE(),?,1 ,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, userId);
            ps.setInt(2, ticketId);
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

    // Phương thức lấy thông tin vé dựa vào bookingId
    public BookTicket getTicketByBookingId(int bookingId) {
        String query = "SELECT bt.bt_id, c.c_fullname, c.c_phone, bt.bt_bookingDate,\n"
                + "    br.br_from, br.br_to, bt1.bt1_departureTime, bt1.bt1_arrivalTime,\n"
                + "    s.s_name,t.t_price\n"
                + "FROM BookTickets bt\n"
                + "JOIN Customer c ON bt.c_id = c.c_id\n"
                + "JOIN Tickets t ON bt.t_id = t.t_id\n"
                + "JOIN Seats s ON t.s_id = s.s_id\n"
                + "JOIN BusTrips bt1 ON s.bt1_id = bt1.bt1_id\n"
                + "JOIN BusRoutes br ON bt1.br_id = br.br_id\n"
                + "WHERE bt.bt_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setInt(1, bookingId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new BookTicket(
                        rs.getInt("bt_id"),
                        rs.getString("c_fullname"),
                        rs.getString("c_phone"),
                        rs.getDate("bt_bookingDate"),
                        rs.getString("br_from"),
                        rs.getString("br_to"),
                        rs.getString("bt1_departureTime"),
                        rs.getString("bt1_arrivalTime"),
                        rs.getString("s_name"),
                        rs.getFloat("t_price")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không tìm thấy vé
    }

    // Xác nhận thanh toán
    public boolean confirmPayment(int bookingId) {
    try {
        connection.setAutoCommit(false); // Bắt đầu transaction

        String updateTicketsQuery = "UPDATE t "
                + "SET t.t_status = 'confirmed' "
                + "FROM Tickets t "
                + "JOIN BookTickets b ON t.t_id = b.t_id "
                + "WHERE b.bt_id = ?";

        PreparedStatement pstmt = connection.prepareStatement(updateTicketsQuery);
        pstmt.setInt(1, bookingId);
        int updatedRows1 = pstmt.executeUpdate();

        String updateBookTicketsQuery = "UPDATE BookTickets "
                + "SET bt_status = 'confirmed' "
                + "WHERE bt_id = ?";

        pstmt = connection.prepareStatement(updateBookTicketsQuery);
        pstmt.setInt(1, bookingId);
        int updatedRows2 = pstmt.executeUpdate();

        if (updatedRows1 > 0 && updatedRows2 > 0) {
            connection.commit(); // Xác nhận transaction
            return true;
        } else {
            connection.rollback(); // Hủy bỏ nếu có lỗi
            return false;
        }
    } catch (SQLException e) {
        try {
            connection.rollback(); // Rollback nếu có lỗi
        } catch (SQLException rollbackEx) {
            rollbackEx.printStackTrace(); // Ghi log lỗi rollback
        }
        e.printStackTrace(); // Ghi log lỗi chính
        return false;
    } finally {
        try {
            connection.setAutoCommit(true); // Đặt lại trạng thái ban đầu
        } catch (SQLException ex) {
            ex.printStackTrace(); // Ghi log nếu có lỗi khi đặt lại auto-commit
        }
    }
}

    public static void main(String[] args) {
        DAOTickets dao = new DAOTickets();
        BookTicket n = dao.getTicketByBookingId(2);
        if (n != null) {
            System.out.println("inserted");
        }
    }
}
