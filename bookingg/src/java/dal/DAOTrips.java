/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOTrips extends DBContext {

    public String getTripName(int tripId) {
        String sql = "SELECT bt1_departureTime, bt1_arrivalTime FROM BusTrips WHERE bt1_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, tripId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("bt1_departureTime")+ " - " +rs.getString("bt1_arrivalTime");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTrips.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Không xác định";
    }
    
    public String getRouteName(int routeId) {
        String sql = "SELECT br_from, br_to FROM BusRoutes WHERE br_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("br_from") + " - " + rs.getString("br_to");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTrips.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Không xác định";
    }

    public static void main(String[] args) {
        DAOTrips dao = new DAOTrips();
        String n = dao.getTripName(1);
        if(n != null){
            System.out.println(n);
        }
    }
}
