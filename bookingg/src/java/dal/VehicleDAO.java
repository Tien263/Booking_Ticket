/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Vehicle;

/**
 *
 * @author Quang Anh
 */
public class VehicleDAO extends DBContext {

    public List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        String sql = "SELECT * FROM Vehicles";
        try (
                Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                vehicles.add(new Vehicle(
                        rs.getInt("v_id"),
                        rs.getString("v_type"),
                        rs.getInt("v_capacity"),
                        rs.getString("v_licensePlate"),
                        rs.getString("v_status")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicles;
    }

    public boolean isLicensePlateExists(String licensePlate) {
        String sql = "SELECT COUNT(*) FROM Vehicles WHERE v_licensePlate = ?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, licensePlate);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Nếu COUNT > 0 nghĩa là đã tồn tại
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean insertVehicle(Vehicle vehicle) {
        if (isLicensePlateExists(vehicle.getLicensePlate())) {
            return false; // Trả về false nếu biển số đã tồn tại
        }
        String sql = "INSERT INTO Vehicles (v_type, v_capacity, v_licensePlate, v_status) VALUES (?, ?, ?, ?)";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, vehicle.getType());
            stmt.setInt(2, vehicle.getCapacity());
            stmt.setString(3, vehicle.getLicensePlate());
            stmt.setString(4, vehicle.getStatus());
            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    vehicle.setId(generatedKeys.getInt(1)); // Lấy ID tự động sinh
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateVehicle(Vehicle vehicle) {
        String checkSql = "SELECT COUNT(*) FROM Vehicles WHERE v_licensePlate = ? AND v_id != ?";
        try (PreparedStatement checkStmt = connection.prepareStatement(checkSql)) {
            checkStmt.setString(1, vehicle.getLicensePlate());
            checkStmt.setInt(2, vehicle.getId());
            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return false; // Biển số đã tồn tại cho xe khác
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        String sql = "UPDATE Vehicles SET v_type=?, v_capacity=?, v_licensePlate=?, v_status=? WHERE v_id=?";
        try (
                PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, vehicle.getType());
            pstmt.setInt(2, vehicle.getCapacity());
            pstmt.setString(3, vehicle.getLicensePlate());
            pstmt.setString(4, vehicle.getStatus());
            pstmt.setInt(5, vehicle.getId());
            int affectedRows = pstmt.executeUpdate(); // Thực hiện INSERT
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void deleteVehicle(int id) {
        String sql = "DELETE FROM Vehicles WHERE v_id=?";
        try (
                PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<Vehicle> searchByLicensePlate(String licensePlate) {
        List<Vehicle> vehicles = new ArrayList<>();
        String sql = "SELECT * FROM Vehicles WHERE v_licensePlate LIKE ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + licensePlate + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                vehicles.add(new Vehicle(
                        rs.getInt("v_id"),
                        rs.getString("v_type"),
                        rs.getInt("v_capacity"),
                        rs.getString("v_licensePlate"),
                        rs.getString("v_status")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicles;
    }

    public List<Vehicle> searchByType(String type) {
        List<Vehicle> vehicles = new ArrayList<>();
        String sql = "SELECT * FROM Vehicles WHERE v_type LIKE ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + type + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                vehicles.add(new Vehicle(
                        rs.getInt("v_id"),
                        rs.getString("v_type"),
                        rs.getInt("v_capacity"),
                        rs.getString("v_licensePlate"),
                        rs.getString("v_status")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicles;
    }

    public Vehicle getVehicleById(int id) {
        String sql = "SELECT * FROM Vehicles WHERE v_id=?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new Vehicle(
                        rs.getInt("v_id"),
                        rs.getString("v_type"),
                        rs.getInt("v_capacity"),
                        rs.getString("v_licensePlate"),
                        rs.getString("v_status")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void insert(Object entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Object entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Object entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Object get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
