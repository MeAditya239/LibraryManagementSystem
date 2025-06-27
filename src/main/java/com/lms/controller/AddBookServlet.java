package com.lms.controller;

import com.lms.dao.BookDAO;
import com.lms.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/addBook")
public class AddBookServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String isbn = request.getParameter("isbn");
        int year = Integer.parseInt(request.getParameter("year"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Book book = new Book();
        book.setTitle(title);
        book.setAuthor(author);
        book.setIsbn(isbn);
        book.setPublicationYear(year);
        book.setQuantity(quantity);

        BookDAO dao = new BookDAO();
        dao.addBook(book);
        
        System.out.println("Title = " + title); // log input
        System.out.println("Calling DAO...");


        response.sendRedirect("browseBooks?success=true");

    }
}
