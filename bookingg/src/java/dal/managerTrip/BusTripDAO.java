/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.managerTrip;

import dal.*;
import java.sql.Date;
import java.util.ArrayList;
import model.managerTrip.BusTrips;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Time;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class BusTripDAO extends DBContext<BusTrips> {


    public int insertBusTrip(BusTrips busTrips) {
        int generatedId = -1;
        String sql = "INSERT INTO [dbo].[BusTrips]([bt1_date],[bt1_departureTime],[bt1_arrivalTime],[bt1_status],[br_id])\n"
                + "     VALUES(?,?,?,?,?)";
        try (PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pre.setDate(1, Date.valueOf(busTrips.getBt1_date()));
            pre.setTime(2, Time.valueOf(busTrips.getBt1_departureTime()));
            pre.setTime(3, Time.valueOf(busTrips.getBt1_arrivalTime()));
            pre.setString(4, busTrips.getBt1_status());
            pre.setInt(5, busTrips.getBr_id());
            int affectedRows = pre.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = pre.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        generatedId = generatedKeys.getInt(1); // Lấy ID vừa insert
                    }
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(BusTripDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return generatedId;
    }

    @Override
    public void update(BusTrips busTrips) {
        String sql = "UPDATE [dbo].[BusTrips]\n"
                + "   SET [bt1_date] = ?\n"
                + "      ,[bt1_departureTime] = ?\n"
                + "      ,[bt1_arrivalTime] = ?\n"
                + "      ,[bt1_status] = ?\n"
                + "      ,[br_id] = ?\n"
                + " WHERE [bt1_id] = ?";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {

            pre.setDate(1, Date.valueOf(busTrips.getBt1_date()));
            pre.setTime(2, Time.valueOf(busTrips.getBt1_departureTime()));
            pre.setTime(3, Time.valueOf(busTrips.getBt1_arrivalTime()));
            pre.setString(4, busTrips.getBt1_status());
            pre.setInt(5, busTrips.getBr_id());
            pre.setInt(6, busTrips.getBt1_id());
            pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(BusTripDAO.class.getName()).log(Level.SEVERE, "Lỗi khi cập nhật tuyến xe buýt", e);
        }
    }

    @Override
    public void delete(BusTrips busTrips) {
        String sql = "DELETE FROM [dbo].[BusTrips] WHERE [bt1_id] = ?";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, busTrips.getBt1_id());
            pre.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(BusTripDAO.class.getName()).log(Level.SEVERE, "Lỗi khi xóa tuyến xe buýt", e);
        }
    }

    public ArrayList<BusTrips> list(String sql) {
        ArrayList<BusTrips> list = new ArrayList<>();
        try (PreparedStatement pre = connection.prepareStatement(sql); ResultSet rs = pre.executeQuery()) {
            while (rs.next()) {
                BusTrips busTrips = new BusTrips(rs.getInt("bt1_id"),
                        rs.getDate("bt1_date").toLocalDate(),
                        rs.getTime("bt1_departureTime").toLocalTime(),
                        rs.getTime("bt1_arrivalTime").toLocalTime(),
                        rs.getString("bt1_status"),
                        rs.getInt("br_id"),
                rs.getString("v_licensePlate"));
                list.add(busTrips);
            }
        } catch (SQLException e) {
            Logger.getLogger(BusRouteDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    @Override
    public BusTrips get(int id) {
        String sql = "SELECT [bt1_id],[bt1_date],[bt1_departureTime],[bt1_arrivalTime],[bt1_status],[br_id] FROM [dbo].[BusTrips] WHERE [bt1_id] = ?";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, id);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    return new BusTrips(rs.getInt("bt1_id"),
                            rs.getDate("bt1_date").toLocalDate(),
                            rs.getTime("bt1_departureTime").toLocalTime(),
                            rs.getTime("bt1_arrivalTime").toLocalTime(),
                            rs.getString("bt1_status"),
                            rs.getInt("br_id"));
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(BusRouteDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    @Override
    public ArrayList<BusTrips> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(BusTrips entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
