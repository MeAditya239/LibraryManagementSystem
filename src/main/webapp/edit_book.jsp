<%@ page import="com.lms.model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Book book = (Book) request.getAttribute("book");
%>
<html>
<head>
    <title>Edit Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">

                <h2 class="text-center text-warning mb-4">Edit Book</h2>

                <form action="editBook" method="post" class="border p-4 bg-white shadow-sm rounded">
                    <input type="hidden" name="bookId" value="<%= book.getBookId() %>"/>

                    <div class="mb-3">
                        <label class="form-label">Title</label>
                        <input type="text" name="title" value="<%= book.getTitle() %>" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Author</label>
                        <input type="text" name="author" value="<%= book.getAuthor() %>" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">ISBN</label>
                        <input type="text" name="isbn" value="<%= book.getIsbn() %>" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Year</label>
                        <input type="number" name="year" value="<%= book.getPublicationYear() %>" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Quantity</label>
                        <input type="number" name="quantity" value="<%= book.getQuantity() %>" class="form-control" required>
                    </div>

                    <button type="submit" class="btn btn-warning w-100">Update Book</button>
                </form>

                <p class="mt-3 text-center">
                    <a href="browseBooks" class="btn btn-secondary">Back to Book List</a>
                </p>

            </div>
        </div>
    </div>
</body>
</html>
