<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
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
                    <th>Người tạo</th>
                    <th>Người cập nhật</th>
                    <th>Ngày tạo</th>
                    <th>Ngày cập nhật</th>
                    <th>Ảnh</th>
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
                                <td>${b.getCreatedby().getName()}</td>
                                <td>${b.getCreatedby().getName()}</td>
                                <td>${b.getCreatedtime()}</td>
                                <td>${b.getUpdatedtime()}</td>
<!--                                <td>${b.getImage()}</td>-->
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty b.getImage()}">
                                            <img src="${pageContext.request.contextPath}/assets/images/blog/${b.getImage()}" width="100" height="100" alt="Blog Image"/>
                                        </c:when>
                                        <c:otherwise>
                                            Không có ảnh
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="updateblog?id=${b.getId()}">Chỉnh sửa</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="8">Không có blog nào.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </body>
</html>
