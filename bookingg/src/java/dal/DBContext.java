package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public abstract class DBContext<T> {

    protected Connection connection;

    public DBContext() {
        try {
            String user = "sa";
            String pass = "123";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=PROJECTV01;trustServerCertificate=true;";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
            if (connection == null) {
                throw new SQLException("Không thể thiết lập kết nối đến cơ sở dữ liệu.");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, "Không tìm thấy driver SQL Server.", ex);
            throw new RuntimeException("Không thể tải driver SQL Server.", ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, "Không thể kết nối đến cơ sở dữ liệu.", ex);
            throw new RuntimeException("Không thể kết nối đến cơ sở dữ liệu.", ex);
        }
    }

    /**
     * Lấy kết nối đến cơ sở dữ liệu.
     *
     * @return đối tượng Connection
     * @throws SQLException nếu kết nối không tồn tại
     */
    public Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            throw new SQLException("Kết nối đến cơ sở dữ liệu không tồn tại hoặc đã bị đóng.");
        }
        return connection;
    }

    public abstract void insert(T entity);

    public abstract void update(T entity);

    public abstract void delete(T entity);

    public abstract ArrayList<T> list();

    public abstract T get(int id);
}