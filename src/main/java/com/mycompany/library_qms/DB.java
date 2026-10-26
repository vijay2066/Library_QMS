package com.mycompany.library_qms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DB {
    // Update these values to match your local MySQL installation.
    private static final String URL = "jdbc:mysql://localhost:3306/library_qms?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD =
        System.getenv("DB_PASSWORD");

    private DB() {}

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            throw new SQLException("MySQL JDBC driver was not found. Check Maven dependencies.", ex);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
