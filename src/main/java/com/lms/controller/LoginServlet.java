package com.lms.controller;

import com.lms.dao.UserDAO;
import com.lms.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        
        
        UserDAO dao = new UserDAO();
        User user = dao.loginUser(username, password);

        
        
        
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if (user.getRole().equals("librarian")) {
                response.sendRedirect("admin_dashboard.jsp");
            } else {
                response.sendRedirect("user_dashboard.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=true");
        }
    }
}
