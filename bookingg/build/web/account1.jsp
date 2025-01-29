<%-- 
    Document   : account1
    Created on : Jan 29, 2025, 1:52:33 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section class="account_section sec_ptb_100 clearfix">
                <div class="container">
                    <div class="row justify-content-lg-between justify-content-md-center justify-content-sm-center">

                        <div class="col-lg-4 col-md-8 col-sm-10 col-xs-12">
                            <div class="account_tabs_menu clearfix" data-bg-color="#F2F2F2" data-aos="fade-up" data-aos-delay="100">
                                <h3 class="list_title mb_15">Account Details:</h3>
                                <ul class="ul_li_block nav" role="tablist">
                                    <li>
                                        <a class="active" data-toggle="tab" href="#admin_tab"><i class="fas fa-user"></i> ${customer.username}</a>
                                    </li>
                                    <li>
                                        <a href="login.jsp"><i class="fas fa-sign-out-alt"></i> Log Out <img class="arrow" src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#profile_tab"><i class="fas fa-address-book"></i> Booking Profiles</a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#history_tab"><i class="fas fa-file-alt"></i> Booking History</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-8 col-md-8 col-sm-10 col-xs-12">
                            <div class="account_tab_content tab-content">
                                <div id="admin_tab" class="tab-pane active">
                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="100">
                                        <h3 class="list_title mb_30">Account:</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Full Name:</span> ${customer.getFullname()} </li>
                                            <li><span>E-mail:</span> ${customer.getEmail()} </li>
                                            <li><span>Username:</span> ${customer.getUsername()} </li>
                                            <li><span>Password:</span> ${customer.getPassword()}</li>
                                            <li><span>Phone Number:</span> ${customer.getPhone()} </li>
                                            <li><span>Gender:</span> ${customer.isGender() ? 'Male' : 'Female'}</li>
                                            <li><span>Address:</span> ${customer.getAddress()}</li>
                                        </ul>

                                        <a class="text_btn text-uppercase" href="change1"><span>Change Account Information</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                    </div>

                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="300">
                                        <h3 class="list_title mb_30">Booking Profiles:</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Profile ID:</span> 0398996177</li>
                                            <li><span>Payment Method:</span> TP Bank</li>
                                            <li><span>Phone Number:</span> +1-202-555-0104</li>
                                        </ul>
                                    </div>

                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="500">
                                        <h3 class="list_title mb_30">Booking History:</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Upcoming Reservations:</span> No Reservations Yet</li>
                                            <li><span>Past Rentals:</span> 0</li>
                                        </ul>
                                        <a class="text_btn text-uppercase" href="#!"><span>Book A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                    </div>
                                </div>

                                <div id="profile_tab" class="tab-pane fade">
                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="100">
                                        <h3 class="list_title mb_30">Booking Profiles:</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Profile ID:</span> 1234557jt</li>
                                            <li><span>Payment Method:</span> Visa Credit Card</li>
                                            <li><span>Phone Number:</span> +1-202-555-0104</li>
                                        </ul>
                                    </div>

                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="300">
                                        <h3 class="list_title mb_30">Booking History:</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Upcoming Reservations:</span> No Reservations Yet</li>
                                            <li><span>Past Rentals:</span> 0</li>
                                        </ul>
                                        <a class="text_btn text-uppercase" href="#!"><span>Book A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                    </div>

                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="500">
                                        <h3 class="list_title mb_30">Account:</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Full Name:</span> Rakibul Islam Dewan</li>
                                            <li><span>E-mail:</span> myname@email.com</li>
                                            <li><span>Username:</span> myname@email.com</li>
                                            <li><span>Password:</span> myname@email.com</li>
                                            <li><span>Phone Number:</span> +1-202-555-0104</li>
                                            <li><span>Gender:</span> +1-202-555-0104</li>
                                            <li><span>Address:</span> 60 Stonybrook Lane Atlanta, GA 30303</li>
                                        </ul>
                                        <a class="text_btn text-uppercase" href="#!"><span>Change Account Information</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                    </div>
                                </div>

                                <div id="history_tab" class="tab-pane fade">
                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="100">
                                        <h3 class="list_title mb_30">Booking History:</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Upcoming Reservations:</span> No Reservations Yet</li>
                                            <li><span>Past Rentals:</span> 0</li>
                                        </ul>
                                        <a class="text_btn text-uppercase" href="#!"><span>Book A Car</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                    </div>

                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="300">
                                        <h3 class="list_title mb_30">Booking Profiles:</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Profile ID:</span> 1234557jt</li>
                                            <li><span>Payment Method:</span> Visa Credit Card</li>
                                            <li><span>Phone Number:</span> +1-202-555-0104</li>
                                        </ul>
                                    </div>

                                    <div class="account_info_list" data-aos="fade-up" data-aos-delay="500">
                                        <h3 class="list_title mb_30">Account:</h3>
                                        <ul class="ul_li_block clearfix">
                                            <li><span>Full Name:</span> Rakibul Islam Dewan</li>
                                            <li><span>E-mail:</span> myname@email.com</li>
                                            <li><span>Username:</span> myname@email.com</li>
                                            <li><span>Password:</span> myname@email.com</li>
                                            <li><span>Phone Number:</span> +1-202-555-0104</li>
                                            <li><span>Gender:</span> +1-202-555-0104</li>
                                            <li><span>Address:</span> 60 Stonybrook Lane Atlanta, GA 30303</li>
                                        </ul>
                                        <a class="text_btn text-uppercase" href="#!"><span>Change Account Information</span> <img src="assets/images/icons/icon_02.png" alt="icon_not_found"></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>