<%@ page import="java.util.List" %>
<%@ page import="com.lms.model.Book" %>
<%@ page import="com.lms.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Book> books = (List<Book>) request.getAttribute("bookList");
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    boolean isUser = "user".equals(user.getRole());
    boolean isAdmin = "librarian".equals(user.getRole());
%>

<html>
<head>
    <title>All Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">

    <h2 class="text-center text-primary mb-4">All Books</h2>

    <% if ("true".equals(request.getParameter("success"))) { %>
        <div class="alert alert-success text-center">Book request submitted successfully!</div>
    <% } else if ("edit".equals(request.getParameter("success"))) { %>
        <div class="alert alert-success text-center">Book updated successfully!</div>
    <% } else if ("deleted".equals(request.getParameter("success"))) { %>
        <div class="alert alert-success text-center">Book deleted successfully!</div>
    <% } %>

    <p><strong>Total Books:</strong> <%= (books != null ? books.size() : "0") %></p>

    <table class="table table-bordered table-hover bg-white shadow-sm">
        <thead class="table-secondary">
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>ISBN</th>
                <th>Year</th>
                <th>Quantity</th>
                <% if (isUser) { %><th>Action</th><% } %>
                <% if (isAdmin) { %><th>Actions</th><% } %>
            </tr>
        </thead>
        <tbody>
        <%
            if (books != null) {
                for (Book book : books) {
        %>
            <tr>
                <td><%= book.getTitle() %></td>
                <td><%= book.getAuthor() %></td>
                <td><%= book.getIsbn() %></td>
                <td><%= book.getPublicationYear() %></td>
                <td><%= book.getQuantity() %></td>

                <% if (isUser) { %>
                <td>
                    <% if (book.getQuantity() > 0) { %>
                        <form action="issueBook" method="post" style="margin:0;">
                            <input type="hidden" name="bookId" value="<%= book.getBookId() %>">
                            <button type="submit" class="btn btn-sm btn-success">Issue</button>
                        </form>
                    <% } else { %>
                        <span class="text-danger">Not Available</span>
                    <% } %>
                </td>
                <% } %>

                <% if (isAdmin) { %>
                <td>
                    <a href="editBook?bookId=<%= book.getBookId() %>" class="btn btn-sm btn-primary">Edit</a>
                    <a href="deleteBook?bookId=<%= book.getBookId() %>"
                       onclick="return confirm('Are you sure you want to delete this book?');"
                       class="btn btn-sm btn-danger">Delete</a>
                </td>
                <% } %>
            </tr>
        <%
                }
            } else {
        %>
            <tr><td colspan="7" class="text-center">No books available.</td></tr>
        <%
            }
        %>
        </tbody>
    </table>

    <div class="text-center mt-4">
        <a href="<%= isUser ? "user_dashboard.jsp" : "admin_dashboard.jsp" %>" class="btn btn-secondary">Back to Dashboard</a>
    </div>

</div>
</body>
</html>
