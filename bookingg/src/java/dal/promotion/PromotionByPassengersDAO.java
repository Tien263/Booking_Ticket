package dal.promotion;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.promotion.Promotions_By_Passengers;

public class PromotionByPassengersDAO extends DBContext<Promotions_By_Passengers> {

    @Override
    public void insert(Promotions_By_Passengers entity) {
        String sql = "INSERT INTO Promotions_By_Passengers (pbp_name, pbp_discount, min_tickets, min_points, e_id, priority) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, entity.getName());
            ps.setDouble(2, entity.getDiscount());
            ps.setInt(3, entity.getMinTickets());
            ps.setInt(4, entity.getMinPoints());
            if (entity.getEId() != null) {
                ps.setInt(5, entity.getEId());
            } else {
                ps.setNull(5, java.sql.Types.INTEGER);
            }
            if (entity.getPriority() != null) {
                ps.setInt(6, entity.getPriority());
            } else {
                ps.setNull(6, java.sql.Types.INTEGER);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Promotions_By_Passengers entity) {
        String sql = "UPDATE Promotions_By_Passengers SET pbp_name = ?, pbp_discount = ?, min_tickets = ?, min_points = ?, e_id = ?, priority = ? WHERE pbp_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, entity.getName());
            ps.setDouble(2, entity.getDiscount());
            ps.setInt(3, entity.getMinTickets());
            ps.setInt(4, entity.getMinPoints());
            if (entity.getEId() != null) {
                ps.setInt(5, entity.getEId());
            } else {
                ps.setNull(5, java.sql.Types.INTEGER);
            }
            if (entity.getPriority() != null) {
                ps.setInt(6, entity.getPriority());
            } else {
                ps.setNull(6, java.sql.Types.INTEGER);
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
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, entity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<Promotions_By_Passengers> list() {
        ArrayList<Promotions_By_Passengers> promotions = new ArrayList<>();
        String sql = "SELECT * FROM Promotions_By_Passengers";
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Promotions_By_Passengers promo = new Promotions_By_Passengers();
                promo.setId(rs.getInt("pbp_id"));
                promo.setName(rs.getString("pbp_name"));
                promo.setDiscount(rs.getDouble("pbp_discount"));
                promo.setMinTickets(rs.getInt("min_tickets"));
                promo.setMinPoints(rs.getInt("min_points"));
                promo.setEId(rs.getInt("e_id") == 0 ? null : rs.getInt("e_id"));
                promo.setPriority(rs.getInt("priority") == 0 ? null : rs.getInt("priority"));
                promotions.add(promo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return promotions;
    }

    @Override
    public Promotions_By_Passengers get(int id) {
        String sql = "SELECT * FROM Promotions_By_Passengers WHERE pbp_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Promotions_By_Passengers promo = new Promotions_By_Passengers();
                    promo.setId(rs.getInt("pbp_id"));
                    promo.setName(rs.getString("pbp_name"));
                    promo.setDiscount(rs.getDouble("pbp_discount"));
                    promo.setMinTickets(rs.getInt("min_tickets"));
                    promo.setMinPoints(rs.getInt("min_points"));
                    promo.setEId(rs.getInt("e_id") == 0 ? null : rs.getInt("e_id"));
                    promo.setPriority(rs.getInt("priority") == 0 ? null : rs.getInt("priority"));
                    return promo;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Phương thức lọc
    public ArrayList<Promotions_By_Passengers> filter(String name, Double discount, Integer minTickets, Integer minPoints, Boolean isActive) {
        ArrayList<Promotions_By_Passengers> promotions = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Promotions_By_Passengers WHERE 1=1");
        if (name != null && !name.isEmpty()) {
            sql.append(" AND pbp_name LIKE ?");
        }
        if (discount != null) {
            sql.append(" AND pbp_discount = ?");
        }
        if (minTickets != null) {
            sql.append(" AND min_tickets = ?");
        }
        if (minPoints != null) {
            sql.append(" AND min_points = ?");
        }
        if (isActive != null) {
            if (isActive) {
                sql.append(" AND priority IS NOT NULL AND priority > 0");
            } else {
                sql.append(" AND (priority IS NULL OR priority <= 0)");
            }
        }

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;
            if (name != null && !name.isEmpty()) {
                ps.setString(paramIndex++, "%" + name + "%");
            }
            if (discount != null) {
                ps.setDouble(paramIndex++, discount);
            }
            if (minTickets != null) {
                ps.setInt(paramIndex++, minTickets);
            }
            if (minPoints != null) {
                ps.setInt(paramIndex++, minPoints);
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Promotions_By_Passengers promo = new Promotions_By_Passengers();
                    promo.setId(rs.getInt("pbp_id"));
                    promo.setName(rs.getString("pbp_name"));
                    promo.setDiscount(rs.getDouble("pbp_discount"));
                    promo.setMinTickets(rs.getInt("min_tickets"));
                    promo.setMinPoints(rs.getInt("min_points"));
                    promo.setEId(rs.getInt("e_id") == 0 ? null : rs.getInt("e_id"));
                    promo.setPriority(rs.getInt("priority") == 0 ? null : rs.getInt("priority"));
                    promotions.add(promo);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return promotions;
    }
}