/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private final Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //method to insert user to data base.
    public boolean saveUser(User user) {
        boolean f = false;
        String query = "INSERT INTO user(id,name,email,password,gender) values (?,?,?,?,?)";
        try (PreparedStatement pstmt = this.con.prepareStatement(query)) {
            pstmt.setInt(1, user.getId());
            pstmt.setString(2, user.getName());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPassword());
            pstmt.setString(5, user.getGender());

            //updating
            pstmt.executeUpdate();
            f = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;

    }

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        String query = "SELECT * FROM user WHERE email =? and password =?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {

                user = new User();

//        data from db
                String name = set.getString("name");
//            set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setGender(set.getString("gender"));
                user.setPassword(set.getString("password"));
                user.setDate(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {
    boolean f = false;

    String query = "UPDATE user SET name=?, email=? , password=? , gender=? ,profile=? WHERE id=?";
    try (PreparedStatement pstmt = con.prepareStatement(query)) {

        pstmt.setInt(1, user.getId());
        pstmt.setString(2, user.getName());
        pstmt.setString(3, user.getEmail());
        pstmt.setString(4, user.getPassword());
        pstmt.setString(5,user.getGender());
        pstmt.setString(6, user.getProfile());
        

        // Updating the database
        pstmt.executeUpdate();
        f = true;

    } catch (SQLException e) {
        e.printStackTrace();
    }
    return f;
}
}
