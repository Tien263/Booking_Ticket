/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.bookTicket;

import dal.*;
import model.bookTicket.Seats;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class SeatsDAO extends DBContext {

    //Lấy danh sách ghế
    public List<Seats> getSeats(int tripId, int vehicleId) {
        List<Seats> seats = new ArrayList<>();
        String sql = "SELECT s_id, s_name, s_status, s_level FROM Seats WHERE bt1_id = ? AND v_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, tripId);
            ps.setInt(2, vehicleId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int s_id = rs.getInt("s_id");
                String s_name = rs.getString("s_name");
                String s_status = rs.getString("s_status");
                int level = rs.getInt("s_level");
                seats.add(new Seats(s_id, s_name, s_status, vehicleId, tripId, level));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SeatsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return seats;
    }

    //Đổi trạng thái ghế 
    public void changeStatus(int pid, String value) {
        String sql = "UPDATE Seats SET s_status='" + value + "' WHERE s_id=" + pid;
        try {
            //default: ResultSet.TYPE_FORWARD_ONLY
            Statement state = connection.createStatement();
            state.executeUpdate(sql);

        } catch (SQLException ex) {
            Logger.getLogger(SeatsDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Kiểm tra ghế và đổi trạng thái
    public Boolean isSeatBooked(int pid, String status) {
        String checkSQL = "SELECT * FROM Tickets WHERE s_id=" + pid;
        try {
            ResultSet rs = connection.createStatement().executeQuery(checkSQL);
            if (rs.next()) {
                changeStatus(pid, status);
                return true;

            }
        } catch (SQLException ex) {
            Logger.getLogger(SeatsDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public String getSeatName(int seatId) {
        String sql = "SELECT s_name FROM Seats WHERE s_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, seatId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("s_name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SeatsDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return "Không xác định";
    }
    
    public static void main(String[] args) {
        SeatsDAO dao = new SeatsDAO();
        List<Seats> seats = dao.getSeats(1, 5);
        for (Seats seat : seats) {
            System.out.println(seat);
        }
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
