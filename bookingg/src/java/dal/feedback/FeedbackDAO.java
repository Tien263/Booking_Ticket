/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.feedback;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.feedback.Feedback;

/**
 *
 * @author Admin
 */
public class FeedbackDAO extends DBContext {

    public int addFeedback(Feedback feedback) {
        int n = 0;
        String sql = "INSERT INTO Feedback (BookTicketID, Rating, Comment, Status) VALUES (?, ?, ?, 'Pending')";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, feedback.getbookTicketID());
            ps.setInt(2, feedback.getRating());
            ps.setString(3, feedback.getComment());
            n = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

    public Feedback getFeedbackByBookTicketID(int bookTicketID) {
        String sql = "SELECT * FROM Feedback WHERE BookTicketID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, bookTicketID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) { // Chỉ lấy 1 feedback mới nhất
                    return new Feedback(
                            rs.getInt("FeedbackID"),
                            rs.getInt("BookTicketID"),
                            rs.getInt("Rating"),
                            rs.getString("Comment"),
                            rs.getTimestamp("FeedbackDate"),
                            rs.getString("Status")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Không có feedback nào
    }
    
    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        Feedback newFeedback = dao.getFeedbackByBookTicketID(84);
        System.out.println(newFeedback);
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
