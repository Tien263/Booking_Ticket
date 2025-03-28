package dal.promotion;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import model.promotion.Promotions_By_Date;

public class PromotionByDateDAO extends DBContext<Promotions_By_Date> {

    @Override
    public void insert(Promotions_By_Date entity) {
        String sql = "INSERT INTO Promotions_By_Date (pbd_name, pbd_startDate, pbd_endDate, pbd_discount, pbd_quantity, e_id, priority) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setNString(1, entity.getName());
            ps.setDate(2, new java.sql.Date(entity.getStartDate().getTime()));
            ps.setDate(3, new java.sql.Date(entity.getEndDate().getTime()));
            ps.setDouble(4, entity.getDiscount());
            ps.setInt(5, entity.getQuantity());
            ps.setObject(6, entity.geteId(), java.sql.Types.INTEGER);
            ps.setObject(7, entity.getPriority(), java.sql.Types.INTEGER);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error inserting promotion", e);
        }
    }

    @Override
    public void update(Promotions_By_Date entity) {
        String sql = "UPDATE Promotions_By_Date SET pbd_name = ?, pbd_startDate = ?, pbd_endDate = ?, pbd_discount = ?, pbd_quantity = ?, e_id = ?, priority = ? WHERE pbd_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setNString(1, entity.getName());
            ps.setDate(2, new java.sql.Date(entity.getStartDate().getTime()));
            ps.setDate(3, new java.sql.Date(entity.getEndDate().getTime()));
            ps.setDouble(4, entity.getDiscount());
            ps.setInt(5, entity.getQuantity());
            ps.setObject(6, entity.geteId(), java.sql.Types.INTEGER);
            ps.setObject(7, entity.getPriority(), java.sql.Types.INTEGER);
            ps.setInt(8, entity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error updating promotion", e);
        }
    }

    @Override
    public void delete(Promotions_By_Date entity) {
        String sql = "DELETE FROM Promotions_By_Date WHERE pbd_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, entity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error deleting promotion", e);
        }
    }

    @Override
    public ArrayList<Promotions_By_Date> list() {
        ArrayList<Promotions_By_Date> list = new ArrayList<>();
        String sql = "SELECT * FROM Promotions_By_Date";
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Promotions_By_Date promo = mapResultSetToPromotion(rs);
                list.add(promo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error listing promotions", e);
        }
        return list;
    }

    @Override
    public Promotions_By_Date get(int id) {
        String sql = "SELECT * FROM Promotions_By_Date WHERE pbd_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToPromotion(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error getting promotion", e);
        }
        return null;
    }

    public ArrayList<Promotions_By_Date> filter(String name, Double discount, Boolean isActive) {
        ArrayList<Promotions_By_Date> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Promotions_By_Date WHERE 1=1");
        ArrayList<Object> params = new ArrayList<>();

        if (name != null && !name.trim().isEmpty()) {
            sql.append(" AND pbd_name LIKE ?");
            params.add("%" + name + "%");
        }
        if (discount != null) {
            sql.append(" AND pbd_discount = ?");
            params.add(discount);
        }
        if (isActive != null) {
            sql.append(" AND pbd_endDate " + (isActive ? ">=" : "<") + " GETDATE()");
        }

        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Promotions_By_Date promo = mapResultSetToPromotion(rs);
                    list.add(promo);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error filtering promotions", e);
        }
        return list;
    }

    private Promotions_By_Date mapResultSetToPromotion(ResultSet rs) throws SQLException {
        return new Promotions_By_Date(
            rs.getInt("pbd_id"), // Sửa từ "id" thành "pbd_id"
            rs.getNString("pbd_name"), // Sửa từ "name" thành "pbd_name"
            rs.getDate("pbd_startDate"), // Sửa từ "startDate" thành "pbd_startDate"
            rs.getDate("pbd_endDate"), // Sửa từ "endDate" thành "pbd_endDate"
            rs.getDouble("pbd_discount"), // Sửa từ "discount" thành "pbd_discount"
            rs.getInt("pbd_quantity"), // Sửa từ "quantity" thành "pbd_quantity"
            rs.getObject("e_id") != null ? rs.getInt("e_id") : null,
            rs.getObject("priority") != null ? rs.getInt("priority") : null
        );
    }
    public ArrayList<Promotions_By_Date> list1() {
        ArrayList<Promotions_By_Date> list = new ArrayList<>();
        String sql = "SELECT * FROM Promotions_By_Date";
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Promotions_By_Date promo = new Promotions_By_Date(
                    rs.getInt("pbd_id"),
                    rs.getNString("pbd_name"),
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
}