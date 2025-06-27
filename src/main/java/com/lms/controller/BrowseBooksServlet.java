package com.lms.controller;

import com.lms.dao.BookDAO;
import com.lms.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/browseBooks")
public class BrowseBooksServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        BookDAO dao = new BookDAO();
        List<Book> books = dao.getAllBooks();

        request.setAttribute("bookList", books);
        request.getRequestDispatcher("view_books.jsp").forward(request, response);
    }
}
