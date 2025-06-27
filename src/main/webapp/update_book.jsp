<%@ page import="com.lms.model.Book" %>
<%@ page import="com.lms.dao.BookDAO" %>
<%@ page import="com.lms.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equals("librarian")) {
        response.sendRedirect("login.jsp");
        return;
    }

    int bookId = Integer.parseInt(request.getParameter("id"));
    BookDAO dao = new BookDAO();
    Book book = dao.getBookById(bookId);
%>

<html>
<head>
    <title>Update Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">

            <h2 class="text-center text-info mb-4">Update Book Details</h2>

            <form action="updateBook" method="post" class="border p-4 bg-white shadow-sm rounded">
                <input type="hidden" name="bookId" value="<%= book.getBookId() %>"/>

                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" name="title" class="form-control" value="<%= book.getTitle() %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Author</label>
                    <input type="text" name="author" class="form-control" value="<%= book.getAuthor() %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">ISBN</label>
                    <input type="text" name="isbn" class="form-control" value="<%= book.getIsbn() %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Publication Year</label>
                    <input type="number" name="year" class="form-control" value="<%= book.getPublicationYear() %>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Quantity</label>
                    <input type="number" name="quantity" class="form-control" value="<%= book.getQuantity() %>" required>
                </div>

                <button type="submit" class="btn btn-info w-100">Update Book</button>
            </form>

            <p class="mt-3 text-center">
                <a href="browseBooks" class="btn btn-secondary">Back to Book List</a>
            </p>

        </div>
    </div>
</div>
</body>
</html>
