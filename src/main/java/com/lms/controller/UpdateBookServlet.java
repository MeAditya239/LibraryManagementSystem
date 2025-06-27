package com.lms.controller;

import com.lms.dao.BookDAO;
import com.lms.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateBook")
public class UpdateBookServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String isbn = request.getParameter("isbn");
        int year = Integer.parseInt(request.getParameter("year"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Book book = new Book();
        book.setBookId(bookId);
        book.setTitle(title);
        book.setAuthor(author);
        book.setIsbn(isbn);
        book.setPublicationYear(year);
        book.setQuantity(quantity);

        BookDAO dao = new BookDAO();
        dao.updateBook(book);

        response.sendRedirect("view_books.jsp");
    }
}
