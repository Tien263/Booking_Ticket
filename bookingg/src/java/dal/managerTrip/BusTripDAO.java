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
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class BusTripDAO extends DBContext<BusTrips> {

    public List<Integer> insertBusTripForMonth(int year, int month, BusTrips busTrips) {
        List<Integer> generatedIds = new ArrayList<>();
        String sql = "INSERT INTO [dbo].[BusTrips]([bt1_date],[bt1_departureTime],[bt1_arrivalTime],[bt1_status],[br_id]) "
                + "VALUES(?,?,?,?,?)";

        // Xác định số ngày trong tháng
        YearMonth yearMonth = YearMonth.of(year, month);
        int daysInMonth = yearMonth.lengthOfMonth();

        try (PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            for (int day = 1; day <= daysInMonth; day++) {
                LocalDate tripDate = LocalDate.of(year, month, day);

                pre.setDate(1, Date.valueOf(tripDate)); // Ngày chuyến xe
                pre.setTime(2, Time.valueOf(busTrips.getBt1_departureTime())); // Giờ khởi hành
                pre.setTime(3, Time.valueOf(busTrips.getBt1_arrivalTime())); // Giờ đến
                pre.setString(4, busTrips.getBt1_status()); // Trạng thái
                pre.setInt(5, busTrips.getBr_id()); // Tuyến đường

                int affectedRows = pre.executeUpdate();
                if (affectedRows > 0) {
                    try (ResultSet generatedKeys = pre.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            generatedIds.add(generatedKeys.getInt(1)); // Lưu ID của chuyến xe
                        }
                    }
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(BusTripDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return generatedIds; // Trả về danh sách ID của các chuyến xe đã chèn
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
        String sql = "UPDATE [dbo].[BusTrips] SET bt1_status = 'Inactive' WHERE bt1_id = ? AND bt1_status = 'Pending'";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, busTrips.getBt1_id());
            int affectedRows = pre.executeUpdate();
            if (affectedRows == 0) {
                Logger.getLogger(BusTripDAO.class.getName()).log(Level.WARNING, "Không có chuyến xe nào ở trạng thái 'Pending' để hủy");
            }
        } catch (SQLException e) {
            Logger.getLogger(BusTripDAO.class.getName()).log(Level.SEVERE, "Lỗi khi cập nhật trạng thái chuyến xe buýt", e);
        }
    }

    public ArrayList<BusTrips> list(String sql, List<Object> params) {
        ArrayList<BusTrips> list = new ArrayList<>();
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            for (int i = 0; i < params.size(); i++) {
                pre.setObject(i + 1, params.get(i)); // Gán tham số
            }
            ResultSet rs = pre.executeQuery();
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
            Logger.getLogger(BusTripDAO.class.getName()).log(Level.SEVERE, null, e);
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
            Logger.getLogger(BusTripDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public int getTotalBusTrips(String baseSql, List<Object> params) {
        int count = 0;
        String sql = "SELECT COUNT(DISTINCT bt.bt1_id)" + baseSql;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            Logger.getLogger(BusTripDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return count;
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
