<%@ page import="com.lms.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equals("user")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow-sm">
            <div class="card-body">
                <h2 class="text-center text-success mb-4">Welcome, <%= user.getUsername() %></h2>

                <div class="list-group">
                    <a href="browseBooks" class="list-group-item list-group-item-action">Browse Books</a>
                    <a href="return_book.jsp" class="list-group-item list-group-item-action">Return Book</a>
                    <a href="user_history.jsp" class="list-group-item list-group-item-action">View Borrowing History</a>
                    <a href="user_requests.jsp" class="list-group-item list-group-item-action"> My Book Requests</a>
                    <a href="logout" class="list-group-item list-group-item-action text-danger"> Logout</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
