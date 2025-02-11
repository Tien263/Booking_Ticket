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
public class DAORoutes extends DBContext{

    public String getRouteName(int routeId) {
        String sql = "SELECT br_from, br_to FROM BusRoutes WHERE br_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, routeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("br_from") + " - " + rs.getString("br_to");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORoutes.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Không xác định";
    }
    
    public static void main(String[] args) {
        DAORoutes dao = new DAORoutes();
        String n = dao.getRouteName(1);
        System.out.println(n);
    }
}
