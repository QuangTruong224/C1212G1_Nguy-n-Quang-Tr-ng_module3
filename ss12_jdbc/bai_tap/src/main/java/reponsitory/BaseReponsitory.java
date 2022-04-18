package reponsitory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseReponsitory {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "nguyenquangtruong";
    private Connection connection;

    public BaseReponsitory() {
    }

    public Connection getConnectionJavaToDB() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            return connection;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }
}
