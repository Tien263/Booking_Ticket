/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Blog;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class BlogDao extends DBContext<Blog> {

    public void insert(Blog entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void update(Blog entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void delete(Blog entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

  
    public ArrayList<Blog> list() {
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "                     b_id, \n"
                + "                     b_title, \n"
                + "                     b_content,\n"
                + "                     Creator.e_name AS created_by_name, \n"
                + "                     Updater.e_name AS updated_by_name, \n"
                + "                     b_createdtime, \n"
                + "                     b_updatedtime,\n"
                + "                     b_status,\n"
                + "                     b_image\n"
                + "                 FROM \n"
                + "                     Blog\n"
                + "                 LEFT JOIN \n"
                + "                     Employee AS Creator ON Blog.b_createdby = Creator.e_id \n"
                + "                 LEFT JOIN \n"
                + "                     Employee AS Updater ON Blog.b_updatedby = Updater.e_id\n"
                + "					where b_status = 1";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("b_id"));
                b.setTitle(rs.getString("b_title"));
                b.setContent(rs.getString("b_content"));
                b.setCreatedby(rs.getString("created_by_name"));
                b.setUpdatedby(rs.getString("updated_by_name"));
                b.setCreatedtime(rs.getDate("b_createdtime"));
                b.setUpdatedtime(rs.getDate("b_updatedtime"));
                b.setStatus(rs.getBoolean("b_status"));
                b.setImage(rs.getString("b_image"));
                list.add(b);

            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }


    public Blog get(int id) {
        String sql = "SELECT \n"
                + "                     b_id, \n"
                + "                     b_title, \n"
                + "                     b_content,\n"
                + "b_brief,\n"
                + "                     Creator.e_name AS created_by_name, \n"
                + "                     Updater.e_name AS updated_by_name, \n"
                + "                     b_createdtime, \n"
                + "                     b_updatedtime,\n"
                + "                     b_status,\n"
                + "                     b_image\n"
                + "                 FROM \n"
                + "                     Blog\n"
                + "                 LEFT JOIN \n"
                + "                     Employee AS Creator ON Blog.b_createdby = Creator.e_id \n"
                + "                 LEFT JOIN \n"
                + "                     Employee AS Updater ON Blog.b_updatedby = Updater.e_id\n"
                + "					where b_id = ?";
        PreparedStatement stm = null;
        ResultSet rs = null;
        Blog b = null;

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();

            if (rs.next()) {
                b = new Blog();
                b.setId(rs.getInt("b_id"));
                b.setTitle(rs.getString("b_title"));
                b.setContent(rs.getString("b_content"));
                b.setBrief(rs.getString("b_brief"));
                b.setCreatedby(rs.getString("created_by_name"));
                b.setUpdatedby(rs.getString("updated_by_name"));
                b.setCreatedtime(rs.getDate("b_createdtime"));
                b.setUpdatedtime(rs.getDate("b_updatedtime"));
                b.setStatus(rs.getBoolean("b_status"));
                b.setImage(rs.getString("b_image"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(BlogDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return b;

    }

}
