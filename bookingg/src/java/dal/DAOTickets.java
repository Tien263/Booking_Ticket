/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.BookTicket;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import static java.util.List.of;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

/**
 *
 * @author Admin
 */
public class DAOTickets extends DBContext {

    public List<Integer> createAndBookTickets(int userId, List<Integer> seatIds, int tripId, double price) {
        List<Integer> bookingIds = new ArrayList<>();

        try {
            connection.setAutoCommit(false); // Bắt đầu transaction

            // Tạo danh sách vé
            List<Integer> ticketIds = createTickets(seatIds, tripId, price);
            if (ticketIds.isEmpty()) {
                connection.rollback();
                return new ArrayList<>();
            }

            // Đặt vé vào BookTickets
            bookingIds = bookTickets(userId, ticketIds);

            connection.commit(); // Xác nhận transaction
        } catch (SQLException e) {
            try {
                if (connection != null) {
                    connection.rollback(); // Rollback nếu có lỗi
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return bookingIds; // Trả về danh sách ID của BookTickets
    }

    // Tạo danh sách vé và lấy ID
    private List<Integer> createTickets(List<Integer> seatIds, int tripId, double price) throws SQLException {
        List<Integer> ticketIds = new ArrayList<>();
        String ticketSQL = "INSERT INTO Tickets (s_id, bt1_id, t_price, t_status, t_purchaseDate) VALUES (?, ?, ?, 'pending', GETDATE())";

        try (PreparedStatement psTicket = connection.prepareStatement(ticketSQL, Statement.RETURN_GENERATED_KEYS)) {
            for (int seatId : seatIds) {
                psTicket.setInt(1, seatId);
                psTicket.setInt(2, tripId);
                psTicket.setDouble(3, price);
                psTicket.executeUpdate();

                try (ResultSet rs = psTicket.getGeneratedKeys()) {
                    if (rs.next()) {
                        ticketIds.add(rs.getInt(1));
                    }
                }
            }
        }
        return ticketIds;
    }

    // Đặt vé vào bảng BookTickets và lấy ID
    private List<Integer> bookTickets(int userId, List<Integer> ticketIds) throws SQLException {
        List<Integer> bookingIds = new ArrayList<>();
        String bookSQL = "INSERT INTO BookTickets (bt_status, bt_bookingDate, c_id, bt_ticketNumber, t_id) VALUES ('pending', GETDATE(), ?, 1, ?)";

        try (PreparedStatement psBook = connection.prepareStatement(bookSQL, Statement.RETURN_GENERATED_KEYS)) {
            for (int ticketId : ticketIds) {
                psBook.setInt(1, userId);
                psBook.setInt(2, ticketId);
                psBook.executeUpdate();

                try (ResultSet rsBook = psBook.getGeneratedKeys()) {
                    if (rsBook.next()) {
                        bookingIds.add(rsBook.getInt(1));
                    }
                }
            }
        }
        return bookingIds;
    }

    // Phương thức lấy danh sách thông tin vé dựa vào danh sách bookingId
    public BookTicket getTicketByBookingId(int bookingId) {
        String query = "SELECT bt.bt_id, c.c_fullname, c.c_phone, bt.bt_bookingDate, "
                + "br.br_from, br.br_to, bt1.bt1_departureTime, bt1.bt1_arrivalTime, "
                + "s.s_name, t.t_price "
                + "FROM BookTickets bt "
                + "JOIN Customer c ON bt.c_id = c.c_id "
                + "JOIN Tickets t ON bt.t_id = t.t_id "
                + "JOIN Seats s ON t.s_id = s.s_id "
                + "JOIN BusTrips bt1 ON s.bt1_id = bt1.bt1_id "
                + "JOIN BusRoutes br ON bt1.br_id = br.br_id "
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
