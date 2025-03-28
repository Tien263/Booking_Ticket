package dal.bookTicket;

import dal.DBContext;
import dal.promotion.PromotionByCodeDAO;
import model.bookTicket.BookTicket;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class BookTicketDAO extends DBContext {

    public boolean applyPromotion(int btId, double newTotalAmount, Integer pbcId, PromotionByCodeDAO promoDAO) {
        String sqlUpdateBookTickets = "UPDATE BookTickets SET bt_totalAmount = ?, pbc_id = ? WHERE bt_id = ?";

        try {
            connection.setAutoCommit(false);

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

    public int createAndBookTickets(int userId, List<Integer> seatIds, int tripId, double totalAmount) {
        int n = -1;
        try {
            connection.setAutoCommit(false);

            int btId = insertBookTicket(userId, seatIds.size(), totalAmount);
            if (btId == -1) {
                connection.rollback();
                return n;
            }

            boolean success = createTickets(btId, seatIds, tripId);
            if (!success) {
                connection.rollback();
                return n;
            }

            connection.commit();
            n = btId;
        } catch (SQLException e) {
            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        }
        return n;
    }

    private int insertBookTicket(int userId, int ticketCount, double totalAmount) throws SQLException {
        String bookSQL = "INSERT INTO BookTickets (bt_status, bt_bookingDate, c_id, bt_ticketNumber, bt_totalAmount) VALUES ('pending', GETDATE(), ?, ?, ?)";

        try (PreparedStatement psBook = connection.prepareStatement(bookSQL, Statement.RETURN_GENERATED_KEYS)) {
            psBook.setInt(1, userId);
            psBook.setInt(2, ticketCount);
            psBook.setDouble(3, totalAmount);

            psBook.executeUpdate();

            try (ResultSet rs = psBook.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return -1;
    }

    private boolean createTickets(int btId, List<Integer> seatIds, int tripId) throws SQLException {
        if (seatIds.isEmpty()) {
            return false;
        }
        String ticketSQL = "INSERT INTO Tickets (bt_id, bt1_id, s_id, t_status, t_purchaseDate) VALUES (?, ?, ?, 'pending', GETDATE())";
        int createdTickets = 0;

        try (PreparedStatement psTicket = connection.prepareStatement(ticketSQL, Statement.RETURN_GENERATED_KEYS)) {
            for (int seatId : seatIds) {
                psTicket.setInt(1, btId);
                psTicket.setInt(2, tripId);
                psTicket.setInt(3, seatId);
                int n = psTicket.executeUpdate();
                if (n > 0) {
                    try (ResultSet rs = psTicket.getGeneratedKeys()) {
                        if (rs.next()) {
                            createdTickets++;
                        }
                    }
                }
            }
            return createdTickets == seatIds.size();
        }
    }

    public boolean updateStatus(BookTicket bt) {
        String sqlBookTickets = "UPDATE [dbo].[BookTickets] SET [bt_status] = ? WHERE [bt_id] = ?";
        String sqlTickets = "UPDATE [dbo].[Tickets] SET [t_status] = 'confirmed' WHERE [bt_id] = ? AND [t_status] = 'pending'";

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
                if (stBookTickets != null) stBookTickets.close();
                if (stTickets != null) stTickets.close();
                connection.setAutoCommit(true);
            } catch (SQLException closeEx) {
                System.out.println("Error closing resources: " + closeEx);
            }
        }
    }
    
    // Phương thức mới: Lấy bt_total_amount theo bookId
    public Double getTotalAmountByBookingId(int bookId) {
        String sql = "select bt_totalAmount from BookTickets where bt_id = ? "; 
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, bookId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getDouble("bt_totalAmount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không tìm thấy
    }

    public List<BookTicket> getTicketByBookingId(int bookingId) {
        List<BookTicket> tickets = new ArrayList<>();
        String query = "SELECT t.t_id, c.c_fullname, c.c_phone, bt1.bt1_date, bt.bt_bookingDate, " +
                       "br.br_from, br.br_to, bt1.bt1_departureTime, bt1.bt1_arrivalTime, " +
                       "s.s_name, br.br_price, bt.bt_status " +
                       "FROM Tickets t " +
                       "JOIN BookTickets bt ON bt.bt_id = t.bt_id " +
                       "JOIN Customer c ON bt.c_id = c.c_id " +
                       "JOIN Seats s ON t.s_id = s.s_id " +
                       "JOIN BusTrips bt1 ON s.bt1_id = bt1.bt1_id " +
                       "JOIN BusRoutes br ON bt1.br_id = br.br_id " +
                       "WHERE bt.bt_id = ?";
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
                    bookTicket.setBt_status(rs.getString("bt_status"));
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
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void update(Object entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete(Object entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public ArrayList list() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object get(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}