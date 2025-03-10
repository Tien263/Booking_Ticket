<%-- 
    Document   : contact-list
    Created on : Feb 22, 2025, 11:09:39 PM
    Author     : Quang Anh
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Danh sách liên hệ</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                color: #333;
                margin: 0;
                padding: 0;
            }

            h2 {
                text-align: center;
                color: #333;
                margin-top: 20px;
                font-size: 2em;
            }

            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                background-color: #fff;
                border-radius: 8px;
                overflow: hidden;
            }

            table thead {
                background-color: #4CAF50;
                color: white;
            }

            table th,
            table td {
                padding: 15px;
                text-align: left;
            }

            table th {
                font-weight: bold;
                text-transform: uppercase;
            }

            table tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            table tr:hover {
                background-color: #e1f5e6;
                transition: background-color 0.3s;
            }

            table td {
                border-bottom: 1px solid #ddd;
            }

            table td:last-child {
                font-style: italic;
                color: #666;
            }

            table tbody tr:last-child td {
                border-bottom: none;
            }
        </style>
    </head>
    <body>
        <h2 style="text-align:center;">Danh sách liên hệ</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Họ và Tên</th>
                    <th>Email</th>
                    <th>Nội dung</th>
                    <th>Ngày gửi</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="contact" items="${contactList}">
                    <tr>
                        <td data-label="ID">${contact.contactId}</td>
                        <td data-label="Họ và Tên">${contact.name}</td>
                        <td data-label="Email">${contact.email}</td>
                        <td data-label="Nội dung">${contact.message}</td>
                        <td data-label="Ngày gửi">${contact.createdAt}</td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>
    </body>
</html>

