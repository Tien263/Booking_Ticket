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
        String sql = "SELECT br.br_id, bt.bt1_departureTime, bt.bt1_arrivalTime, br.br_price, " +
             "br.br_from, br.br_to, br.br_description, br.br_distance, " +
             "v.v_id, bt.bt1_id " +
             "FROM [Tuyen].[dbo].[BusRoutes] br " +
             "JOIN [Tuyen].[dbo].[BusTrips] bt ON bt.br_id = br.br_id " +
             "JOIN [Tuyen].[dbo].[Seats] s ON bt.bt1_id = s.bt1_id " +
             "JOIN [Tuyen].[dbo].[Vehicles] v ON v.v_id = s.v_id"+ 
               " WHERE br.br_from = N'" + from + "' AND br.br_to = N'" + to + "' " + 
               " AND bt.bt1_departureTime >= '" + time + "' ";
           try {
            PreparedStatement st = connection.prepareStatement(sql);
            // Đặt giá trị cho các tham số ?
            ResultSet rs = st.executeQuery();
           
            while (rs.next()) {
    int brId = rs.getInt("br_id");
    String bt1DepartureTime = rs.getString("bt1_departureTime");
    String bt1ArrivalTime = rs.getString("bt1_arrivalTime");
    float tPrice = rs.getFloat("br_price");
    String brFrom = rs.getString("br_from");
    String brTo = rs.getString("br_to");
    String brDescription = rs.getString("br_description");
    double brDistance = rs.getDouble("br_distance");
    int v_id = rs.getInt("v_id");
    int bt1_id = rs.getInt("bt1_id");

    BusTrip busTrip = new BusTrip(brId, bt1DepartureTime, bt1ArrivalTime, tPrice, brFrom, brTo, brDescription, brDistance, v_id, bt1_id);
    list.add(busTrip);
}

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("dal.bookingDAO.getBusTrips()");
        }

        return list;
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
