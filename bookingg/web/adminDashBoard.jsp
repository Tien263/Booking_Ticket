<%-- 
    Document   : adminDashBoard
    Created on : Mar 2, 2025, 4:29:48 PM
    Author     : Nguyen Minh Duc
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản trị Admin</title>
    <link rel="stylesheet" href="styles.css"> <!-- Liên kết file CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="container">
        <aside class="sidebar">
            <div class="admin-info">
                <img src="admin-avatar.png" alt="Admin Avatar">
                <p>Admin</p>
                <span>Chào mừng bạn trở lại</span>
            </div>
            <nav>
                <ul>
                    <li><a href="ReportFinacial"><i class="fas fa-tachometer-alt"></i> Báo Cáo thống kê</a></li>
                    <li><a href="ViewUserOrderHistory"><i class="fas fa-users"></i> Lịch Sử Giao Dịch </a></li>
                     </ul>
            </nav>
        </aside>
        
        <main class="content">
            <header class="dashboard-header">
                <h2>Báo Cáo Thông Kê </h2>
                <span>Chủ Nhật, 20/10/2024 - 12:29</span>
            </header>

            <section class="dashboard-summary">
                <div class="summary-card">
                    <i class="fas fa-user"></i>
                    <div>
                        <h3>TỔNG KHÁCH HÀNG</h3>
                        <p>6 khách hàng</p>
                    </div>
                </div>
                <div class="summary-card">
                    <i class="fas fa-box"></i>
                    <div>
                        <h3>TỔNG SẢN PHẨM</h3>
                        <p>29 sản phẩm</p>
                    </div>
                </div>
                <div class="summary-card">
                    <i class="fas fa-shopping-cart"></i>
                    <div>
                        <h3>TỔNG ĐƠN HÀNG</h3>
                        <p>17 đơn hàng</p>
                    </div>
                </div>
                <div class="summary-card">
                    <i class="fas fa-exclamation-triangle"></i>
                    <div>
                        <h3>SẮP HẾT HÀNG</h3>
                        <p>2 sản phẩm</p>
                    </div>
                </div>
                
            </section>

            <section class="orders">
                <h3>Đơn hàng hôm nay</h3>
                  <table>
                     <thead>
                         <tr>
                            <th>ID đơn hàng</th>
                            <th>Khách hàng</th>
                            <th>Số điện thoại</th>
                            <th>Địa chỉ</th>
                            <th>Ngày mua</th>
                            <th>Tổng tiền</th>
                            <th>Thanh toán</th>
                            <th>Chức năng</th>
                         </tr>
                     </thead>
                   <tbody>
                        <tr>
                            <td colspan="8" style="text-align: center;">Không có đơn hàng nào</td>
                        </tr>
                   </tbody>
                </table>
            </section>
        </main>
    </div>

    <footer>
        <p>Copyright 2024 Phần mềm quản lý Website</p>
    </footer>
</body>
</html>
