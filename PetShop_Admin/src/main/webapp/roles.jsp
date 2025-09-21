<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.petshop.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<User> users = (List<User>) request.getAttribute("users");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Vai trò & Quyền</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <h3>Quản lý Vai trò & Quyền</h3>

    <!-- 🔙 Nút quay lại -->
    <a href="index.jsp" class="btn btn-secondary mb-3">⬅ Quay lại Trang chủ</a>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Tên đăng nhập</th>
                <th>Vai trò</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
        <% if (users != null) {
            for (User u : users) { %>
                <tr>
                    <td><%= u.getUsername() %></td>
                    <td><%= u.getRole() %></td>
                    <td>
                        <form action="roles" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="username" value="<%= u.getUsername() %>">
                            <button type="submit" class="btn btn-sm btn-danger">Xóa</button>
                        </form>
                    </td>
                </tr>
        <%  } } %>
        </tbody>
    </table>

    <h5>Thêm người dùng mới</h5>
    <form action="roles" method="post" class="row g-2">
        <input type="hidden" name="action" value="add">
        <div class="col-md-3">
            <input type="text" name="username" placeholder="Tên đăng nhập" class="form-control" required>
        </div>
        <div class="col-md-3">
            <input type="password" name="password" placeholder="Mật khẩu" class="form-control" required>
        </div>
        <div class="col-md-3">
            <select name="role" class="form-select">
                <option value="ADMIN">ADMIN</option>
                <option value="MANAGER">MANAGER</option>
            </select>
        </div>
        <div class="col-md-3">
            <button type="submit" class="btn btn-success">Thêm</button>
        </div>
    </form>
</body>
</html>
