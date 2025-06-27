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
    <title>Add Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">

                <h2 class="text-center text-primary mb-4">Add New Book</h2>

                <form action="addBook" method="post" class="border p-4 bg-white shadow-sm rounded">

                    <div class="mb-3">
                        <label class="form-label">Title</label>
                        <input type="text" name="title" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Author</label>
                        <input type="text" name="author" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">ISBN</label>
                        <input type="text" name="isbn" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Publication Year</label>
                        <input type="number" name="year" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Quantity</label>
                        <input type="number" name="quantity" class="form-control" required>
                    </div>

                    <button type="submit" class="btn btn-success w-100">Add Book</button>
                </form>

                <p class="mt-3 text-center">
                    <a href="admin_dashboard.jsp">Back to Dashboard</a>
                </p>

            </div>
        </div>
    </div>
</body>
</html>
