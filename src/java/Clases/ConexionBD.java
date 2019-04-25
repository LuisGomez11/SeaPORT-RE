
package Clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

    private final static String USER = "root";
    private final static String PASSWORD = "1234";
    private final static String URL = "jdbc:mysql://localhost:3306/pro_aula";
    private final static String DRIVER = "com.mysql.jdbc.Driver";

    public static Connection connect() throws ClassNotFoundException, SQLException {
        Class.forName(DRIVER);
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
    
}
