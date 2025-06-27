<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">

                <h2 class="text-center text-primary mb-4">User/Admin Login</h2>

                <form action="login" method="post" class="border p-4 bg-white shadow-sm rounded">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Login</button>
                </form>

                <% if (request.getParameter("error") != null) { %>
                    <div class="alert alert-danger mt-3 text-center">
                        Invalid username or password!
                    </div>
                <% } %>

                <p class="mt-3 text-center">
                    <a href="register.jsp">Don't have an account? Register</a>
                </p>

            </div>
        </div>
    </div>
</body>
</html>
