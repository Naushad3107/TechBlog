/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String usergender = request.getParameter("usergender");
            Part part = request.getPart("image");
            String fileName = part.getSubmittedFileName();

            // Get the user from the session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");

            if (user != null) {
                // Update user details
                user.setName(userName);
                user.setEmail(userEmail);
                user.setPassword(userPassword);
                user.setGender(usergender);

//                // **Store file path instead of filename:**
//                String uploadPath = "/pics"; // Replace with your actual upload directory
//                String filePath = Paths.get(uploadPath, fileName).toString();
//
//                // Save uploaded file
//                if (part.getSize() > 0) {
//                    File uploadDir = new File(uploadPath);
//                    if (!uploadDir.exists()) {
//                        uploadDir.mkdirs(); // Create upload directory if it doesn't exist
//                    }
//                    part.write(filePath);
//                }
//
//                user.setProfile(filePath);

                // Update the user in the database
                UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                boolean success = userDao.updateUser(user);

                if (success) {
                    out.println("User updated successfully.");
                } else {
                    out.println("Failed to update user.");
                }
            } else {
                out.println("User session not found. Please log in again.");
            }
        }
    }

    // ... (rest of the servlet code remains the same)
}
