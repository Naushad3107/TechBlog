
package com.tech.blog.servlets;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import java.io.IOException;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String check = request.getParameter("check");
        if(check == null ){
        out.println("box not checked");
        }else{
        // Assuming you have form parameters for user details
        String name = request.getParameter("user_name");
        String email = request.getParameter("user_email");
        String password = request.getParameter("user_password");
        String gender = request.getParameter("user_gender");

        User user = new User(name, email, gender, password);

        // Get database connection from ConnectionProvider
        Connection con = ConnectionProvider.getConnection();
        // Save the user using UserDao (assuming UserDao is available)
        UserDao userDao = new UserDao(con);
        
        boolean registrationSuccess;
        registrationSuccess = userDao.saveUser(user);
        
        if (registrationSuccess) {
            out.println("<h1>success</h1>");
        } else {
            // Registration failed
            out.println("<h1>error<h1>");
        }
        
    }
    }
}
