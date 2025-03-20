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

    public static void main(String[] args) {
        String sql = "SELECT t.t_id,c.c_fullname,br.br_from,br.br_to,t.t_purchaseDate,\n"
                + "    bt1.bt1_date,bt1.bt1_departureTime,bt1.bt1_arrivalTime,\n"
                + "    s.s_name,v.v_type,v.v_licensePlate,br.br_price,t.t_status\n"
                + "FROM Tickets t\n"
                + "JOIN BookTickets bt ON t.bt_id = bt.bt_id\n"
                + "JOIN Customer c ON bt.c_id = c.c_id\n"
                + "JOIN BusTrips bt1 ON t.bt1_id = bt1.bt1_id\n"
                + "JOIN BusRoutes br ON bt1.br_id = br.br_id\n"
                + "JOIN Seats s ON t.s_id = s.s_id\n"
                + "JOIN Vehicles v ON s.v_id = v.v_id\n"
                + "WHERE 1=1 ";
        sql += "ORDER BY t.t_id DESC";
        TicketDAO dao = new TicketDAO();
        ArrayList<Ticket> tickets = dao.getTicket(sql);
        for (Ticket ticket : tickets) {
            System.out.println(ticket);
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
