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
import model.bookTicket.Tickets;


public class TicketsDAO extends DBContext<Tickets> {

    @Override
    public void insert(Tickets entity) {
        String sql = "INSERT INTO Tickets (t_status, bt_id, s_id, t_purchaseDate) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, entity.getStatus());
            ps.setInt(2, entity.getBtId());
            ps.setInt(3, entity.getSId());
            if (entity.getPurchaseDate() != null) {
                ps.setTimestamp(4, new Timestamp(entity.getPurchaseDate().getTime()));
            } else {
                ps.setNull(4, Types.TIMESTAMP);
            }
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                entity.setId(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Tickets entity) {
        String sql = "UPDATE Tickets SET t_status = ?, bt_id = ?, s_id = ?, t_purchaseDate = ? WHERE t_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getStatus());
            ps.setInt(2, entity.getBtId());
            ps.setInt(3, entity.getSId());
            if (entity.getPurchaseDate() != null) {
                ps.setTimestamp(4, new Timestamp(entity.getPurchaseDate().getTime()));
            } else {
                ps.setNull(4, Types.TIMESTAMP);
            }
            ps.setInt(5, entity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Tickets entity) {
        String sql = "DELETE FROM Tickets WHERE t_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, entity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<Tickets> list() {
        ArrayList<Tickets> list = new ArrayList<>();
        String sql = "SELECT * FROM Tickets";
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Tickets t = new Tickets(
                        rs.getInt("t_id"),
                        rs.getString("t_status"),
                        rs.getInt("bt_id"),
                        rs.getInt("s_id"),
                        rs.getTimestamp("t_purchaseDate")
                );
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Tickets get(int id) {
        String sql = "SELECT * FROM Tickets WHERE t_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Tickets(
                        rs.getInt("t_id"),
                        rs.getString("t_status"),
                        rs.getInt("bt_id"),
                        rs.getInt("s_id"),
                        rs.getTimestamp("t_purchaseDate")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
