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

public class bookingDAO extends DBContext<Object> {

    public List<BusTrip> getBusTrips(String from, String to, String time,String date) {
        List<BusTrip> list = new ArrayList<>();
       String sql = "SELECT distinct br.br_id, bt.bt1_departureTime, bt.bt1_arrivalTime, br.br_price, " + 
             "br.br_from, br.br_to, br.br_description, br.br_distance, " + 
             "v.v_id, bt.bt1_id, bt.bt1_date " + 
             "FROM [BusRoutes] br " + 
             "JOIN [BusTrips] bt ON bt.br_id = br.br_id " + 
             "JOIN [Seats] s ON bt.bt1_id = s.bt1_id " + 
             "JOIN [Vehicles] v ON v.v_id = s.v_id " + 
             "WHERE br.br_from = ? AND br.br_to = ? " + 
             "AND bt.bt1_departureTime >= ? " + 
             "AND bt.bt1_date = ?;";
           try {
            PreparedStatement st = connection.prepareStatement(sql);
            // Đặt giá trị cho các tham số ?
            st.setString(1, from);
            st.setString(2, to);
            st.setString(3, time);
            st.setString(4, date);
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
    String bt1_date = rs.getString("bt1_date");
    
    BusTrip busTrip = new BusTrip(brId, bt1DepartureTime, bt1ArrivalTime, tPrice, brFrom, brTo, brDescription, brDistance, v_id, bt1_id,date);
    list.add(busTrip);
}

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public String getEid(String email) {
    String c_id = null; // Giá trị mặc định nếu không tìm thấy
    String sql = "SELECT c_id FROM Customer WHERE c_email = ?";

    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, email);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            c_id = String.valueOf(rs.getInt("c_id"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return c_id;
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
