/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.promotion;

import dal.DBContext;
import java.util.ArrayList;
import model.promotion.Promotions_By_Date;
import java.sql.*;

/**
 *
 * @author ADMIN
 */
public class PromotionByDateDAO extends DBContext<Promotions_By_Date>{

    // Thêm chương trình khuyến mãi
    @Override
    public void insert(Promotions_By_Date entity) {
        String sql = "INSERT INTO Promotions_By_Date (pbd_startDate, pbd_endDate, pbd_discount, pbd_quantity) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(entity.getStartDate().getTime()));
            ps.setDate(2, new java.sql.Date(entity.getEndDate().getTime()));
            ps.setDouble(3, entity.getDiscount());
            ps.setInt(4, entity.getQuantity());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Cập nhật chương trình khuyến mãi
    @Override
    public void update(Promotions_By_Date entity) {
        String sql = "UPDATE Promotions_By_Date SET pbd_startDate = ?, pbd_endDate = ?, pbd_discount = ?, pbd_quantity = ? WHERE pbd_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(entity.getStartDate().getTime()));
            ps.setDate(2, new java.sql.Date(entity.getEndDate().getTime()));
            ps.setDouble(3, entity.getDiscount());
            ps.setInt(4, entity.getQuantity());
            ps.setInt(5, entity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Xóa chương trình khuyến mãi
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

    // Lấy danh sách các chương trình khuyến mãi
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
                    rs.getDate("pbd_startDate"),
                    rs.getDate("pbd_endDate"),
                    rs.getDouble("pbd_discount"),
                    rs.getInt("pbd_quantity")
                );
                list.add(promo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy một chương trình khuyến mãi theo ID
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
                    rs.getDate("pbd_startDate"),
                    rs.getDate("pbd_endDate"),
                    rs.getDouble("pbd_discount"),
                    rs.getInt("pbd_quantity")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
}
