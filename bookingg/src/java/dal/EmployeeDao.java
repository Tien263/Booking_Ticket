/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import MD5.BCrypt;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Employee;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import java.sql.*;
import model.Role;

/**
 *
 * @author ADMIN
 */
public class EmployeeDao extends DBContext<Employee> {

    public ArrayList<Employee> search(Integer id, String name, String phone, String address, Boolean gender, Integer roleId) {
        String sql = "SELECT e.e_id, e.e_name, e.e_phone, e.e_address, e.e_gender, r.r_name\n"
                + "FROM employee e\n"
                + "JOIN users u ON e.e_id = u.e_id\n"
                + "JOIN roles r ON r.r_id = u.r_id\n" +
        "WHERE 1 = 1";

        ArrayList<Employee> emps = new ArrayList<>();
        ArrayList<Object> paramValues = new ArrayList<>();
        if (id != null) {
            sql += " AND e.e_id = ?";
            paramValues.add(id);
        }
        if (name != null) {
            sql += " AND e.e_name LIKE '%' + ? + '%'";
            paramValues.add(name);
        }
        if (phone != null) {
            sql += " AND e.e_phone LIKE '%' + ? + '%'";
            paramValues.add(phone);
        }
        if (address != null) {
            sql += " AND e.e_address LIKE '%' + ? + '%'";
            paramValues.add(address);

        }
        if (gender != null) {
            sql += " AND e.e_gender = ?";
            paramValues.add(gender);
        }
        if (roleId != null && roleId != -1) {
            sql += " AND r.r_id  = ?";
            paramValues.add(roleId);
        }
        PreparedStatement stm = null;

        try {
            stm = connection.prepareStatement(sql);
            for (int i = 0; i < paramValues.size(); i++) {
                stm.setObject((i + 1), paramValues.get(i));
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("e_id"));
                e.setName(rs.getString("e_name"));
                e.setGender(rs.getBoolean("e_gender"));
                e.setAddress(rs.getString("e_address"));
                e.setPhone(rs.getString("e_phone"));

                Role r = new Role();
                r.setName(rs.getString("r_name"));  // Lấy Role Name từ ResultSet
                e.setRole(r);

                emps.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return emps;

    }

    public boolean updateUserEId(String username, int eId) {
        String sql = "UPDATE Users SET e_id = ? WHERE u_username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, eId);
            ps.setString(2, username);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("✅ Updated e_id for user: " + username + " -> e_id: " + eId);
                return true;
            } else {
                System.out.println("⚠️ Failed to update e_id for user: " + username);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateEmployee(Employee emp) {
        String sql = "UPDATE Employee SET e_name = ?, e_phone = ?, e_address = ?, e_gender = ? WHERE e_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, emp.getName());
            ps.setString(2, emp.getPhone());
            ps.setString(3, emp.getAddress());
            ps.setBoolean(4, emp.isGender());
            ps.setInt(5, emp.getId());

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Employee updated successfully! e_id: " + emp.getId());
                return true;
            } else {
                System.out.println("No rows updated! Check if e_id exists: " + emp.getId());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean insertEmployee(Employee emp) {
        String sql = "INSERT INTO Employee (e_name, e_phone, e_address, e_gender) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, emp.getName());
            ps.setString(2, emp.getPhone());
            ps.setString(3, emp.getAddress());
            ps.setBoolean(4, emp.isGender());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    emp.setId(generatedKeys.getInt(1)); // Cập nhật e_id cho Employee
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean hasEmployeeInfo(int userId) {
        String sql = "SELECT COUNT(*) FROM Employee WHERE e_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Nếu số bản ghi > 0, tức là đã có thông tin Employee
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Trả về false nếu có lỗi hoặc không tìm thấy
    }

    public User getUserByUsernameAndPassword(String username, String password) {
        User user = null;
        BCrypt bCrypt = new BCrypt();
        String sql = "SELECT u.u_username, u.u_password, COALESCE(u.e_id, -1) AS e_id "
                + "FROM Users u WHERE u.u_username = ? AND u.u_password = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User(rs.getString("u_username"), bCrypt.hashpw(rs.getString("u_password"), bCrypt.gensalt()));
                int retrievedEId = rs.getInt("e_id"); // Lấy e_id từ DB, sql));
                user.seteId(retrievedEId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean checkUserNameExist(String username) {
        try {
            String sql = "select* from Users\n"
                    + "Where u_username = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public void insert(Employee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Employee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Employee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Employee> list() {
        ArrayList<Employee> list = new ArrayList<>();
        String sql = "SELECT e.e_id, e_name, e_phone, e_gender, e_address, r.r_name \n"
                + "FROM employee e \n"
                + "JOIN users u ON e.e_id = u.e_id \n"
                + "JOIN roles r ON r.r_id = u.r_id";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("e_id"));
                e.setName(rs.getString("e_name"));
                e.setPhone(rs.getString("e_phone"));
                e.setGender(rs.getBoolean("e_gender"));
                e.setAddress(rs.getString("e_address"));
                Role role = new Role();
                role.setName(rs.getString("r_name"));
                e.setRole(role);
                list.add(e);
            }

        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public Employee get(int id) {
        String sql = "SELECT * FROM Employee WHERE e_id = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                return new Employee(
                        rs.getInt("e_id"),
                        rs.getString("e_name"),
                        rs.getString("e_phone"),
                        rs.getString("e_address"),
                        rs.getBoolean("e_gender"),
                        rs.getInt("r_id")
                );
            }
        } catch (Exception e) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (Exception e) {
                Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return null;
    }

    public Employee getEmployeeById(int eId) {
        Employee employee = null;
        String sql = "SELECT e_id, e_name, e_phone, e_address, e_gender FROM Employee WHERE e_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, eId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                employee = new Employee();
                employee.setId(rs.getInt("e_id"));
                employee.setName(rs.getString("e_name"));
                employee.setPhone(rs.getString("e_phone"));
                employee.setAddress(rs.getString("e_address"));
                employee.setGender(rs.getBoolean("e_gender"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

}
