package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Formatter;

/**
 * Created by Andrey on 10.01.2017.
 */
public class DbConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/%s?autoReconnect=true&useSSL=false";
    private static final String DEFAULT_DB_NAME = "shop";
    private static String DB_NAME = DEFAULT_DB_NAME;
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    private DbConnection() {
    }

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            Formatter formatter = new Formatter();
            return DriverManager.getConnection(formatter.format(URL, DB_NAME).toString(), USERNAME, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void setDbName(String dbName) {
        DB_NAME = dbName;
    }
}
