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
import model.promotion.Promotions_By_Date;

public class PromotionByDateDAO extends DBContext<Promotions_By_Date> {

    @Override
    public void insert(Promotions_By_Date entity) {
        String sql = "INSERT INTO Promotions_By_Date (pbd_name, pbd_startDate, pbd_endDate, pbd_discount, pbd_quantity, e_id, priority) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getName());
            ps.setDate(2, new java.sql.Date(entity.getStartDate().getTime()));
            ps.setDate(3, new java.sql.Date(entity.getEndDate().getTime()));
            ps.setDouble(4, entity.getDiscount());
            ps.setInt(5, entity.getQuantity());
            if (entity.geteId() != null) {
                ps.setInt(6, entity.geteId());
            } else {
                ps.setNull(6, Types.INTEGER);
            }
            if (entity.getPriority() != null) {
                ps.setInt(7, entity.getPriority());
            } else {
                ps.setNull(7, Types.INTEGER);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Promotions_By_Date entity) {
        String sql = "UPDATE Promotions_By_Date SET pbd_name = ?, pbd_startDate = ?, pbd_endDate = ?, pbd_discount = ?, pbd_quantity = ?, e_id = ?, priority = ? WHERE pbd_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getName());
            ps.setDate(2, new java.sql.Date(entity.getStartDate().getTime()));
            ps.setDate(3, new java.sql.Date(entity.getEndDate().getTime()));
            ps.setDouble(4, entity.getDiscount());
            ps.setInt(5, entity.getQuantity());
            if (entity.geteId() != null) {
                ps.setInt(6, entity.geteId());
            } else {
                ps.setNull(6, Types.INTEGER);
            }
            if (entity.getPriority() != null) {
                ps.setInt(7, entity.getPriority());
            } else {
                ps.setNull(7, Types.INTEGER);
            }
            ps.setInt(8, entity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Promotions_By_Date entity) {
        String sql = "DELETE FROM Promotions_By_Date WHERE pbd_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, entity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<Promotions_By_Date> list() {
        ArrayList<Promotions_By_Date> list = new ArrayList<>();
        String sql = "SELECT * FROM Promotions_By_Date";
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Promotions_By_Date promo = new Promotions_By_Date(
                        rs.getInt("pbd_id"),
                        rs.getString("pbd_name"),
                        rs.getDate("pbd_startDate"),
                        rs.getDate("pbd_endDate"),
                        rs.getDouble("pbd_discount"),
                        rs.getInt("pbd_quantity"),
                        rs.getInt("e_id") == 0 ? null : rs.getInt("e_id"),
                        rs.getInt("priority") == 0 ? null : rs.getInt("priority")
                );
                list.add(promo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Promotions_By_Date get(int id) {
        String sql = "SELECT * FROM Promotions_By_Date WHERE pbd_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Promotions_By_Date(
                        rs.getInt("pbd_id"),
                        rs.getString("pbd_name"),
                        rs.getDate("pbd_startDate"),
                        rs.getDate("pbd_endDate"),
                        rs.getDouble("pbd_discount"),
                        rs.getInt("pbd_quantity"),
                        rs.getInt("e_id") == 0 ? null : rs.getInt("e_id"),
                        rs.getInt("priority") == 0 ? null : rs.getInt("priority")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}