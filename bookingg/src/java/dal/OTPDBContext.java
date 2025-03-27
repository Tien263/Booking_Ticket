/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.OTP;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class OTPDBContext extends DBContext<OTP> {

    private static String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }

    @Override
    public void insert(OTP entity) {
        String sql_insert = "INSERT INTO [dbo].[OTP]\n"
                + "           ([c_email]\n"
                + "           ,[otp]\n"
                + "           ,[created_at]\n"
                + "           ,[expires_at]\n"
                + "           ,[used])\n"
                + "     VALUES\n"
                + "           (?, ?, CURRENT_TIMESTAMP, DATEADD(MINUTE, 2, CURRENT_TIMESTAMP), 0);";

        String sql_select = "SELECT @@IDENTITY as otpid";

        PreparedStatement stm_insert = null;
        PreparedStatement stm_select = null;

        try {
            connection.setAutoCommit(false);
            stm_insert = connection.prepareStatement(sql_insert);
            stm_insert.setString(1, entity.getEmail());
            stm_insert.setString(2, generateOTP());
            stm_insert.executeUpdate();

            stm_select = connection.prepareStatement(sql_select);
            ResultSet rs = stm_select.executeQuery();
            if (rs.next()) {
                entity.setOtpID(rs.getInt("otpid"));
            }

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(OTPDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(OTPDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } 
    }


    public String getOTP(String email) {
        String sql = "SELECT TOP 1 otp FROM [dbo].[OTP] "
                + "WHERE c_email = ? "
                + "AND used = 0 AND expires_at > GETDATE() "
                + "ORDER BY created_at DESC";
        PreparedStatement stm = null;

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getString("otp").trim();
            }
        } catch (SQLException ex) {
            Logger.getLogger(OTPDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return null;
    }

    public boolean verifyOTP(String email, String otp) {
        String sql = "SELECT TOP 1 * FROM OTP WHERE otp = ? "
                + "AND c_email = ? AND used = 0 AND expires_at > GETDATE() ORDER BY  expires_at DESC ";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, otp);
            stm.setString(2, email);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OTPDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return false;
    }

    @Override
    public void update(OTP entity) {
        String sql_update = "UPDATE OTP SET used = 1 WHERE c_email = ? AND otp = ?";

        PreparedStatement stm_update = null;

        try {

            stm_update = connection.prepareStatement(sql_update);
            stm_update.setString(1, entity.getEmail());
            stm_update.setString(2, entity.getOtp());
            stm_update.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OTPDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(OTPDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void delete(OTP entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<OTP> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public OTP get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
