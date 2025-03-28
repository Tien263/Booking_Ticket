<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Invoice</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <!-- Thêm thư viện html2canvas -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <style>
        body {
            font-family: 'Noto Sans', Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f1f5f9; /* Màu nền giống trong ảnh */
        }
        #invoice-content {
            max-width: 595px; /* Chiều rộng A4 để vừa PDF */
            margin: auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .header {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #e5e7eb; /* Viền xám nhạt thay vì xanh */
            padding-bottom: 12px;
            margin-bottom: 20px;
        }
        .header img {
            width: 200px;
            height: 100px;
            margin-right: 20px;
        }
        .company-info p {
            margin: 3px 0;
            font-size: 13px;
            line-height: 1.5;
            color: #333;
        }
        .company-info p:first-child {
            font-weight: bold;
            font-size: 15px;
            color: #1f2937;
        }
        .invoice-title {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            margin: 20px 0 8px;
            color: #1f2937;
        }
        .invoice-meta {
            text-align: center;
            margin-bottom: 20px;
        }
        .invoice-meta p {
            font-size: 13px;
            margin: 3px 0;
            color: #4b5563;
        }
        .qr-code {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 80px;
            height: 80px;
        }
        .customer-info p {
            font-size: 13px;
            margin: 4px 0;
            color: #333;
        }
        .customer-info p span {
            font-weight: bold;
            color: #1f2937;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 13px;
        }
        th, td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #e5e7eb; /* Viền xám nhạt thay vì xanh */
        }
        th {
            font-weight: bold;
            background-color: #f9fafb;
            color: #1f2937;
        }
        tr:last-child td {
            border-bottom: none; /* Bỏ viền dưới của hàng cuối */
        }
        .total {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            margin: 20px 0;
        }
        .total p {
            font-size: 13px;
            margin: 4px 0;
            color: #333;
        }
        .total p span {
            font-weight: bold;
            color: #1f2937;
        }
        .export-pdf {
            text-align: center;
            margin: 20px 0;
        }
        .export-pdf button {
            background-color: #3b82f6;
            color: white;
            padding: 8px 20px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-size: 13px;
            transition: background-color 0.3s;
        }
        .export-pdf button:hover {
            background-color: #2563eb;
        }
        .signature {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
            font-size: 13px;
            color: #333;
        }
        .signature div {
            text-align: center;
        }
        .signature p {
            margin: 3px 0;
        }
        .signature .valid {
            background-color: #dcfce7;
            padding: 8px;
            border-radius: 4px;
            margin-top: 8px;
        }
        .signature .valid p:first-child {
            color: #dc2626;
            font-weight: bold;
        }
        .signature .valid p:first-child i {
            color: #16a34a;
            margin-right: 5px;
        }
        .footer {
            text-align: center;
            font-size: 12px;
            margin-top: 20px;
            color: #4b5563;
        }
        .footer p {
            margin: 3px 0;
        }
        .footer a {
            color: #3b82f6;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        /* Ẩn nút Xuất PDF khi chụp ảnh */
        .hide-on-capture {
            display: block;
        }
        .capturing .hide-on-capture {
            display: none;
        }
    </style>
</head>
<body>
    <div id="invoice-content">
        <!-- Logo và thông tin công ty -->
        <div class="header">
            <img alt="BusGo Logo" src="assets/images/logo/logo_hoadon.jpg"/>
            <div class="company-info">
                <p>CÔNG TY CỔ PHẦN XE KHÁCH QUANG ANH</p>
                <p>Mã số thuế: <c:out value="0101243150-104"/></p>
                <p>Địa chỉ: Khu công nghệ cao Hòa Lạc, Thạch Thất, Hà Nội</p>
                <p>Điện thoại: <c:out value="0398 996 178"/></p>
                <p>Số tài khoản: <c:out value="7111 1810 204"/></p>
            </div>
        </div>

        <!-- Tiêu đề hóa đơn -->
        <div class="relative">
            <p class="invoice-title">HÓA ĐƠN ĐẶT VÉ</p>
            <div class="invoice-meta">
                <p>Ngày <fmt:formatDate value="${today}" pattern="dd 'tháng' MM 'năm' yyyy"/></p>
                <p>Ký hiệu: <c:out value="1K22TAB"/></p>
                <p>Số: <c:out value="0000000"/></p>
            </div>
            <!-- Mã QR -->
            <img alt="QR Code" class="qr-code" src="https://storage.googleapis.com/a1aa/image/sc3uGJ8IU2wMKfJzfVDWJQZq5-o46qiLi8RhzgWiCZI.jpg"/>
        </div>

        <!-- Hiển thị thông báo lỗi nếu có -->
        <c:if test="${not empty errorMessage}">
            <div class="mt-6 text-center text-red-500 font-bold">
                <p>${errorMessage}</p>
            </div>
        </c:if>

        <!-- Chỉ hiển thị hóa đơn nếu không có lỗi -->
        <c:if test="${empty errorMessage}">
            <!-- Thông tin khách hàng -->
            <div class="customer-info">
                <p><span>Mã vé:</span> <c:out value="${bookedTickets[0].t_id}"/></p>
                <p><span>Tên khách hàng:</span> <c:out value="${bookedTickets[0].c_fullname != null ? bookedTickets[0].c_fullname : 'N/A'}"/></p>
                <p><span>Số điện thoại:</span> <c:out value="${bookedTickets[0].c_phone != null ? bookedTickets[0].c_phone : 'N/A'}"/></p>
                <p><span>Ngày đặt vé:</span> <c:out value="${bookedTickets[0].bt_bookingDate != null ? bookedTickets[0].bt_bookingDate : 'N/A'}"/></p>
            </div>

            <!-- Bảng thông tin vé -->
            <table>
                <thead>
                    <tr>
                        <th>Mã vé</th>
                        <th>Địa điểm</th>
                        <th>Thời gian</th>
                        <th>Ghế</th>
                        <th>Giá</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ticket" items="${bookedTickets}" varStatus="loop">
                        <c:if test="${loop.count <= 2}">
                            <tr>
                                <td><c:out value="${ticket.t_id}"/></td>
                                <td><c:out value="${ticket.br_adress != null ? ticket.br_adress : 'N/A'}"/></td>
                                <td><c:out value="${ticket.bt1_time != null ? ticket.bt1_time : 'N/A'}"/></td>
                                <td><c:out value="${ticket.s_name != null ? ticket.s_name : 'N/A'}"/></td>
                                <td class="text-right"><fmt:formatNumber value="${ticket.br_price}" type="number" pattern="#,##0"/> VNĐ</td>
                                <td><c:out value="${ticket.bt_status != null ? ticket.bt_status : 'N/A'}"/></td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Tổng tiền -->
            <div class="total">
                <p><span>Giá gốc:</span> <fmt:formatNumber value="${totalPrice}" type="number" pattern="#,##0"/> VNĐ</p>
                <p><span>Giảm giá:</span> <fmt:formatNumber value="${discountApplied != null ? discountApplied : 0}" type="number" pattern="#,##0"/> VNĐ</p>
                <p><span>Tổng giá:</span> <fmt:formatNumber value="${totalPriceAfterDiscount != null ? totalPriceAfterDiscount : totalPrice}" type="number" pattern="#,##0"/> VNĐ</p>
            </div>

            <!-- Nút Xuất PDF -->
            <div class="export-pdf hide-on-capture">
                <form id="pdfForm" action="invoice" method="post">
                    <input type="hidden" name="exportToPdf" value="true">
                    <input type="hidden" name="bookId" value="${param.bookId}">
                    <input type="hidden" name="invoiceImage" id="invoiceImage">
                    <button type="submit" onclick="return captureInvoice()">Xuất PDF</button>
                </form>
            </div>
        </c:if>

        <!-- Chữ ký -->
        <div class="signature">
            <div>
                <p class="font-bold">Người mua hàng</p>
                <p>(Chữ ký số nếu có)</p>
            </div>
            <div>
                <p class="font-bold">Người bán hàng</p>
                <p>(Chữ ký điện tử, chữ ký số)</p>
                <div class="valid">
                    <p><i class="fas fa-check-circle"></i>Signature Valid</p>
                    <p>Ký bởi: <c:out value="Công ty Cổ phần BusGo"/></p>
                    <p>Ký ngày: <c:out value="13/01/2021"/></p>
                </div>
            </div>
        </div>

        <!-- Thông tin tra cứu -->
        <div class="footer">
            <p>(Cần kiểm tra, đối chiếu khi lập, giao, nhận hóa đơn)</p>
            <p>Phát hành bởi phần mềm BusGo.vn - Công ty Cổ phần Xe Khách Quang Anh (<a href="http://localhost:9999/bookingg/home.jsp">www.BusGo.com.vn</a>) - MST: <c:out value="0101243150"/></p>
        </div>
    </div>

    <!-- JavaScript để chụp ảnh giao diện -->
    <script>
        function captureInvoice() {
            // Thêm class "capturing" để ẩn nút Xuất PDF
            document.getElementById("invoice-content").classList.add("capturing");
            
            // Chụp ảnh giao diện
            html2canvas(document.getElementById("invoice-content"), { scale: 2 }).then(canvas => {
                // Chuyển canvas thành Base64
                let imageBase64 = canvas.toDataURL("image/png");
                // Gán Base64 vào input ẩn
                document.getElementById("invoiceImage").value = imageBase64;
                console.log("Base64 Image:", imageBase64);
                // Submit form sau khi chụp ảnh xong
                document.getElementById("pdfForm").submit();
                
                // Xóa class "capturing" sau khi chụp xong
                document.getElementById("invoice-content").classList.remove("capturing");
            });
            // Ngăn form submit ngay lập tức
            return false;
        }
    </script>
</body>
</html>