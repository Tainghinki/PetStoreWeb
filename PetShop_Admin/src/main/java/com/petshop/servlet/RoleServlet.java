package com.petshop.servlet;

import java.io.IOException;
import java.util.List;

import com.petshop.dao.UserDAO;
import com.petshop.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RoleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;

        // ✅ Nếu chưa đăng nhập thì quay lại login
        if (currentUser == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        // ✅ Chỉ ADMIN mới được vào trang roles
        if (!"ADMIN".equalsIgnoreCase(currentUser.getRole())) {
            req.setAttribute("error", "⚠️ Truy cập bị từ chối. Bạn không đủ quyền để vào trang này.");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
            return;
        }

        // ✅ Lấy danh sách user để hiển thị
        List<User> users = UserDAO.getUsers();
        req.setAttribute("users", users);

        // ✅ Chuyển sang roles.jsp
        req.getRequestDispatcher("roles.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String role = req.getParameter("role");
            UserDAO.addUser(username, password, role);
        } else if ("delete".equals(action)) {
            String username = req.getParameter("username");
            UserDAO.deleteUser(username);
        }

        // ✅ Sau khi xử lý thì load lại trang roles
        resp.sendRedirect("roles");
    }
}
