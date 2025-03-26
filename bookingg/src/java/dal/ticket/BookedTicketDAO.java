/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.ticket;

import dal.DBContext;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import model.ticket.BookedTicket;
/**
 *
 * @author Admin
 */
public class BookedTicketDAO extends DBContext{
    public ArrayList<BookedTicket> findByCustomerEmail(String sql, List<Object> params) {
        ArrayList<BookedTicket> result = new ArrayList<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {


            // Gán tham số vào PreparedStatement
            for (int i = 0; i < params.size(); i++) {
                stmt.setObject(i + 1, params.get(i));
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    BookedTicket dto = new BookedTicket(
                        rs.getInt("bt_id"),
                        rs.getString("bt_status"),
                        rs.getDate("bt_bookingDate") != null ? rs.getDate("bt_bookingDate").toLocalDate() : null,
                        rs.getInt("bt_ticketNumber"),
                        rs.getDouble("bt_totalAmount"),
                        rs.getString("c_email"),
                        rs.getString("c_fullname"),
                        rs.getString("c_phone")
                    );
                    result.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Method to get total number of records
    public int getTotalRecords(String sql, List<Object> params) {
        int totalRecords = 0;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            // Set parameters dynamically
            for (int i = 0; i < params.size(); i++) {
                Object param = params.get(i);
                if (param instanceof String) {
                    stmt.setString(i + 1, (String) param);
                } else if (param instanceof Integer) {
                    stmt.setInt(i + 1, (Integer) param);
                }
            }

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    totalRecords = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecords;
    }



    public boolean cancelBookingTicket(int btId) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            connection.setAutoCommit(false); // Bắt đầu transaction

            // 2. Lấy ngày đặt vé
            String getBookingDateQuery = "SELECT bt_bookingDate FROM BookTickets WHERE bt_id = ?";
            pstmt = connection.prepareStatement(getBookingDateQuery);
            pstmt.setInt(1, btId);
            rs = pstmt.executeQuery();

            // 3. Tính khoảng cách thời gian
            Timestamp bookingTimestamp = rs.getTimestamp("bt_bookingDate");
            LocalDateTime bookingDate = bookingTimestamp.toLocalDateTime();
            LocalDateTime currentDate = LocalDateTime.now();
            long daysDifference = ChronoUnit.DAYS.between(bookingDate, currentDate);

            // 4. Thực hiện hủy vé dựa trên điều kiện
            if (daysDifference <= 1) {
                // Chỉ cập nhật bảng BookTickets
                String updateBookingQuery = "UPDATE BookTickets SET bt_status = 'cancelled' WHERE bt_id = ?";
                pstmt = connection.prepareStatement(updateBookingQuery);
                pstmt.setInt(1, btId);
                pstmt.executeUpdate();
            } else {
                // Cập nhật cả 3 bảng
                // Update BookTickets
                String updateBookingQuery = "UPDATE BookTickets SET bt_status = 'cancelled' WHERE bt_id = ?";
                pstmt = connection.prepareStatement(updateBookingQuery);
                pstmt.setInt(1, btId);
                pstmt.executeUpdate();

                // Update Tickets
                String updateTicketsQuery = "UPDATE Tickets SET t_status = 'cancelled' WHERE bt_id = ?";
                pstmt = connection.prepareStatement(updateTicketsQuery);
                pstmt.setInt(1, btId);
                pstmt.executeUpdate();

                // Update Seats
                String updateSeatsQuery = "UPDATE Seats SET s_status = 'available' WHERE bt1_id = ?";
                pstmt = connection.prepareStatement(updateSeatsQuery);
                pstmt.setInt(1, btId);
                pstmt.executeUpdate();
            }

            // 5. Commit transaction
            connection.commit();
            return true;

        } catch (SQLException e) {
            // Rollback nếu có lỗi
            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return false;
        } finally {
            // Đóng các resource
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Main để test
    public static void main(String[] args) {
        BookedTicketDAO manager = new BookedTicketDAO();
        boolean result = manager.cancelBookingTicket(52); // Thay 1 bằng bt_id cần test
        System.out.println("Kết quả: " + (result ? "Thành công" : "Thất bại"));
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
