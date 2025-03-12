

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    
<head>
    <title>Lịch Sử Giao Dịch</title>
</head>
<body>
    <h1>Lịch Sử Giao Dịch</h1>
    <table border="1">
        <tr>
            <th>ID Khách Hàng</th>
            <th>Họ Tên</th>
            <th>Email</th>
            <th>ID Đơn Hàng</th>
            <th>Ngày Đặt</th>
            <th>Trạng Thái</th>
            <th>Tổng Tiền</th>
            <th>Ngày Thanh Toán</th>
            <th>Số Tiền Thanh Toán</th>
            <th>Phương Thức Thanh Toán</th>
            <th>ID Vé</th>
            <th>Trạng Thái Vé</th>
            <th>Thời Gian Khởi Hành</th>
            <th>Thời Gian Đến</th>
            <th>Tổng Hóa Đơn</th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.c_id}</td>
                <td>${user.c_fullname}</td>
                <td>${user.c_email}</td>
                <td>${user.oh_id}</td>
                <td>${user.oh_date}</td>
                <td>${user.oh_status}</td>
                <td>${user.oh_totalAmount}</td>
                <td>${user.p1_date}</td>
                <td>${user.p1_amount}</td>
                <td>${user.pm_name}</td>
                <td>${user.t_id}</td>
                <td>${user.t_status}</td>
                <td>${user.bt1_departureTime}</td>
                <td>${user.bt1_arrivalTime}</td>
                <td>${user.i_totalPrice}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
