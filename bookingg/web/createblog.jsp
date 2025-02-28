<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Employee, model.User, java.util.Date" %>

<%
    // Lấy thông tin Employee từ session
    Employee user = (Employee) session.getAttribute("user");

    // Nếu không có user, chuyển hướng về trang login
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Đăng bài Blog</title>
    </head>
    <body>
        <h2>Viết bài Blog</h2>
        <form action="createblog" method="post" enctype="multipart/form-data">
            <label>Tiêu đề:</label><br>
            <input type="text" name="title" required><br><br>

            <label>Tóm tắt:</label><br>
            <textarea name="brief" required></textarea><br><br>

            <label>Nội dung:</label><br>
            <textarea name="content" required></textarea><br><br>

            <label>Hình ảnh:</label><br>
            <input type="file" name="image" accept="image/*"><br><br>

            <p><b>Người đăng:</b> <%= user != null ? user.getName() : "Không xác định" %></p>
            <p><b>Thời gian hiện tại:</b> <%= new Date() %></p>

            <button type="submit">Đăng bài</button>
        </form>
        <br>
        <a href="listblog">Xem danh sách bài viết</a>
    </body>
</html>
