
package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnection {

    // Thay đổi thông tin kết nối theo cơ sở dữ liệu của bạn
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/swp";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Sử dụng driver MySQL Connector/J
            connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
            System.out.println("Kết nối đến MySQL thành công!");
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Lỗi kết nối đến MySQL: " + e.getMessage());
        }
        return connection;
    }

    public static void main(String[] args) {
        // Kiểm tra kết nối
        Connection connection = getConnection();
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Đã đóng kết nối đến MySQL.");
            } catch (SQLException e) {
                System.err.println("Lỗi khi đóng kết nối: " + e.getMessage());
            }
        }
    }
}


