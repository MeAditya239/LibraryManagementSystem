package com.lms.controller;

import com.lms.dao.UserDAO;
import com.lms.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role"); // 'user' or 'librarian'
        String email = request.getParameter("email");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role);
        user.setEmail(email);

        UserDAO dao = new UserDAO();
        boolean result = dao.registerUser(user);

        if (result) {
            response.sendRedirect("login.jsp?success=true");
        } else {
            response.sendRedirect("register.jsp?error=true");
        }
    }
}
