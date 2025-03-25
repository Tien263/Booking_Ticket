/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.ticket;

import dal.DBContext;
import java.util.ArrayList;
import model.ticket.Ticket;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
                        rs.getString("bt_ticketNumber"),
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
