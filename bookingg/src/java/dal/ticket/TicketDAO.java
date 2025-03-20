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

/**
 *
 * @author Admin
 */
public class TicketDAO extends DBContext {

    public ArrayList<Ticket> getTicket(String sql) {
        ArrayList<Ticket> tickets = new ArrayList<>();
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setTicketID(rs.getInt("t_id"));
                ticket.setCustomerName(rs.getString("c_fullname"));
                ticket.setDeparture(rs.getString("br_from"));
                ticket.setDestination(rs.getString("br_to"));
                ticket.setPurchaseDate(rs.getDate("t_purchaseDate").toLocalDate());
                ticket.setTravelDate(rs.getDate("bt1_date").toLocalDate());
                ticket.setDepartureTime(rs.getTime("bt1_departureTime").toLocalTime());
                ticket.setArrivalTime(rs.getTime("bt1_arrivalTime").toLocalTime());
                ticket.setSeatName(rs.getString("s_name"));
                ticket.setVehicleType(rs.getString("v_type"));
                ticket.setLicensePlate(rs.getString("v_licensePlate"));
                ticket.setPrice(rs.getDouble("br_price"));
                ticket.setStatus(rs.getString("t_status"));
                tickets.add(ticket);
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
