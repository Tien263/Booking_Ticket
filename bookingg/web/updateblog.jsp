<%-- 
    Document   : updateblog
    Created on : Feb 21, 2025, 4:46:00 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Update Blog</h2>

        <form action="updateblog" method="POST"enctype="multipart/form-data" >
            <input type="hidden" name="id" value="${requestScope.b.getId()}"/>
            <c:if test="${not empty errorMessage}">
                <div style="color: red; font-weight: bold;">
                    ${errorMessage}
                </div>
            </c:if>
            <div>
                <label for="title">Tieeu dde</label>
                <input type="text" id="title" name="title" value="${requestScope.b.title}" required>
            </div>

            <div>
                <label for="brief">mô tả ngắn</label>
                <input type="text" id="brief" name="brief" value="${requestScope.b.brief}" required>
            </div>

            <div>
                <label for="content">nội dung</label>
                <textarea id="content" name="content" required>${requestScope.b.content}</textarea>
            </div>

            <div>
                <label for="image">Hình ảnh</label>
                <input type="file" id="image" name="image" accept="image/*">
                <c:if test="${not empty requestScope.b.image}">
                    <img src="${requestScope.b.image}" alt="Hình ảnh hiện tại" width="100">
                    <input type="hidden" name="currentImage" value="${requestScope.b.image}">
                </c:if>
            </div>


            <div>
                <label>Người cập nhật:</label>
                <input type="text" value="${sessionScope.user.name}" readonly>
                <input type="hidden" name="updatedby" value="${sessionScope.user.name}">
            </div>

            <div>
                <label for="status">Status</label>
                <select id="status" name="status">
                    <option value="Active" ${requestScope.b.status == 'Active' ? 'selected' : ''}>Active</option>
                    <option value="Inactive" ${requestScope.b.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary w-100">Save</button>
        </form>
    </body>
</html>
