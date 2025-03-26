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
import model.promotion.Promotions_By_Passengers;

public class PromotionByPassengersDAO extends DBContext<Promotions_By_Passengers> {

    @Override
    public void insert(Promotions_By_Passengers entity) {
        String sql = "INSERT INTO Promotions_By_Passengers (pbp_name, pbp_discount, pbp_min_tickets, pbp_min_points, e_id, priority) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getName());
            ps.setDouble(2, entity.getDiscount());
            ps.setInt(3, entity.getMinTickets());
            ps.setInt(4, entity.getMinPoints());
            if (entity.getEId() != null) {
                ps.setInt(5, entity.getEId());
            } else {
                ps.setNull(5, Types.INTEGER);
            }
            if (entity.getPriority() != null) {
                ps.setInt(6, entity.getPriority());
            } else {
                ps.setNull(6, Types.INTEGER);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Promotions_By_Passengers entity) {
        String sql = "UPDATE Promotions_By_Passengers SET pbp_name = ?, pbp_discount = ?, pbp_min_tickets = ?, pbp_min_points = ?, e_id = ?, priority = ? WHERE pbp_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getName());
            ps.setDouble(2, entity.getDiscount());
            ps.setInt(3, entity.getMinTickets());
            ps.setInt(4, entity.getMinPoints());
            if (entity.getEId() != null) {
                ps.setInt(5, entity.getEId());
            } else {
                ps.setNull(5, Types.INTEGER);
            }
            if (entity.getPriority() != null) {
                ps.setInt(6, entity.getPriority());
            } else {
                ps.setNull(6, Types.INTEGER);
            }
            ps.setInt(7, entity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Promotions_By_Passengers entity) {
        String sql = "DELETE FROM Promotions_By_Passengers WHERE pbp_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, entity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<Promotions_By_Passengers> list() {
        ArrayList<Promotions_By_Passengers> list = new ArrayList<>();
        String sql = "SELECT * FROM Promotions_By_Passengers";
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Promotions_By_Passengers promo = new Promotions_By_Passengers(
                        rs.getInt("pbp_id"),
                        rs.getString("pbp_name"),
                        rs.getDouble("pbp_discount"),
                        rs.getInt("pbp_min_tickets"),
                        rs.getInt("pbp_min_points"),
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
    public Promotions_By_Passengers get(int id) {
        String sql = "SELECT * FROM Promotions_By_Passengers WHERE pbp_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Promotions_By_Passengers(
                        rs.getInt("pbp_id"),
                        rs.getString("pbp_name"),
                        rs.getDouble("pbp_discount"),
                        rs.getInt("pbp_min_tickets"),
                        rs.getInt("pbp_min_points"),
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