<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <h2 class="text-center text-success mb-4">User/Admin Registration</h2>

            <form action="register" method="post" class="border p-4 bg-white shadow-sm rounded">

                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <select name="role" class="form-select">
                        <option value="user">User</option>
                        <option value="librarian">Admin</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-success w-100">Register</button>
            </form>

            <% if (request.getParameter("success") != null) { %>
                <div class="alert alert-success mt-3 text-center">
                    Registered Successfully!
                </div>
            <% } else if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger mt-3 text-center">
                    Registration Failed!
                </div>
            <% } %>

            <p class="mt-3 text-center">
                <a href="login.jsp">Already have an account? Login</a>
            </p>

        </div>
    </div>
</div>
</body>
</html>
