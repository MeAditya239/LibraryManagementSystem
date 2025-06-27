package com.lms.controller;

import com.lms.dao.TransactionDAO;
import com.lms.model.Transaction;
import com.lms.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

@WebServlet("/issueBook")
public class IssueBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("bookId"));
        User user = (User) request.getSession().getAttribute("user");

        Date today = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(today);
        cal.add(Calendar.DAY_OF_MONTH, 14); // 2 weeks due

        Transaction tx = new Transaction();
        tx.setUserId(user.getUserId());
        tx.setBookId(bookId);
        tx.setBorrowDate(today);
        tx.setDueDate(cal.getTime());
        tx.setStatus("pending");

        TransactionDAO dao = new TransactionDAO();
        dao.requestBorrow(tx);

        response.sendRedirect("browseBooks?success=true");

    }
}
