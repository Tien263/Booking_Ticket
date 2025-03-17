/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.bookTicket;

import dal.*;
import model.bookTicket.BookTicket;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class BookTicketDAO extends DBContext {

    public int createAndBookTickets(int userId, List<Integer> seatIds, int tripId) {
        int n = -1;
        try {
            connection.setAutoCommit(false); // Bắt đầu transaction

            // Tạo một bản ghi trong BookTickets trước
            int btId = insertBookTicket(userId, seatIds.size());
            if (btId == -1) {
                connection.rollback();
                return n;
            }

            // Tạo danh sách vé và liên kết với BookTickets
            boolean sucess = false;
            sucess = createTickets(btId, seatIds, tripId);
            if (!sucess) {
                connection.rollback();
                return n;
            }

            connection.commit(); // Xác nhận transaction
            n = btId;
        } catch (SQLException e) {
            try {
                if (connection != null) {
                    connection.rollback(); // Rollback nếu có lỗi
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        }
        return n; // Trả về ID của BookTickets
    }

// Tạo một bản ghi BookTickets và lấy ID
    private int insertBookTicket(int userId, int ticketCount) throws SQLException {
        String bookSQL = "INSERT INTO BookTickets (bt_status, bt_bookingDate, c_id, bt_ticketNumber) VALUES ('confirmed', GETDATE(), ?, ?)";

        try (PreparedStatement psBook = connection.prepareStatement(bookSQL, Statement.RETURN_GENERATED_KEYS)) {
            psBook.setInt(1, userId);
            psBook.setInt(2, ticketCount);
            psBook.executeUpdate();

            try (ResultSet rs = psBook.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1); // Trả về bt_id
                }
            }
        }
        return -1; // Lỗi
    }

// Tạo danh sách vé và liên kết với BookTickets
    private boolean createTickets(int btId, List<Integer> seatIds, int tripId) throws SQLException {
        if (seatIds.isEmpty()) {
            return false; // Không có ghế nào để tạo vé
        }
        String ticketSQL = "INSERT INTO Tickets (bt_id, bt1_id, s_id, t_status, t_purchaseDate) VALUES (?, ?, ?, 'confirmed', GETDATE())";
        int createdTickets = 0; // Đếm số vé được tạo thành công

        try (PreparedStatement psTicket = connection.prepareStatement(ticketSQL, Statement.RETURN_GENERATED_KEYS)) {
            for (int seatId : seatIds) {
                psTicket.setInt(1, btId);  // Liên kết vé với BookTickets
                psTicket.setInt(2, tripId);
                psTicket.setInt(3, seatId);
                int n = psTicket.executeUpdate();
                if (n > 0) { // Kiểm tra nếu lệnh INSERT thành công
                    try (ResultSet rs = psTicket.getGeneratedKeys()) {
                        if (rs.next()) {
                            createdTickets++; // Đếm số vé tạo thành công
                        }
                    }
                }
            }
            return createdTickets == seatIds.size();
        }
    }

    // Phương thức lấy danh sách thông tin vé dựa vào danh sách bookingId
    public List<BookTicket> getTicketByBookingId(int bookingId) {
        List<BookTicket> tickets = new ArrayList<>(); // Danh sách lưu kết quả
        String query = "SELECT t.t_id, c.c_fullname, c.c_phone,bt1.bt1_date, bt.bt_bookingDate, "
                + "br.br_from, br.br_to, bt1.bt1_departureTime, bt1.bt1_arrivalTime, "
                + "s.s_name, Br.br_price "
                + "FROM Tickets t "
                + "JOIN BookTickets bt ON bt.bt_id = t.bt_id "
                + "JOIN Customer c ON bt.c_id = c.c_id "
                + "JOIN Seats s ON t.s_id = s.s_id "
                + "JOIN BusTrips bt1 ON s.bt1_id = bt1.bt1_id "
                + "JOIN BusRoutes br ON bt1.br_id = br.br_id "
                + "WHERE bt.bt_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, bookingId);
            try (ResultSet rs = ps.executeQuery()){ 
                while(rs.next()) {
                     BookTicket bookTicket = new BookTicket(
                            rs.getInt("t_id"),
                            rs.getString("c_fullname"),
                            rs.getString("c_phone"),
                            rs.getDate("bt1_date"),
                            rs.getDate("bt_bookingDate"),
                            rs.getString("br_from") + "-" + rs.getString("br_to"),
                            rs.getString("bt1_departureTime") + "-" + rs.getString("bt1_arrivalTime"),
                            rs.getString("s_name"),
                            rs.getFloat("br_price")
                    );
                      tickets.add(bookTicket);
                }
            }
        
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return tickets;
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
