package com.lms.controller;

import com.lms.dao.TransactionDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/approveRequest")
public class ApproveRequestServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int transactionId = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        TransactionDAO dao = new TransactionDAO();
        dao.updateStatus(transactionId, status);

        response.sendRedirect("admin_approve_requests.jsp");
    }
}
