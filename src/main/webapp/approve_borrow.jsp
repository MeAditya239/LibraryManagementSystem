<%@ page import="java.util.List" %>
<%@ page import="com.lms.model.Transaction" %>
<%@ page import="com.lms.dao.TransactionDAO" %>
<%@ page import="com.lms.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equals("librarian")) {
        response.sendRedirect("login.jsp");
        return;
    }

    TransactionDAO dao = new TransactionDAO();
    List<Transaction> list = dao.getPendingTransactions();
%>
<html>
<head>
    <title>Approve Borrow Requests</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="text-center text-primary mb-4">Pending Borrow Requests</h2>

        <table class="table table-bordered table-hover bg-white shadow-sm">
            <thead class="table-secondary">
                <tr>
                    <th>Transaction ID</th>
                    <th>User ID</th>
                    <th>Book ID</th>
                    <th>Borrow Date</th>
                    <th>Due Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (Transaction tx : list) { %>
                <tr>
                    <td><%= tx.getTransactionId() %></td>
                    <td><%= tx.getUserId() %></td>
                    <td><%= tx.getBookId() %></td>
                    <td><%= tx.getBorrowDate() %></td>
                    <td><%= tx.getDueDate() %></td>
                    <td><%= tx.getStatus() %></td>
                    <td>
                        <a href="approveBorrow?id=<%= tx.getTransactionId() %>&status=approved" class="btn btn-sm btn-success">Approve</a>
                        <a href="approveBorrow?id=<%= tx.getTransactionId() %>&status=rejected" class="btn btn-sm btn-danger">Reject</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <div class="text-center mt-4">
            <a href="admin_dashboard.jsp" class="btn btn-secondary"> Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
