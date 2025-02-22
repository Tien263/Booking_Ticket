/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.bookTicket;

import dal.DBContext;
import model.bookTicket.*;
import java.util.ArrayList;
import model.Blog;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.bookTicket.BusTrip;

/**
 *
 * @author Nguyen Minh Duc
 */

// <input type="hidden" name="vehicleId" value="1">
//                <input type="hidden" name="tripId" value="1">
//                <input type="hidden" name="routeId" value="<%= brId %>">
//                <input type="hidden" name="customerId" value="1">
public class bookingDAO extends DBContext<Object> {

    public List<BusTrip> getBusTrips(String from, String to, String time) {
        List<BusTrip> list = new ArrayList<>();
        String sql = "SELECT br.br_id, bt.bt1_departureTime, bt.bt1_arrivalTime, t.t_price, "
                + "br.br_from, br.br_to, br.br_description, br.br_distance "
                + "FROM [PROJECTV01].[dbo].[BusRoutes] br  " 
                + "JOIN [PROJECTV01].[dbo].[BusTrips] bt ON bt.br_id = br.br_id "
                + "JOIN [PROJECTV01].[dbo].[Seats] s ON s.bt1_id = bt.bt1_id "
                + "JOIN [PROJECTV01].[dbo].[Tickets] t ON t.s_id = s.s_id AND t.bt1_id = bt.bt1_id "
                + "WHERE br.br_from = ? AND br.br_to = ? "
                + "AND bt.bt1_departureTime >= ? ";
        System.out.println("Time parameter: " + time);
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            // Đặt giá trị cho các tham số ?
            st.setString(1, from);
            st.setString(2, to);
            st.setString(3, time);
            ResultSet rs = st.executeQuery();
            System.out.println(rs.next());
            while (rs.next()) {
                BusTrip busTrip = new BusTrip(
                        rs.getInt("br_id"),
                        rs.getString("bt1_departureTime"),
                        rs.getString("bt1_arrivalTime"),
                        rs.getDouble("t_price"),
                        rs.getString("br_from"),
                        rs.getString("br_to"),
                        rs.getString("br_description"),
                        rs.getDouble("br_distance")
                );
                list.add(busTrip);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("dal.bookingDAO.getBusTrips()");
        }

        return list;
    }

    public static void main(String[] args) {
        bookingDAO dao = new bookingDAO();
        List<BusTrip> bt = dao.getBusTrips("HaNoi", "HaiPhong", "06:15:00");
        for (BusTrip busTrip : bt) {
            System.out.println(busTrip.getBrFrom() + busTrip.getBrTo() + busTrip.getBrId());
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
    public ArrayList<Object> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Object get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
