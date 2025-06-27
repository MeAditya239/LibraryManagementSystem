<%@ page import="java.util.List" %>
<%@ page import="com.lms.model.Transaction" %>
<%@ page import="com.lms.dao.TransactionDAO" %>
<%@ page import="com.lms.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equals("user")) {
        response.sendRedirect("login.jsp");
        return;
    }

    TransactionDAO dao = new TransactionDAO();
    List<Transaction> borrowed = dao.getBorrowedBooksByUser(user.getUserId());
%>

<html>
<head>
    <title>Return Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="text-center text-primary mb-4">Your Borrowed Books</h2>

        <table class="table table-bordered table-hover bg-white shadow-sm">
            <thead class="table-secondary">
                <tr>
                    <th>Transaction ID</th>
                    <th>Book ID</th>
                    <th>Borrow Date</th>
                    <th>Due Date</th>
                    <th>Return</th>
                </tr>
            </thead>
            <tbody>
                <% for (Transaction tx : borrowed) { %>
                <tr>
                    <td><%= tx.getTransactionId() %></td>
                    <td><%= tx.getBookId() %></td>
                    <td><%= tx.getBorrowDate() %></td>
                    <td><%= tx.getDueDate() %></td>
                    <td>
                        <a href="returnBook?id=<%= tx.getTransactionId() %>" class="btn btn-sm btn-warning">Return</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <div class="text-center mt-4">
            <a href="user_dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
