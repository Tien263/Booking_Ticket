/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.bookTicket1;

/**
 *
 * @author ADMIN
 */

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import model.bookTicket.PromotionUsage;

public class PromotionUsageDAO extends DBContext<PromotionUsage> {

    @Override
    public void insert(PromotionUsage entity) {
        String sql = "INSERT INTO Promotion_Usage (c_id, pbc_id, pbd_id, pbp_id) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, entity.getCId());
            if (entity.getPbcId() != null) {
                ps.setInt(2, entity.getPbcId());
            } else {
                ps.setNull(2, Types.INTEGER);
            }
            if (entity.getPbdId() != null) {
                ps.setInt(3, entity.getPbdId());
            } else {
                ps.setNull(3, Types.INTEGER);
            }
            if (entity.getPbpId() != null) {
                ps.setInt(4, entity.getPbpId());
            } else {
                ps.setNull(4, Types.INTEGER);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(PromotionUsage entity) {
        // Không cần update cho bảng này
    }

    @Override
    public void delete(PromotionUsage entity) {
        String sql = "DELETE FROM Promotion_Usage WHERE pu_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, entity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<PromotionUsage> list() {
        ArrayList<PromotionUsage> list = new ArrayList<>();
        String sql = "SELECT * FROM Promotion_Usage";
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                PromotionUsage usage = new PromotionUsage(
                        rs.getInt("pu_id"),
                        rs.getInt("c_id"),
                        rs.getInt("pbc_id") == 0 ? null : rs.getInt("pbc_id"),
                        rs.getInt("pbd_id") == 0 ? null : rs.getInt("pbd_id"),
                        rs.getInt("pbp_id") == 0 ? null : rs.getInt("pbp_id"),
                        rs.getTimestamp("usage_date")
                );
                list.add(usage);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public PromotionUsage get(int id) {
        String sql = "SELECT * FROM Promotion_Usage WHERE pu_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new PromotionUsage(
                        rs.getInt("pu_id"),
                        rs.getInt("c_id"),
                        rs.getInt("pbc_id") == 0 ? null : rs.getInt("pbc_id"),
                        rs.getInt("pbd_id") == 0 ? null : rs.getInt("pbd_id"),
                        rs.getInt("pbp_id") == 0 ? null : rs.getInt("pbp_id"),
                        rs.getTimestamp("usage_date")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean hasUsedPromotion(int cId, Integer pbcId, Integer pbdId, Integer pbpId) {
        String sql = "SELECT COUNT(*) FROM Promotion_Usage WHERE c_id = ? AND (pbc_id = ? OR pbd_id = ? OR pbp_id = ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cId);
            if (pbcId != null) {
                ps.setInt(2, pbcId);
            } else {
                ps.setNull(2, Types.INTEGER);
            }
            if (pbdId != null) {
                ps.setInt(3, pbdId);
            } else {
                ps.setNull(3, Types.INTEGER);
            }
            if (pbpId != null) {
                ps.setInt(4, pbpId);
            } else {
                ps.setNull(4, Types.INTEGER);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}