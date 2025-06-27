package com.lms.dao;

import com.lms.model.Book;
import com.lms.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    public List<Book> getAllBooks() {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT * FROM books";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setIsbn(rs.getString("isbn"));
                book.setPublicationYear(rs.getInt("publication_year"));
                book.setQuantity(rs.getInt("quantity"));

                list.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    
    
    
    
    public void addBook(Book book) {
        String sql = "INSERT INTO books (title, author, isbn, publication_year, quantity) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getIsbn());
            ps.setInt(4, book.getPublicationYear());
            ps.setInt(5, book.getQuantity());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    
    
    
    public void deleteBook(int bookId) {
        String sql = "DELETE FROM books WHERE book_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bookId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    
    
    
    
    
    public Book getBookById(int bookId) {  
        Book book = null;
        String sql = "SELECT * FROM books WHERE book_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bookId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                book = new Book();
                book.setBookId(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setIsbn(rs.getString("isbn"));
                book.setPublicationYear(rs.getInt("publication_year"));
                book.setQuantity(rs.getInt("quantity"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return book;
    }
    
    
    
    
    
    
    
    
    
    
    
    public void updateBook(Book book) {
        String sql = "UPDATE books SET title=?, author=?, isbn=?, publication_year=?, quantity=? WHERE book_id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getIsbn());
            ps.setInt(4, book.getPublicationYear());
            ps.setInt(5, book.getQuantity());
            ps.setInt(6, book.getBookId());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }




}
