<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>All Promotions</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>All Promotions</h1>

        <!-- Promotions By Date -->
        <h2>Promotions By Date</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Discount (%)</th>
                    <th>Quantity</th>
                    <th>Employee ID</th>
                    <th>Priority</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="promo" items="${datePromotions}">
                    <tr>
                        <td>${promo.id}</td>
                        <td>${promo.name}</td>
                        <td>${promo.startDate}</td>
                        <td>${promo.endDate}</td>
                        <td>${promo.discount}</td>
                        <td>${promo.quantity}</td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.eId != null}">${promo.eId}</c:when>
                                <c:otherwise>N/A</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.priority != null}">${promo.priority}</c:when>
                                <c:otherwise>N/A</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Promotions By Code -->
        <h2>Promotions By Code</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Code</th>
                    <th>Discount (%)</th>
                    <th>End Date</th>
                    <th>Quantity</th>
                    <th>Advertisement ID</th>
                    <th>Employee ID</th>
                    <th>Priority</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="promo" items="${codePromotions}">
                    <tr>
                        <td>${promo.id}</td>
                        <td>${promo.name}</td>
                        <td>${promo.code}</td>
                        <td>${promo.discount}</td>
                        <td>${promo.endDate}</td>
                        <td>${promo.quantity}</td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.aId != null}">${promo.aId}</c:when>
                                <c:otherwise>N/A</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.eId != null}">${promo.eId}</c:when>
                                <c:otherwise>N/A</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.priority != null}">${promo.priority}</c:when>
                                <c:otherwise>N/A</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Promotions By Passengers -->
        <h2>Promotions By Passengers</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Discount (%)</th>
                    <th>Min Tickets</th>
                    <th>Min Points</th>
                    <th>Employee ID</th>
                    <th>Priority</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="promo" items="${passengerPromotions}">
                    <tr>
                        <td>${promo.id}</td>
                        <td>${promo.name}</td>
                        <td>${promo.discount}</td>
                        <td>${promo.minTickets}</td>
                        <td>${promo.minPoints}</td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.eId != null}">${promo.eId}</c:when>
                                <c:otherwise>N/A</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.priority != null}">${promo.priority}</c:when>
                                <c:otherwise>N/A</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>