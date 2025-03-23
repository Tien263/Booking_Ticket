<%-- 
    Document   : search
    Created on : Mar 17, 2025, 3:14:57 PM
    Author     : Nguyen Minh Duc
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Hệ thống gợi ý câu hỏi</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                text-align: center;
                margin: 0;
                padding: 0;
            }
            #container {
                width: 50%;
                margin: 40px auto;
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h2 {
                color: #333;
            }
            form {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin-bottom: 20px;
            }
            input[type="text"] {
                width: 70%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            button {
                padding: 10px 15px;
                background-color: #28a745;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            button:hover {
                background-color: #218838;
            }
            .box {
                text-align: left;
                background: #fff;
                padding: 15px;
                border-radius: 5px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
                margin-top: 20px;
            }
            ul {
                list-style-type: none;
                padding: 0;
            }
            li {
                padding: 8px;
                border-bottom: 1px solid #ddd;
            }
            li:last-child {
                border-bottom: none;
            }
            a {
                text-decoration: none;
                color: #007bff;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div id="container">
            <h2>Hướng dẫn cách thức sử dụng trang WEB</h2>

            <form action="SearchServlet" method="post">
                <input type="text" name="question" id="question" placeholder="Nhập câu hỏi của bạn..." required>
                <button type="submit">Tìm kiếm</button>
            </form>

            <!-- Hiển thị kết quả trả lời -->
            <div id="result" class="box">
                <h3>Câu hỏi:</h3>
                <p>${not empty bestQuestion ? bestQuestion : "Không có câu hỏi nào."}</p>
                <h3>Trả lời:</h3>
                <p>${not empty bestAnswer ? bestAnswer : "Không có câu trả lời."}</p>
            </div>

            <!-- Hiển thị danh sách câu hỏi gợi ý -->
            <div id="suggestions" class="box">
                <h3>Các câu hỏi thường gặp:</h3>
                <ul>
                    <c:choose>
                        <c:when test="${not empty suggestedQuestions}">
                            <c:forEach var="q" items="${suggestedQuestions}" begin="0" end="4">
                                                       <li>
    <a href="SearchServlet?selectedQuestion=${q}" value = '${q}';">
        ${q}
    </a>
</li>
             </c:forEach>
             </c:when>
             <c:otherwise>
                            <li>Không có câu hỏi gợi ý.</li>
                            </c:otherwise>
                        </c:choose>
                </ul>
            </div>

            <!-- Hiển thị lịch sử câu hỏi và câu trả lời -->
            <div id="history" class="box">
                <h3>Lịch sử tìm kiếm:</h3>
                <ul>
                    <c:choose>
                        <c:when test="${not empty history}">
                            <c:forEach var="entry" items="${history}">
                                <li><b>Câu hỏi:</b> ${entry[0]} <br> <b>Trả lời:</b> ${entry[1]}</li>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                            <li>Chưa có lịch sử tìm kiếm.</li>
                            </c:otherwise>
                        </c:choose>
                </ul>
            </div>
        </div>
    </body>
</html>
