/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Objects;
import java.util.Properties;

public class ConnectionProvider {
    private static Connection con;

    public static Connection getConnection() {
        if (con == null) {
            try {
                // Loading driver class
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Load database connection details from a properties file
                try (InputStream in = ConnectionProvider.class.getResourceAsStream("props.properties")) {
                    Properties props = new Properties();
                    props.load(Objects.requireNonNull(in));

                    String url = props.getProperty("jdbc.url");
                    String user = props.getProperty("jdbc.user");
                    String password = props.getProperty("jdbc.password");

                    // Create a connection
                    con = DriverManager.getConnection(url, user, password);
                }
            } catch (IOException | ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }

        return con;
    }
}