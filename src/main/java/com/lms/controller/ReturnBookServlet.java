package com.lms.controller;

import com.lms.dao.TransactionDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/returnBook")
public class ReturnBookServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int transactionId = Integer.parseInt(request.getParameter("id"));

        TransactionDAO dao = new TransactionDAO();
        dao.returnBook(transactionId);

        response.sendRedirect("return_book.jsp");
    }
}
