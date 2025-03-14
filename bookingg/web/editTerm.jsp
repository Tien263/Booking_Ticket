<%-- 
    Document   : editTerm
    Created on : Feb 23, 2025, 9:59:57 AM
    Author     : Quang Anh
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f5f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
        }

        h1 {
            text-align: center;
            font-size: 24px;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }

        input[type="text"],
        textarea {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        button {
            background-color: #ff6f00;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #e65c00;
        }

    </style>
</head>
<body>
    <div class="container">
        <h1>
            <c:choose>
                <c:when test="${not empty term.id}">Chỉnh sửa điều khoản</c:when>
                <c:otherwise>Thêm điều khoản mới</c:otherwise>
            </c:choose>
        </h1>
       
        <form method="post" action="terms">
            <input type="hidden" name="action" value="${term.id != null ? 'edit' : 'add'}">
            <input type="hidden" name="id" value="${term != null && term.id != null ? term.id : ''}">        
            <label>Tiêu đề:</label>
            <input type="text" name="title" value="${term.title}" required>

            <label>Nội dung:</label>
            <textarea name="content" required>${term.content}</textarea>

            <button type="submit">Lưu</button>
        </form>
    </div>
</body>
</html>


