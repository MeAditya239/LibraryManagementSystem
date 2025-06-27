<%@ page import="com.lms.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equals("librarian")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow-sm">
            <div class="card-body">
                <h2 class="text-center text-primary mb-4">Welcome, Admin <%= user.getUsername() %></h2>

                <div class="list-group">
                    <a href="browseBooks" class="list-group-item list-group-item-action">Browse Books</a>
                    <a href="add_book.jsp" class="list-group-item list-group-item-action">Add Book</a>
                    <a href="admin_transactions.jsp" class="list-group-item list-group-item-action">View All Transactions</a>
                    <a href="admin_approve_requests.jsp" class="list-group-item list-group-item-action">Approve Book Requests</a>
                    <a href="logout" class="list-group-item list-group-item-action text-danger">Logout</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
