<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.User, java.util.Date" %>

<%
    // Lấy User từ session thay vì Employee
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("employee_login.jsp");
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
        <input type="file" name="image" accept="image/*" id="fileInput"><br><br>

        <img id="previewImage" src="" alt="Ảnh xem trước" style="max-width: 300px; display: none;"><br><br>

        <p><b>Người đăng:</b> <%= user.getUsername() %></p>
        <p><b>Thời gian hiện tại:</b> <%= new Date() %></p>

        <button type="submit">Đăng bài</button>
    </form>

    <script>
        document.getElementById('fileInput').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('previewImage').src = e.target.result;
                    document.getElementById('previewImage').style.display = 'block';
                };
                reader.readAsDataURL(file);
            }
        });
    </script>

    <br>
    <a href="listblog">Xem danh sách bài viết</a>
</body>
</html>
