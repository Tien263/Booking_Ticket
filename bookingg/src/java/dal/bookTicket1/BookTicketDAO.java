/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.bookTicket1;

/**
 *
 * @author ADMIN
 */
import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import model.bookTicket.BookTicket;

public class BookTicketDAO extends DBContext<BookTicket> {

    @Override
    public void insert(BookTicket entity) {
        String sql = "INSERT INTO BookTickets (bt_status, bt_bookingDate, c_id, bt_ticketNumber, bt_totalAmount, pbc_id, pbd_id, pbp_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, entity.getBt_status());
            ps.setTimestamp(2, new Timestamp(entity.getBt_bookingDate().getTime()));
            // Giả định c_id được lấy từ session hoặc logic khác, không có trong BookTicket
            ps.setInt(3, 1); // Thay bằng c_id thực tế
            ps.setInt(4, 1); // Giả định số lượng vé, cần logic tính toán
            ps.setDouble(5, entity.getTotalAmount());
            if (entity.getPbcId() != null) {
                ps.setInt(6, entity.getPbcId());
            } else {
                ps.setNull(6, Types.INTEGER);
            }
            if (entity.getPbdId() != null) {
                ps.setInt(7, entity.getPbdId());
            } else {
                ps.setNull(7, Types.INTEGER);
            }
            if (entity.getPbpId() != null) {
                ps.setInt(8, entity.getPbpId());
            } else {
                ps.setNull(8, Types.INTEGER);
            }
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                entity.setBt_id(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(BookTicket entity) {
        String sql = "UPDATE BookTickets SET bt_status = ?, bt_bookingDate = ?, bt_totalAmount = ?, pbc_id = ?, pbd_id = ?, pbp_id = ? WHERE bt_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getBt_status());
            ps.setTimestamp(2, new Timestamp(entity.getBt_bookingDate().getTime()));
            ps.setDouble(3, entity.getTotalAmount());
            if (entity.getPbcId() != null) {
                ps.setInt(4, entity.getPbcId());
            } else {
                ps.setNull(4, Types.INTEGER);
            }
            if (entity.getPbdId() != null) {
                ps.setInt(5, entity.getPbdId());
            } else {
                ps.setNull(5, Types.INTEGER);
            }
            if (entity.getPbpId() != null) {
                ps.setInt(6, entity.getPbpId());
            } else {
                ps.setNull(6, Types.INTEGER);
            }
            ps.setInt(7, entity.getBt_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(BookTicket entity) {
        String sql = "DELETE FROM BookTickets WHERE bt_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, entity.getBt_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<BookTicket> list() {
        ArrayList<BookTicket> list = new ArrayList<>();
        String sql = "SELECT bt.*, c.c_fullname, c.c_phone FROM BookTickets bt " +
                     "JOIN Customer c ON bt.c_id = c.c_id";
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                BookTicket bt = new BookTicket(
                        rs.getInt("t_id"), // Giả định t_id, cần logic lấy từ Tickets
                        rs.getString("c_fullname"),
                        rs.getString("c_phone"),
                        rs.getTimestamp("bt_purchaseDate"), // Giả định, cần logic
                        rs.getTimestamp("bt_bookingDate"),
                        "", // br_adress, cần logic
                        "", // bt1_time, cần logic
                        "", // s_name, cần logic
                        0,  // br_price, cần logic
                        rs.getString("bt_status"),
                        rs.getInt("bt_id"),
                        rs.getDouble("bt_totalAmount"),
                        rs.getInt("pbc_id") == 0 ? null : rs.getInt("pbc_id"),
                        rs.getInt("pbd_id") == 0 ? null : rs.getInt("pbd_id"),
                        rs.getInt("pbp_id") == 0 ? null : rs.getInt("pbp_id")
                );
                list.add(bt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public BookTicket get(int id) {
        String sql = "SELECT bt.*, c.c_fullname, c.c_phone FROM BookTickets bt " +
                     "JOIN Customer c ON bt.c_id = c.c_id WHERE bt_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new BookTicket(
                        rs.getInt("t_id"), // Giả định t_id, cần logic
                        rs.getString("c_fullname"),
                        rs.getString("c_phone"),
                        rs.getTimestamp("bt_purchaseDate"), // Giả định, cần logic
                        rs.getTimestamp("bt_bookingDate"),
                        "", // br_adress, cần logic
                        "", // bt1_time, cần logic
                        "", // s_name, cần logic
                        0,  // br_price, cần logic
                        rs.getString("bt_status"),
                        rs.getInt("bt_id"),
                        rs.getDouble("bt_totalAmount"),
                        rs.getInt("pbc_id") == 0 ? null : rs.getInt("pbc_id"),
                        rs.getInt("pbd_id") == 0 ? null : rs.getInt("pbd_id"),
                        rs.getInt("pbp_id") == 0 ? null : rs.getInt("pbp_id")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
