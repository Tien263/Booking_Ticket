
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Blog</title>
    </head>
    <body>
        <h2>Update Blog</h2>

        <form action="updateblog" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${requestScope.b.getId()}"/>

            <c:if test="${not empty errorMessage}">
                <div style="color: red; font-weight: bold;">
                    ${errorMessage}
                </div>
            </c:if>

            <div>
                <label for="title">Tiêu đề:</label>
                <input type="text" id="title" name="title" value="${requestScope.b.title}" required>
            </div>

            <div>
                <label for="brief">Mô tả ngắn:</label>
                <input type="text" id="brief" name="brief" value="${requestScope.b.brief}" required>
            </div>

            <div>
                <label for="content">Nội dung:</label>
                <textarea id="content" name="content" required>${requestScope.b.content}</textarea>
            </div>

            <div>
                <label for="image">Hình ảnh:</label>
                <input type="file" id="image" name="image" accept="image/*"><br><br>

                <c:if test="${not empty requestScope.b.image}">
                    <img id="previewImage" src="${requestScope.b.image}" alt="Ảnh hiện tại" width="300">
                    <input type="hidden" name="currentImage" value="${requestScope.b.image}">
                </c:if>
            </div>


<!--            <div>
                <label for="status">Trạng thái:</label>
                <select id="status" name="status">
                    <option value="Active" ${requestScope.b.status == 'Active' ? 'selected' : ''}>Active</option>
                    <option value="Inactive" ${requestScope.b.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                </select>
            </div>-->

            <button type="submit">Lưu</button>
        </form>
        <script>
            document.getElementById('image').addEventListener('change', function (event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById('previewImage').src = e.target.result;
                    };
                    reader.readAsDataURL(file);
                }
            });
        </script>
    </body>
</html>
