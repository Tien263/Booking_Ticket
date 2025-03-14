<%-- 
    Document   : terms
    Created on : Feb 23, 2025, 12:20:51 AM
    Author     : Quang Anh
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>




<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Điều khoản sử dụng</title>
        <style>
            /* Header */
            .header {
                background: linear-gradient(90deg, #ff5722, #ff8a50);
                padding: 15px 0;
                text-align: center;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                color: #fff;
            }

            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                color: #333;
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f9f9f9;
            }

            h1 {
                text-align: center;
                color: #FF4D00;
                font-size: 36px;
                font-weight: bold;
                margin-bottom: 20px;
                text-transform: uppercase;
            }

            h3 {
                color: #000;
                font-size: 24px;
                font-weight: bold;
                margin-top: 30px;
            }

            p {
                text-align: justify;
                line-height: 1.8;
                font-size: 16px;
                margin-bottom: 20px;
            }

            a {
                color: #FF4D00;
                text-decoration: none;
                margin-right: 15px;
            }

            a:hover {
                text-decoration: underline;
            }

            .actions {
                margin-bottom: 30px;
            }

            .add-term {
                display: inline-block;
                background-color: #FF4D00;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
                font-weight: bold;
            }

            .add-term:hover {
                background-color: #e64500;
            }
            /* Footer */
            footer {
                background-color: #fff;
                color: #FF4D00;
                text-align: center;
                padding: 30px 0;
                width: 100%;
                box-sizing: border-box;
                border-top: 3px solid #FF4D00;
            }

            .footer-top {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 20px;
                text-align: center;
            }

            .footer-top h3 {
                color: #FF4D00;
                margin-bottom: 10px;
                font-size: 24px;
            }

            .footer-top p {
                color: #444;
                line-height: 1.6;
                font-size: 14px;
            }

            .footer-top a {
                color: #FF4D00;
                text-decoration: none;
                font-weight: bold;
            }

            .footer-top a:hover {
                color: #333;
            }

            .footer-bottom {
                background-color: #FF4D00;
                color: #fff;
                text-align: center;
                padding: 15px;
                width: 100%;
                box-sizing: border-box;
                border-top: 1px solid #FFA500;
            }

            .footer-bottom p {
                margin: 0;
                font-size: 13px;
                color: #fff;
            }
            .footer-top {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                flex-wrap: wrap;
            }

            .footer-top {
                position: relative;
                padding-bottom: 50px;
            }

            .footer-button {
                position: fixed;
                bottom: 20px;
                right: 20px;
                z-index: 999;
            }



            .home-button {
                display: inline-block;
                background-color: #FF4D00;
                color: white;
                padding: 10px 20px;
                border-radius: 25px;
                text-decoration: none;
                font-weight: bold;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                transition: all 0.3s ease;
            }

            .home-button:hover {
                background-color: #E04300;
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
                transform: translateY(-2px);
            }






        </style>
        <%List<String> role = (List<String>) session.getAttribute("roles");%>
    </head>
    <body>
        <header class="header">
            <h1>Nhà xe khách Quang Anh</h1>
        </header>


        <h1>Điều khoản sử dụng</h1>

        <c:forEach var="term" items="${terms}">
            <h3>${term.title}</h3>
            <p>${term.content}</p>

            <c:if test="${not empty roles}">
                <div class="actions">
                    <a href="terms?action=edit&id=${term.id}">Sửa</a>
                    <a href="terms?action=delete&id=${term.id}" 
                       onclick="return confirm('Xác nhận xóa?');">Xóa</a>
                </div>
            </c:if>
        </c:forEach>

        <c:if test="${not empty roles}">
            <a href="terms?action=add" class="add-term">Thêm điều khoản</a>
        </c:if>

        <footer>
            <div class="footer-top">
                <div>
                    <h3>TRUNG TÂM TỔNG ĐÀI & CSKH</h3>
                    <p>1900 1100</p>
                    <p>CÔNG TY CỔ PHẦN XE KHÁCH Quang Anh - QA BUS LINES</p>
                    <p>Địa chỉ: Thành phố Lào Cai, Tỉnh Lào Cai, Việt Nam.</p>
                    <p>Điện thoại: 02838386852 | Fax: 02838386853</p>
                </div>
            </div>
            <div class="footer-button">
                <a href="car.html" class="home-button">Trở lại trang chủ</a>
            </div>
            <div class="footer-bottom">
                <p>© 2025 | Bản quyền thuộc về Công ty Cổ Phần Xe Khách Quang Anh - QA Bus Lines</p>
            </div>
        </footer>


    </body>
</html>


