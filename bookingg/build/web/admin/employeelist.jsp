<%-- 
    Document   : emplist
    Created on : Mar 24, 2025, 7:49:31 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee List</title>
    </head>
    <body>
        <h1>Employee List</h1>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Employee Name</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Role</th>
                    <th>Phone</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${emps}" var="e">
                    <tr>
                        <td>${e.id}</td>
                        <td>${e.name}</td>
                        <td>
                            <c:choose>
                                <c:when test="${e.gender}">
                                    Male
                                </c:when>
                                <c:otherwise>
                                    Female
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${e.address}</td>
                        <td>${e.role.name}</td>
                        <td>
                            <a href="update?id=${e.id}" class="btn btn-primary btn-sm">
                                <i class="fas fa-pencil-alt"></i> <!-- Biểu tượng Edit -->
                            </a>

                            <button type="button" class="btn btn-danger btn-sm" onclick="removeEmployee(${e.id})">
                                <i class="fas fa-trash-alt"></i> <!-- Biểu tượng Remove -->
                            </button>

                            <form id="removeEmployee${e.id}" action="delete" method="POST" style="display:none;">
                                <input type="hidden" name="id" value="${e.id}"/>
                            </form>
                        </td>
                        <td>${e.phone}</td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>


    </body>
</html>
