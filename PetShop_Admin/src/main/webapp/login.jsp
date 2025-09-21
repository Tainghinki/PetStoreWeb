<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - PetShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Segoe UI', sans-serif;
        }
        .login-box {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 350px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="login-box">
    <h3 class="mb-3">🔐 Đăng nhập</h3>
    <form method="post" action="login">
        <div class="mb-3">
            <input type="text" class="form-control" name="username" placeholder="Tên đăng nhập" required>
        </div>
        <div class="mb-3">
            <input type="password" class="form-control" name="password" placeholder="Mật khẩu" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
    </form>
    <p class="text-danger mt-3">
        ${error}
    </p>
</div>
</body>
</html>
