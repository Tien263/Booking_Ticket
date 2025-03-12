/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Blog;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;

/**
 *
 * @author ADMIN
 */
public class BlogDao extends DBContext<Blog> {

    @Override
    public void insert(Blog entity) {
        String sql_insert = "INSERT INTO [dbo].[Blog]\n"
                + "           ([b_title]\n"
                + "           ,[b_content]\n"
                + "           ,[b_brief]\n"
                + "           ,[b_createdtime]\n"
                + "           ,[b_updatedtime]\n"
                + "           ,[b_status]\n"
                + "           ,[b_image])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        PreparedStatement stm_insert = null;
        try {
            stm_insert = connection.prepareStatement(sql_insert);
            stm_insert.setString(1, entity.getTitle());
            stm_insert.setString(2, entity.getContent());
            stm_insert.setString(3, entity.getBrief());
            stm_insert.setDate(4, new java.sql.Date(entity.getCreatedtime().getTime()));
            stm_insert.setDate(5, new java.sql.Date(entity.getUpdatedtime().getTime()));
            stm_insert.setBoolean(6, entity.isStatus());
            stm_insert.setString(7, entity.getImage());
            stm_insert.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void update(Blog entity) {
        String sql_update = "UPDATE [dbo].[Blog]\n"
                + "   SET [b_title] = ?\n"
                + "      ,[b_content] = ?\n"
                + "      ,[b_brief] = ?\n"
                + "      ,[b_createdtime] = ?\n"
                + "      ,[b_updatedtime] = ?\n"
                + "      ,[b_image] = ?\n"
                + " WHERE b_id = ?";
        PreparedStatement stm_update = null;
        try {
            stm_update = connection.prepareCall(sql_update);
            stm_update.setString(1, entity.getTitle());
            stm_update.setString(2, entity.getContent());
            stm_update.setString(3, entity.getBrief());
            stm_update.setDate(4, new java.sql.Date(entity.getCreatedtime().getTime()));
            stm_update.setDate(5, new java.sql.Date(entity.getUpdatedtime().getTime()));
            stm_update.setString(6, entity.getImage());
            stm_update.setInt(7, entity.getId());
            stm_update.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(Blog entity) {
        String sql_delete = "DELETE FROM [dbo].[Blog]\n"
                + "      WHERE b_id = ?";
        PreparedStatement stm_delete = null;
        try {
            stm_delete = connection.prepareStatement(sql_delete);
            stm_delete.setInt(1, entity.getId());
            stm_delete.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public ArrayList<Blog> list() {

        return null;
    }

    public List<Blog> getAllBlogs() {
        List<Blog> blogs = new ArrayList<>();
        String sql = "SELECT b_id, b_title, b_content, b_brief, "
                + "b_createdtime, b_updatedtime, b_status, b_image "
                + "FROM Blog "
                + "WHERE b_status = 1";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Blog blog = new Blog(
                        rs.getInt("b_id"),
                        rs.getString("b_title"),
                        rs.getString("b_content"),
                        rs.getString("b_brief"),
                        rs.getDate("b_createdtime"),
                        rs.getDate("b_updatedtime"),
                        rs.getBoolean("b_status"),
                        rs.getString("b_image")
                );
                blogs.add(blog);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }

    @Override
    public Blog get(int id) {

        String sql = "SELECT b_id, b_title, b_content, b_brief, \n"
                + "        b_createdtime, b_updatedtime, \n"
                + "       b_status, b_image\n"
                + "FROM Blog\n"
                + "WHERE b_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Blog blog = new Blog(
                        rs.getInt("b_id"),
                        rs.getString("b_title"),
                        rs.getString("b_content"),
                        rs.getString("b_brief"),
                        rs.getDate("b_createdtime"),
                        rs.getDate("b_updatedtime"),
                        rs.getBoolean("b_status"),
                        rs.getString("b_image")
                );
                return blog;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
}
