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
                + "           ,[b_createdby]\n"
                + "           ,[b_updatedby]\n"
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
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        PreparedStatement stm_insert = null;
        try {
            stm_insert = connection.prepareStatement(sql_insert);
            stm_insert.setString(1, entity.getTitle());
            stm_insert.setString(2, entity.getContent());
            stm_insert.setString(3, entity.getBrief());
            stm_insert.setInt(4, entity.getCreatedby().getId());
            stm_insert.setInt(5, entity.getUpdatedby().getId());
            stm_insert.setDate(6, new java.sql.Date(entity.getCreatedtime().getTime()));
            stm_insert.setDate(7, new java.sql.Date(entity.getUpdatedtime().getTime()));
            stm_insert.setBoolean(8, entity.isStatus());
            stm_insert.setString(9, entity.getImage());
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
                + "      ,[b_updatedby] = ?\n"
                + "      ,[b_createdtime] = ?\n"
                + "      ,[b_updatedtime] = ?\n"
                + "      ,[b_status] = ?\n"
                + "      ,[b_image] = ?\n"
                + " WHERE b_id = ?";
        PreparedStatement stm_update = null;
        try {
            stm_update = connection.prepareCall(sql_update);
            stm_update.setString(1, entity.getTitle());
            stm_update.setString(2, entity.getContent());
            stm_update.setString(3, entity.getBrief());
            stm_update.setInt(4, entity.getUpdatedby().getId());
            stm_update.setDate(5, new java.sql.Date(entity.getCreatedtime().getTime()));
            stm_update.setDate(6, new java.sql.Date(entity.getUpdatedtime().getTime()));
            stm_update.setBoolean(7, entity.isStatus());
            stm_update.setString(8, entity.getImage());
            stm_update.setInt(9, entity.getId());
            stm_update.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(Blog entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Blog> list() {

        return null;
    }

    public List<Blog> getAllBlogs() {
        List<Blog> blogs = new ArrayList<>();
        String sql = "SELECT b_id, b_title, b_content, b_brief, "
                + "Creator.e_id AS created_by_id, Creator.e_name AS created_by_name, "
                + "Updater.e_id AS updated_by_id, Updater.e_name AS updated_by_name, "
                + "b_createdtime, b_updatedtime, b_status, b_image "
                + "FROM Blog "
                + "LEFT JOIN Employee AS Creator ON Blog.b_createdby = Creator.e_id "
                + "LEFT JOIN Employee AS Updater ON Blog.b_updatedby = Updater.e_id "
                + "WHERE b_status = 1";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Employee creator = new Employee(rs.getInt("created_by_id"), rs.getString("created_by_name"));
                Employee updater = new Employee(rs.getInt("updated_by_id"), rs.getString("updated_by_name"));

                Blog blog = new Blog(
                        rs.getInt("b_id"),
                        rs.getString("b_title"),
                        rs.getString("b_content"),
                        rs.getString("b_brief"),
                        creator,
                        updater,
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
                + "       b_createdby, b_updatedby, b_createdtime, b_updatedtime, \n"
                + "       b_status, b_image\n"
                + "FROM Blog\n"
                + "WHERE b_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                EmployeeDao employeeDao = new EmployeeDao();
                Employee creator = employeeDao.getEmployeeById(rs.getInt("b_createdby"));
                Employee updater = employeeDao.getEmployeeById(rs.getInt("b_updatedby"));
                Blog blog = new Blog(
                        rs.getInt("b_id"),
                        rs.getString("b_title"),
                        rs.getString("b_content"),
                        rs.getString("b_brief"),
                        creator,
                        updater,
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


