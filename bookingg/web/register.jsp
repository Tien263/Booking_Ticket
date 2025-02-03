<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="register_card mb-0" data-bg-color="##F2F2F2" data-aos="fade-up" data-aos-delay="100">
            <div class="section_title mb_30 text-center">
                <h2 class="title_text mb-0" data-aos="fade-up" data-aos-delay="300">
                    <span>Register</span>
                </h2>
            </div>
            <form action="register1" method="POST">
                <div class="row justify-content-lg-between">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" data-aos="fade-up" data-aos-delay="500">
                        <div class="form_item">
                            <input type="text" name="fullname" placeholder="Your Name*" value="${fullname}" required>
                        </div>
                        <div class="form_item">
                            <input type="email" name="email" placeholder="Your Email*" value="${email}" required>
                        </div>
                        <div class="form_item">
                            <input type="text" name="username" placeholder="Username*" value="${username}" required>
                        </div>
                        <div class="form_item">
                            <input type="password" name="password" placeholder="Password*" required>
                        </div>
                        <div class="form_item">
                            <input type="password" name="confirmpass" placeholder="Confirm Password*" required>
                        </div>
                        <div class="form_item">
                            <input type="tel" name="phone" placeholder="Phone Number*" value="${phone}" required>
                        </div>
                        <div class="form_item">
                            <label for="gender">Gender:</label>
                            <div>
                                <input type="radio" id="male" name="gender" value="true" required ${gender == true ? 'checked' : ''}>
                                <label for="male">Male</label>
                            </div>
                            <div class="form_item">
                                <label for="province">Tỉnh/Thành phố:</label>
                                <select id="province" name="province" required>
                                    <option value="">Chọn tỉnh/thành phố</option>
                                    <option value="Hà Nội">Hà Nội</option>
                                    <option value="Thành phố Hồ Chí Minh">Thành phố Hồ Chí Minh</option>
                                    <option value="Hải Phòng">Hải Phòng</option>
                                    <option value="Đà Nẵng">Đà Nẵng</option>
                                    <option value="Cần Thơ">Cần Thơ</option>
                                    <option value="An Giang">An Giang</option>
                                    <option value="Bà Rịa – Vũng Tàu">Bà Rịa – Vũng Tàu</option>
                                    <option value="Bắc Giang">Bắc Giang</option>
                                    <option value="Bắc Kạn">Bắc Kạn</option>
                                    <option value="Bắc Ninh">Bắc Ninh</option>
                                    <option value="Bến Tre">Bến Tre</option>
                                    <option value="Bình Dương">Bình Dương</option>
                                    <option value="Bình Định">Bình Định</option>
                                    <option value="Bình Phước">Bình Phước</option>
                                    <option value="Bình Thuận">Bình Thuận</option>
                                    <option value="Cà Mau">Cà Mau</option>
                                    <option value="Cao Bằng">Cao Bằng</option>
                                    <option value="Đắk Lắk">Đắk Lắk</option>
                                    <option value="Đắk Nông">Đắk Nông</option>
                                    <option value="Điện Biên">Điện Biên</option>
                                    <option value="Đồng Nai">Đồng Nai</option>
                                    <option value="Đồng Tháp">Đồng Tháp</option>
                                    <option value="Gia Lai">Gia Lai</option>
                                    <option value="Hà Giang">Hà Giang</option>
                                    <option value="Hà Nam">Hà Nam</option>
                                    <option value="Hà Tĩnh">Hà Tĩnh</option>
                                    <option value="Hải Dương">Hải Dương</option>
                                    <option value="Hậu Giang">Hậu Giang</option>
                                    <option value="Hòa Bình">Hòa Bình</option>
                                    <option value="Hưng Yên">Hưng Yên</option>
                                    <option value="Khánh Hòa">Khánh Hòa</option>
                                    <option value="Kiên Giang">Kiên Giang</option>
                                    <option value="Kon Tum">Kon Tum</option>
                                    <option value="Lai Châu">Lai Châu</option>
                                    <option value="Lâm Đồng">Lâm Đồng</option>
                                    <option value="Lạng Sơn">Lạng Sơn</option>
                                    <option value="Lào Cai">Lào Cai</option>
                                    <option value="Long An">Long An</option>
                                    <option value="Nam Định">Nam Định</option>
                                    <option value="Nghệ An">Nghệ An</option>
                                    <option value="Ninh Bình">Ninh Bình</option>
                                    <option value="Ninh Thuận">Ninh Thuận</option>
                                    <option value="Phú Thọ">Phú Thọ</option>
                                    <option value="Phú Yên">Phú Yên</option>
                                    <option value="Quảng Bình">Quảng Bình</option>
                                    <option value="Quảng Nam">Quảng Nam</option>
                                    <option value="Quảng Ngãi">Quảng Ngãi</option>
                                    <option value="Quảng Ninh">Quảng Ninh</option>
                                    <option value="Quảng Trị">Quảng Trị</option>
                                    <option value="Sóc Trăng">Sóc Trăng</option>
                                    <option value="Sơn La">Sơn La</option>
                                    <option value="Tây Ninh">Tây Ninh</option>
                                    <option value="Thái Bình">Thái Bình</option>
                                    <option value="Thái Nguyên">Thái Nguyên</option>
                                    <option value="Thanh Hóa">Thanh Hóa</option>
                                    <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
                                    <option value="Tiền Giang">Tiền Giang</option>
                                    <option value="Trà Vinh">Trà Vinh</option>
                                    <option value="Tuyên Quang">Tuyên Quang</option>
                                    <option value="Vĩnh Long">Vĩnh Long</option>
                                    <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                    <option value="Yên Bái">Yên Bái</option>
                                </select>
                            </div>

                            <div class="form_item">
                                <label for="district">Quận/Huyện:</label>
                                <select id="district" name="district" required>
                                    <option value="">Chọn quận/huyện</option>
                                </select>
                            </div>

                            <script>
                                const districts = {
                                    "Hà Nội": ["Quận Ba Đình", "Quận Hoàn Kiếm", "Quận Tây Hồ", "Quận Long Biên", "Quận Cầu Giấy", "Quận Đống Đa", "Quận Hai Bà Trưng"],
                                    "Thành phố Hồ Chí Minh": ["Quận 1", "Quận 12", "Quận Gò Vấp", "Quận Bình Thạnh", "Quận Tân Bình", "Quận Phú Nhuận", "Thành phố Thủ Đức"],
                                    "Hải Phòng": ["Quận Hồng Bàng", "Quận Ngô Quyền", "Quận Lê Chân", "Quận Hải An", "Huyện Cát Hải", "Huyện Bạch Long Vĩ"],
                                    "Đà Nẵng": ["Quận Hải Châu", "Quận Thanh Khê", "Quận Liên Chiểu", "Quận Cẩm Lệ", "Quận Ngũ Hành Sơn"],
                                    "Cần Thơ": ["Quận Ninh Kiều", "Quận Ô Môn", "Quận Bình Thuỷ", "Quận Cái Răng"],
                                    // Thêm danh sách đầy đủ các quận/huyện của tất cả tỉnh/thành phố
                                };

                                document.getElementById("province").addEventListener("change", function () {
                                    const province = this.value;
                                    const districtSelect = document.getElementById("district");
                                    districtSelect.innerHTML = '<option value=\"\">Chọn quận/huyện</option>';

                                    if (districts[province]) {
                                        districts[province].forEach(district => {
                                            const option = document.createElement("option");
                                            option.value = district;
                                            option.textContent = district;
                                            districtSelect.appendChild(option);
                                        });
                                    }
                                });
                            </script>


                        </div>
                        <p style="color: red;">${error}</p>
                        <div class="form_item">
                            <!-- Nút bấm register -->
                            <button type="submit" name="register" class="btn btn-primary">Register</button>
                        </div>
                    </div>
            </form>
        </div>
    </body>
</html>
