/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static java.lang.System.out;
import java.util.ArrayList;
import model.Blog;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BusTrip;
/**
 *
 * @author Nguyen Minh Duc
 */
public class bookingDAO extends DBContext<Blog> {

    public void insert(Blog entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void update(Blog entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void delete(Blog entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    public List<BusTrip> getBusTrips(String from, String to, String time){
        List<BusTrip> list = new ArrayList<>();
         String sql = "SELECT br.br_id, bt.bt1_departureTime, bt.bt1_arrivalTime, t.t_price, " + 
               "br.br_from, br.br_to, br.br_description, br.br_distance " +
               "FROM [PROJECTV012].[dbo].[BusRoutes] br " +
               "JOIN [PROJECTV012].[dbo].[BusTrips] bt ON bt.br_id = br.br_id " +
               "JOIN [PROJECTV012].[dbo].[Seats] s ON s.bt1_id = bt.bt1_id " +
               "JOIN [PROJECTV012].[dbo].[Tickets] t ON t.s_id = s.s_id AND t.bt1_id = bt.bt1_id " +
               "WHERE br.br_from = '" + from + "' AND br.br_to = '" + to + "' " +
               "AND bt.bt1_departureTime >= '" + time + "' ";  

        try  {
     
      PreparedStatement st = connection.prepareStatement(sql);
      
            
          
            ResultSet rs = st.executeQuery();
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
            

        }catch (SQLException e) {
        e.printStackTrace();
            System.out.println("dal.bookingDAO.getBusTrips()");
    }

        return list;
    }

}
