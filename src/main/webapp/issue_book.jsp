<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.lms.model.Book" %>
<%@ page import="com.lms.dao.BookDAO" %>
<%@ page import="com.lms.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equals("user")) {
        response.sendRedirect("login.jsp");
        return;
    }

    BookDAO dao = new BookDAO();
    List<Book> books = dao.getAllBooks();
%>
<html>
<head>
    <title>Request Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">

                <h2 class="text-center text-primary mb-4">Request to Borrow a Book</h2>

                <form action="issueBook" method="post" class="border p-4 bg-white shadow-sm rounded">
                    <div class="mb-3">
                        <label class="form-label">Select Book</label>
                        <select name="bookId" class="form-select" required>
                            <% for (Book b : books) { %>
                                <option value="<%= b.getBookId() %>"><%= b.getTitle() %> by <%= b.getAuthor() %></option>
                            <% } %>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-success w-100">Request Book</button>
                </form>

                <p class="mt-3 text-center">
                    <a href="user_dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
                </p>

            </div>
        </div>
    </div>
</body>
</html>
