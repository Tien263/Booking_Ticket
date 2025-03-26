/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.bookTicket;

import dal.*;
import dal.promotion.PromotionByCodeDAO;
import model.bookTicket.BookTicket;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class BookTicketDAO extends DBContext {

    /**
     * Cập nhật tổng số tiền và mã khuyến mãi cho BookTicket, đồng thời giảm số lượng mã khuyến mãi.
     *
     * @param btId ID của BookTicket
     * @param newTotalAmount tổng số tiền mới
     * @param pbcId ID của mã khuyến mãi
     * @param promoDAO đối tượng PromotionByCodeDAO để giảm số lượng mã khuyến mãi
     * @return true nếu cập nhật thành công, false nếu thất bại
     */
    public boolean applyPromotion(int btId, double newTotalAmount, Integer pbcId, PromotionByCodeDAO promoDAO) {
        String sqlUpdateBookTickets = "UPDATE BookTickets SET bt_totalAmount = ?, pbc_id = ? WHERE bt_id = ?";

        try {
            connection.setAutoCommit(false);

            // Cập nhật BookTickets
            try (PreparedStatement psUpdate = connection.prepareStatement(sqlUpdateBookTickets)) {
                psUpdate.setDouble(1, newTotalAmount);
                if (pbcId != null) {
                    psUpdate.setInt(2, pbcId);
                } else {
                    psUpdate.setNull(2, Types.INTEGER);
                }
                psUpdate.setInt(3, btId);
                int rowsAffected = psUpdate.executeUpdate();
                if (rowsAffected <= 0) {
                    throw new SQLException("Không thể cập nhật tổng số tiền và mã khuyến mãi.");
                }
            }

            // Giảm số lượng mã khuyến mãi
            boolean quantityDecreased = promoDAO.decreasePromotionQuantity(pbcId);
            if (!quantityDecreased) {
                throw new SQLException("Không thể giảm số lượng mã khuyến mãi.");
            }

            connection.commit();
            return true;

        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException rollbackEx) {
                System.out.println("Hoàn tác thất bại: " + rollbackEx);
            }
            System.out.println("Lỗi: " + e);
            return false;

        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException closeEx) {
                System.out.println("Lỗi khi đặt lại auto-commit: " + closeEx);
            }
        }
    }
    
    // Update the total amount and pbc_id for a BookTicket
    public boolean updateTotalAmountAndPromotion(int btId, double newTotalAmount, Integer pbcId) {
        String sql = "UPDATE BookTickets SET bt_totalAmount = ?, pbc_id = ? WHERE bt_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setDouble(1, newTotalAmount);
            if (pbcId != null) {
                ps.setInt(2, pbcId);
            } else {
                ps.setNull(2, Types.INTEGER);
            }
            ps.setInt(3, btId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public int insertBookTicket(BookTicket bookTicket) {
        String sql = "INSERT INTO [dbo].[BookTickets]\n"
                + "           ([c_id]\n"
                + "           ,[bt_totalAmount])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, bookTicket.getBt_id());
            st.setDouble(2, bookTicket.getTotalAmount());
            int affectedRows = st.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Create payment failed, no rows affected.");
            }
            try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating payment failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
            return 1;
        }

    }

//    public boolean updateStatus(BookTicket bt) {
//        String sql = "UPDATE [dbo].[BookTickets]\n"
//                + "   SET [bt_status] = ?\n"
//                + " WHERE [bt_id] = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, bt.getBt_status());
//            st.setInt(2, bt.getBt_id());
//            return st.executeUpdate() > 0;
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return false;
//    }
    public boolean updateStatus(BookTicket bt) {
        String sqlBookTickets = "UPDATE [dbo].[BookTickets]\n"
                + "   SET [bt_status] = ?\n"
                + " WHERE [bt_id] = ?";

        String sqlTickets = "UPDATE [dbo].[Tickets]\n"
                + "   SET [t_status] = 'confirmed'\n"
                + " WHERE [bt_id] = ? AND [t_status] = 'pending'";

        PreparedStatement stBookTickets = null;
        PreparedStatement stTickets = null;

        try {
            connection.setAutoCommit(false);

            stBookTickets = connection.prepareStatement(sqlBookTickets);
            stBookTickets.setString(1, bt.getBt_status());
            stBookTickets.setInt(2, bt.getBt_id());
            int bookTicketsUpdated = stBookTickets.executeUpdate();

            if (bookTicketsUpdated > 0) {
                stTickets = connection.prepareStatement(sqlTickets);
                stTickets.setInt(1, bt.getBt_id());
                stTickets.executeUpdate();
            }

            connection.commit();
            return bookTicketsUpdated > 0;

        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException rollbackEx) {
                System.out.println("Rollback failed: " + rollbackEx);
            }
            System.out.println("Error: " + e);
            return false;

        } finally {
            try {
                if (stBookTickets != null) {
                    stBookTickets.close();
                }
                if (stTickets != null) {
                    stTickets.close();
                }
                connection.setAutoCommit(true);
            } catch (SQLException closeEx) {
                System.out.println("Error closing resources: " + closeEx);
            }
        }
    }

    public int createAndBookTickets(int userId, List<Integer> seatIds, int tripId, double totalAmount) {
        int n = -1;
        try {
            connection.setAutoCommit(false); // Bắt đầu transaction

            // Tạo một bản ghi trong BookTickets trước
            int btId = insertBookTicket(userId, seatIds.size(), totalAmount);
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
    private int insertBookTicket(int userId, int ticketCount, double totalAmount) throws SQLException {
        String bookSQL = "INSERT INTO BookTickets (bt_status, bt_bookingDate, c_id, bt_ticketNumber, bt_totalAmount) VALUES ('pending', GETDATE(), ?, ?, ?)";

        try (PreparedStatement psBook = connection.prepareStatement(bookSQL, Statement.RETURN_GENERATED_KEYS)) {
            psBook.setInt(1, userId);
            psBook.setInt(2, ticketCount);
            psBook.setDouble(3, totalAmount);

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
        String ticketSQL = "INSERT INTO Tickets (bt_id, bt1_id, s_id, t_status, t_purchaseDate) VALUES (?, ?, ?, 'pending', GETDATE())";
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
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
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
