package com.lms.dao;

import com.lms.model.Transaction;
import com.lms.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TransactionDAO {

    public void requestBorrow(Transaction tx) {
        String sql = "INSERT INTO transactions (user_id, book_id, borrow_date, due_date, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, tx.getUserId());
            ps.setInt(2, tx.getBookId());
            ps.setDate(3, new java.sql.Date(tx.getBorrowDate().getTime()));
            ps.setDate(4, new java.sql.Date(tx.getDueDate().getTime()));
            ps.setString(5, tx.getStatus());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Transaction> getPendingTransactions() {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT * FROM transactions WHERE status = 'pending'";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Transaction tx = new Transaction();
                tx.setTransactionId(rs.getInt("transaction_id"));
                tx.setUserId(rs.getInt("user_id"));
                tx.setBookId(rs.getInt("book_id"));
                tx.setBorrowDate(rs.getDate("borrow_date"));
                tx.setDueDate(rs.getDate("due_date"));
                tx.setStatus(rs.getString("status"));

                list.add(tx);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void updateStatus(int transactionId, String status) {
        String sql = "UPDATE transactions SET status = ? WHERE transaction_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, transactionId);
            ps.executeUpdate();

            // If approved, decrease book quantity
            if ("approved".equals(status)) {
                // Get book_id
                PreparedStatement getBookId = conn.prepareStatement("SELECT book_id FROM transactions WHERE transaction_id = ?");
                getBookId.setInt(1, transactionId);
                ResultSet rs = getBookId.executeQuery();

                if (rs.next()) {
                    int bookId = rs.getInt("book_id");

                    // Decrease book quantity by 1
                    PreparedStatement updateQty = conn.prepareStatement("UPDATE books SET quantity = quantity - 1 WHERE book_id = ?");
                    updateQty.setInt(1, bookId);
                    updateQty.executeUpdate();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    
    
    
    
    
    
    
 // Get borrowed books for a user
    public List<Transaction> getBorrowedBooksByUser(int userId) {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT * FROM transactions WHERE user_id = ? AND status = 'approved'";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Transaction tx = new Transaction();
                tx.setTransactionId(rs.getInt("transaction_id"));
                tx.setUserId(rs.getInt("user_id"));
                tx.setBookId(rs.getInt("book_id"));
                tx.setBorrowDate(rs.getDate("borrow_date"));
                tx.setDueDate(rs.getDate("due_date"));
                tx.setReturnDate(rs.getDate("return_date"));
                tx.setStatus(rs.getString("status"));

                list.add(tx);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Mark transaction as returned
    public void returnBook(int transactionId) {
        String sql = "UPDATE transactions SET status = 'returned', return_date = ? WHERE transaction_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setDate(1, new java.sql.Date(System.currentTimeMillis()));
            ps.setInt(2, transactionId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    
    
    
    
    
    
    
 // All transactions (admin view)
    public List<Transaction> getAllTransactions() {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT * FROM transactions";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Transaction tx = new Transaction();
                tx.setTransactionId(rs.getInt("transaction_id"));
                tx.setUserId(rs.getInt("user_id"));
                tx.setBookId(rs.getInt("book_id"));
                tx.setBorrowDate(rs.getDate("borrow_date"));
                tx.setDueDate(rs.getDate("due_date"));
                tx.setReturnDate(rs.getDate("return_date"));
                tx.setStatus(rs.getString("status"));

                list.add(tx);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // User-specific transaction history
    public List<Transaction> getUserHistory(int userId) {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT * FROM transactions WHERE user_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Transaction tx = new Transaction();
                tx.setTransactionId(rs.getInt("transaction_id"));
                tx.setUserId(rs.getInt("user_id"));
                tx.setBookId(rs.getInt("book_id"));
                tx.setBorrowDate(rs.getDate("borrow_date"));
                tx.setDueDate(rs.getDate("due_date"));
                tx.setReturnDate(rs.getDate("return_date"));
                tx.setStatus(rs.getString("status"));

                list.add(tx);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
