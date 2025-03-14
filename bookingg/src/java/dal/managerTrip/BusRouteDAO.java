/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.managerTrip;

import dal.*;
import java.util.ArrayList;
import model.managerTrip.BusRoute;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class BusRouteDAO extends DBContext<BusRoute> {

    @Override
    public void insert(BusRoute busRoute) {
        String sql = "INSERT INTO [dbo].[BusRoutes]([br_distance],[br_from],[br_to],[br_price],[br_description],[br_status])\n"
                + "     VALUES(?,?,?,?,?,?)";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, busRoute.getBr_distance());
            pre.setString(2, busRoute.getBr_from());
            pre.setString(3, busRoute.getBr_to());
            pre.setDouble(4, busRoute.getBr_price());
            pre.setString(5, busRoute.getBr_description());
            pre.setString(6, busRoute.getBr_status());
            pre.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BusRouteDAO.class.getName()).log(Level.SEVERE, "lỗi khi thêm tuyến xe bus", e);
        }
    }

    @Override
    public void update(BusRoute busRoute) {
        String sql = "UPDATE [dbo].[BusRoutes]\n"
                + "   SET [br_distance] = ?,[br_from] = ?,[br_to] = ?,[br_price] = ?,[br_description] = ?,[br_status] = ?\n"
                + " WHERE [br_id] = ?";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {

            pre.setInt(1, busRoute.getBr_distance());
            pre.setString(2, busRoute.getBr_from());
            pre.setString(3, busRoute.getBr_to());
            pre.setDouble(4, busRoute.getBr_price());
            pre.setString(5, busRoute.getBr_description());
            pre.setString(6, busRoute.getBr_status());
            pre.setInt(7, busRoute.getBr_id());
            pre.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BusRouteDAO.class.getName()).log(Level.SEVERE, "Lỗi khi cập nhật tuyến xe buýt", e);
        }
    }

    public void changeInactive(int pid, String mess) {
        String sql = "UPDATE [dbo].[BusRoutes] SET [br_status] = '" + mess + "' WHERE br_id = " + pid;
        try {
            //default: ResultSet.TYPE_FORWARD_ONLY
            Statement state = connection.createStatement();
            state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(BusRouteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(BusRoute busRoute) {
        String checkSql = "SELECT * FROM [BusTrips] WHERE br_id = " + busRoute.getBr_id();
        try {
            ResultSet rs = connection.createStatement().executeQuery(checkSql);
            if (rs.next()) {
                changeInactive(busRoute.getBr_id(), "inactive");
            }
            String sql = "DELETE FROM [dbo].[BusRoutes] WHERE [br_id] = " + busRoute.getBr_id();
            //default: ResultSet.TYPE_FORWARD_ONLY
            Statement state = connection.createStatement();
            state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(BusRouteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<BusRoute> list(String sql) {
        ArrayList<BusRoute> list = new ArrayList<>();
        try (PreparedStatement pre = connection.prepareStatement(sql); ResultSet rs = pre.executeQuery()) {
            while (rs.next()) {
                BusRoute busRoute = new BusRoute(rs.getInt("br_id"),
                        rs.getInt("br_distance"),
                        rs.getString("br_from"),
                        rs.getString("br_to"),
                        rs.getDouble("br_price"),
                        rs.getString("br_description"),
                        rs.getString("br_status"));
                list.add(busRoute);
            }
        } catch (Exception e) {
            Logger.getLogger(BusRouteDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    @Override
    public BusRoute get(int id) {
        String sql = "SELECT [br_id],[br_distance],[br_from],[br_to],[br_price],[br_description],[br_status] FROM [dbo].[BusRoutes] WHERE br_id = ?";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, id);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    return new BusRoute(rs.getInt("br_id"),
                            rs.getInt("br_distance"),
                            rs.getString("br_from"),
                            rs.getString("br_to"),
                            rs.getDouble("br_price"),
                            rs.getString("br_description"),
                            rs.getString("br_status"));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(BusRouteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        BusRouteDAO dao = new BusRouteDAO();
        BusRouteDAO busRouteDAO = new BusRouteDAO();
                BusRoute busRoute = busRouteDAO.get(1);
                System.out.println(busRoute);
    }

    @Override
    public ArrayList<BusRoute> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
