<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang = "en">

    <script>
        function removeBlog(id) {
            var result = confirm("Are you sure you want to delete blog?");
            if (result) {
                document.getElementById("removeBlog" + id).submit();
            }
        }
    </script>

    <head>
        <meta charset="UTF-8">
        <title>Danh sách Blog</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <h2>Danh sách Blog</h2>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tiêu đề</th>
                    <th>Mô tả ngắn</th>
                    <th>Nội dung</th>
                    <th>Ngày tạo</th>
                    <th>Ngày cập nhật</th>
                    <th>Ảnh</th>
                    
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty blog}">
                        <c:forEach var="b" items="${blog}">
                            <tr>
                                <td>${b.getId()}</td>
                                <td>${b.getTitle()}</td>
                                <td>${b.getBrief()}</td>
                                <td>${b.getContent()}</td>
                                <td>${b.getCreatedtime()}</td>
                                <td>${b.getUpdatedtime()}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty b.getImage()}">
                                            <img src="${b.getImage()}" width="100" height="100" alt="Blog Image"/>
                                        </c:when>
                                        <c:otherwise>
                                            Không có ảnh
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                
                                <td>
                                    <a href="updateblog?id=${b.getId()}">Chỉnh sửa</a>
                                    <button type="button" class="btn btn-danger btn-sm" onclick="removeBlog(${b.id})">
                                        <i class="fas fa-trash-alt"></i> <!-- Biểu tượng Remove -->
                                    </button>
                                </td>
                        <form id="removeBlog${b.id}" action="deleteblog" method="POST" style="display:none;">
                            <input type="hidden" name="id" value="${b.id}"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="10">Không có blog nào.</td>
            </tr>
        </c:otherwise>
    </c:choose>
</tbody>
</table>
</body>
</html>
