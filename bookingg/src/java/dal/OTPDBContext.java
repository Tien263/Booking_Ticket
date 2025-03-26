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

    /**
     * Tạo ra một mã OTP ngẫu nhiên gồm 6 chữ số.
     * random.nextInt(900000) tạo một số ngẫu nhiên từ 0 đến 899999.
     * Cộng thêm 100000 -> OTP luôn là 6 chữ số (từ 100000 đến 999999).
     * Chuyển số thành chuỗi bằng String.valueOf(otp) và trả về.
     * 
     * @return 
     */
    private static String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }

    /**
     * Chèn một bản ghi OTP mới vào bảng OTP.
     * created_at: Thời gian tạo, sử dụng CURRENT_TIMESTAMP (thời gian hiện tại của hệ thống).
     * expires_at: Thời gian hết hạn, sử dụng 
     * DATEADD(MINUTE, 4, CURRENT_TIMESTAMP) -> thời gian hết hạn là 4 phút sau khi tạo.
     * used: Đặt mặc định là 0 (chưa sử dụng).
     * 
     * @param entity 
     */
    @Override
    public void insert(OTP entity) {
        String sql_insert = "INSERT INTO [dbo].[OTP]\n"
                + "           ([c_email]\n"
                + "           ,[otp]\n"
                + "           ,[created_at]\n"
                + "           ,[expires_at]\n"
                + "           ,[used])\n"
                + "     VALUES\n"
                + "           (?, ?, CURRENT_TIMESTAMP, DATEADD(MINUTE, 4, CURRENT_TIMESTAMP), 0);";

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


    /**
     * Lấy mã OTP mới nhất (chưa sử dụng và chưa hết hạn) cho một email cụ thể.
     * @param email: Email cần lấy mã OTP.
     * expires_at > GETDATE(): Chỉ lấy mã OTP chưa hết hạn 
     * (GETDATE() là thời gian hiện tại trong SQL Server).
     * ORDER BY created_at DESC: Sắp xếp theo thời gian tạo giảm dần để lấy mã OTP mới nhất.
     * 
     * @return 
     */
    
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

    
    /**
     * Xác minh xem một mã OTP có hợp lệ không (tức là có tồn tại, chưa sử dụng, và chưa hết hạn).
     * @param email
     * @param otp
     * @return 
     */
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

    
    /**
     * Cập nhật trạng thái của một mã OTP thành đã sử dụng (used = 1).
     * 
     * @param entity 
     */
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
