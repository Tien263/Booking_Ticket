/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.promotion;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import model.promotion.Promotions_By_Code;

public class PromotionByCodeDAO extends DBContext<Promotions_By_Code> {

<<<<<<< HEAD
=======
    // Fetch a promotion by its code
    public Promotions_By_Code getPromotionByCode(String code) {
        String sql = "SELECT * FROM Promotions_By_Code " +
                     "WHERE pbc_code = ? AND pbc_endDate >= GETDATE() AND pbc_quantity > 0";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Promotions_By_Code(
                        rs.getInt("pbc_id"),
                        rs.getNString("pbc_name"),
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

    // Decrease the quantity of a promotion after use
    public boolean decreasePromotionQuantity(int pbcId) {
        String sql = "UPDATE Promotions_By_Code SET pbc_quantity = pbc_quantity - 1 " +
                     "WHERE pbc_id = ? AND pbc_quantity > 0";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, pbcId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
>>>>>>> main
    /**
     * Chèn một mã giảm giá mới vào database
     */
    @Override
    public void insert(Promotions_By_Code entity) {
        String sql = "INSERT INTO Promotions_By_Code (pbc_code, pbc_name, pbc_discount, pbc_endDate, pbc_quantity) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getCode());
            ps.setString(2, entity.getName());
            ps.setDouble(3, entity.getDiscount());
            ps.setDate(4, new java.sql.Date(entity.getEndDate().getTime()));
            ps.setInt(5, entity.getQuantity());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Cập nhật thông tin mã giảm giá theo ID
     */
    @Override
    public void update(Promotions_By_Code entity) {
        String sql = "UPDATE Promotions_By_Code SET pbc_name = ?, pbc_code = ?, pbc_discount = ?, pbc_endDate = ?, pbc_quantity = ? WHERE pbc_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getName());
            ps.setString(2, entity.getCode());
            ps.setDouble(3, entity.getDiscount());
            ps.setDate(4, new java.sql.Date(entity.getEndDate().getTime()));
            ps.setInt(5, entity.getQuantity());
            ps.setInt(6, entity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Xóa mã giảm giá theo ID
     */
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

    /**
     * Lấy danh sách tất cả mã giảm giá
     */
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
                        rs.getNString("pbc_name"),
                        rs.getString("pbc_code"),
                        rs.getDouble("pbc_discount"),
                        rs.getDate("pbc_endDate"),
                        rs.getInt("pbc_quantity")
                );
                list.add(promo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Lấy thông tin mã giảm giá theo ID
     */
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
                        rs.getNString("pbc_name"),
                        rs.getString("pbc_code"),
                        rs.getDouble("pbc_discount"),
                        rs.getDate("pbc_endDate"),
                        rs.getInt("pbc_quantity")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public void delete(int id) {
        String sql = "DELETE FROM Promotions_By_Code WHERE pbc_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

<<<<<<< HEAD
=======
    public ArrayList<Promotions_By_Code> list1() {
        ArrayList<Promotions_By_Code> list = new ArrayList<>();
        String sql = "SELECT * FROM Promotions_By_Code";
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Promotions_By_Code promo = new Promotions_By_Code(
                        rs.getInt("pbc_id"),
                        rs.getNString("pbc_name"),
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
>>>>>>> main
}
