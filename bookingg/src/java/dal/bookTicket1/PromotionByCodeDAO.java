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
import model.promotion.Promotions_By_Code;

public class PromotionByCodeDAO extends DBContext<Promotions_By_Code> {

    @Override
    public void insert(Promotions_By_Code entity) {
        String sql = "INSERT INTO Promotions_By_Code (pbc_code, pbc_name, pbc_discount, pbc_endDate, pbc_quantity, a_id, e_id, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getCode());
            ps.setString(2, entity.getName());
            ps.setDouble(3, entity.getDiscount());
            ps.setDate(4, new java.sql.Date(entity.getEndDate().getTime()));
            ps.setInt(5, entity.getQuantity());
            if (entity.getaId()!= null) {
                ps.setInt(6, entity.getaId());
            } else {
                ps.setNull(6, Types.INTEGER);
            }
            if (entity.geteId() != null) {
                ps.setInt(7, entity.geteId());
            } else {
                ps.setNull(7, Types.INTEGER);
            }
            if (entity.getPriority() != null) {
                ps.setInt(8, entity.getPriority());
            } else {
                ps.setNull(8, Types.INTEGER);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Promotions_By_Code entity) {
        String sql = "UPDATE Promotions_By_Code SET pbc_name = ?, pbc_code = ?, pbc_discount = ?, pbc_endDate = ?, pbc_quantity = ?, a_id = ?, e_id = ?, priority = ? WHERE pbc_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getName());
            ps.setString(2, entity.getCode());
            ps.setDouble(3, entity.getDiscount());
            ps.setDate(4, new java.sql.Date(entity.getEndDate().getTime()));
            ps.setInt(5, entity.getQuantity());
            if (entity.getaId() != null) {
                ps.setInt(6, entity.getaId());
            } else {
                ps.setNull(6, Types.INTEGER);
            }
            if (entity.geteId() != null) {
                ps.setInt(7, entity.geteId());
            } else {
                ps.setNull(7, Types.INTEGER);
            }
            if (entity.getPriority() != null) {
                ps.setInt(8, entity.getPriority());
            } else {
                ps.setNull(8, Types.INTEGER);
            }
            ps.setInt(9, entity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Promotions_By_Code entity) {
        String sql = "DELETE FROM Promotions_By_Code WHERE pbc_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, entity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<Promotions_By_Code> list() {
        ArrayList<Promotions_By_Code> list = new ArrayList<>();
        String sql = "SELECT * FROM Promotions_By_Code";
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Promotions_By_Code promo = new Promotions_By_Code(
                        rs.getInt("pbc_id"),
                        rs.getString("pbc_name"),
                        rs.getString("pbc_code"),
                        rs.getDouble("pbc_discount"),
                        rs.getDate("pbc_endDate"),
                        rs.getInt("pbc_quantity"),
                        rs.getInt("a_id") == 0 ? null : rs.getInt("a_id"),
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
    public Promotions_By_Code get(int id) {
        String sql = "SELECT * FROM Promotions_By_Code WHERE pbc_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Promotions_By_Code(
                        rs.getInt("pbc_id"),
                        rs.getString("pbc_name"),
                        rs.getString("pbc_code"),
                        rs.getDouble("pbc_discount"),
                        rs.getDate("pbc_endDate"),
                        rs.getInt("pbc_quantity"),
                        rs.getInt("a_id") == 0 ? null : rs.getInt("a_id"),
                        rs.getInt("e_id") == 0 ? null : rs.getInt("e_id"),
                        rs.getInt("priority") == 0 ? null : rs.getInt("priority")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void decreaseQuantity(int pbcId) {
        String sql = "UPDATE Promotions_By_Code SET pbc_quantity = pbc_quantity - 1 WHERE pbc_id = ? AND pbc_quantity > 0";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pbcId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Promotions_By_Code getByCode(String code) {
        String sql = "SELECT * FROM Promotions_By_Code WHERE pbc_code = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Promotions_By_Code(
                        rs.getInt("pbc_id"),
                        rs.getString("pbc_name"),
                        rs.getString("pbc_code"),
                        rs.getDouble("pbc_discount"),
                        rs.getDate("pbc_endDate"),
                        rs.getInt("pbc_quantity"),
                        rs.getInt("a_id") == 0 ? null : rs.getInt("a_id"),
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