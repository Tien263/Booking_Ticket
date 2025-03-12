/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Admin
 */
public class SeatDAO extends DBContext {

    public void insertSeats(int v_id, int bt1_id) {
        String sqlCapacity = "SELECT v_capacity FROM Vehicles WHERE v_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sqlCapacity)) {
            stmt.setInt(1, v_id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int capacity = rs.getInt("v_capacity");
                    String insertSQL = "INSERT INTO Seats (s_name, s_status, v_id, bt1_id, s_level) VALUES (?, 'Available', ?, ?, ?)";

                    try (PreparedStatement insertStmt = connection.prepareStatement(insertSQL)) {
                        for (int i = 1; i <= capacity; i++) {
                            String seatName = (i <= capacity / 2)
                                    ? "A" + String.format("%02d", i)
                                    : "B" + String.format("%02d", i - capacity / 2);
                            int s_level = (i <= capacity / 2) ? 1 : 2;

                            insertStmt.setString(1, seatName);
                            insertStmt.setInt(2, v_id);
                            insertStmt.setInt(3, bt1_id);
                            insertStmt.setInt(4, s_level);
                            insertStmt.addBatch();
                        }
                        insertStmt.executeBatch();
                    }
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(SeatDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
    public ResultSet getVehicle(String sql){
        ResultSet rs = null;
        try {
            Statement state = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            rs = state.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(SeatDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
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
