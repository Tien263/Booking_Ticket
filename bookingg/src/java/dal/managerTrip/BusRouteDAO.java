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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class BusRouteDAO extends DBContext<BusRoute> {

    public ArrayList<BusRoute> searchBusRoutes(String from, String to) {
        ArrayList<BusRoute> list = new ArrayList<>();
        String sql = "SELECT [br_id], [br_from], [br_to], [br_price], [br_distance], [br_description], [br_status] "
                + "FROM [dbo].[BusRoutes] WHERE 1=1";

        // Thêm điều kiện tìm kiếm nếu from hoặc to không rỗng
        if (from != null && !from.trim().isEmpty()) {
            sql += " AND [br_from] LIKE ?";
        }
        if (to != null && !to.trim().isEmpty()) {
            sql += " AND [br_to] LIKE ?";
        }

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            int paramIndex = 1;
            if (from != null && !from.trim().isEmpty()) {
                st.setString(paramIndex++, "%" + from + "%");
            }
            if (to != null && !to.trim().isEmpty()) {
                st.setString(paramIndex++, "%" + to + "%");
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                BusRoute br = new BusRoute();
                br.setBr_id(rs.getInt("br_id"));
                br.setBr_from(rs.getString("br_from"));
                br.setBr_to(rs.getString("br_to"));
                br.setBr_price(rs.getDouble("br_price"));
                br.setBr_distance(rs.getInt("br_distance"));
                br.setBr_description(rs.getString("br_description"));
                br.setBr_status(rs.getString("br_status"));
                list.add(br);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BusRouteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

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
        Statement state = null;
        try {
            // Cập nhật trạng thái BusRoutes
            String routeSql = "UPDATE [dbo].[BusRoutes] SET [br_status] = '" + mess + "' WHERE br_id = " + pid;
            state = connection.createStatement();
            state.executeUpdate(routeSql);

            // Cập nhật trạng thái tất cả BusTrips liên quan
            String tripSql = "UPDATE [dbo].[BusTrips] SET [bt1_status] = 'Inactive' WHERE br_id = " + pid + " AND [bt1_status] = 'active'";
            state.executeUpdate(tripSql);
        } catch (SQLException ex) {
            Logger.getLogger(BusRouteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(BusRoute busRoute) {
        String checkSql = "SELECT COUNT(*) FROM [BusTrips] WHERE br_id = ?";
        String deleteRouteSql = "DELETE FROM [dbo].[BusRoutes] WHERE [br_id] = ?";
        try {
            PreparedStatement checkStmt = connection.prepareStatement(checkSql);
            PreparedStatement deleteRouteStmt = connection.prepareStatement(deleteRouteSql);
            checkStmt.setInt(1, busRoute.getBr_id());
            ResultSet rs = checkStmt.executeQuery();
            int tripCount = 0;
            if (rs.next()) {
                tripCount = rs.getInt(1);
            }

            // Nếu có BusTrips, gọi changeInactive
            if (tripCount > 0) {
                changeInactive(busRoute.getBr_id(), "inactive");
            } else {
                // Xóa BusRoute
                deleteRouteStmt.setInt(1, busRoute.getBr_id());
                deleteRouteStmt.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(BusRouteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<BusRoute> list(String sql, List<Object> params) {
        ArrayList<BusRoute> list = new ArrayList<>();

        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            for (int i = 0; i < params.size(); i++) {
                pre.setObject(i + 1, params.get(i));
            }

            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    BusRoute busRoute = new BusRoute(
                            rs.getInt("br_id"),
                            rs.getInt("br_distance"),
                            rs.getString("br_from"),
                            rs.getString("br_to"),
                            rs.getDouble("br_price"),
                            rs.getString("br_description"),
                            rs.getString("br_status"));
                    list.add(busRoute);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
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

    public int getTotalBusRoutes(String baseSql, List<Object> params) {
        int count = 0;
        String sql = "SELECT COUNT(*) " + baseSql; // Chỉ đếm số bản ghi

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public static void main(String[] args) {
        BusRouteDAO dao = new BusRouteDAO();
        BusRoute busRoute = dao.get(4);
        dao.delete(busRoute);
    }

    @Override
    public ArrayList<BusRoute> list() {
        ArrayList<BusRoute> list = new ArrayList<>();
        String sql = "select br_id, br_from, br_to, br_price,"
                + "br_distance, br_description,br_status "
                + "from BusRoutes ";

        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                BusRoute br = new BusRoute();
                br.setBr_id(rs.getInt("br_id"));
                br.setBr_from(rs.getString("br_from"));
                br.setBr_to(rs.getString("br_to"));
                br.setBr_price(rs.getDouble("br_price"));
                br.setBr_distance(rs.getInt("br_distance"));
                br.setBr_description(rs.getString("br_description"));
                br.setBr_status(rs.getString("br_status"));
                list.add(br);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BusRouteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
