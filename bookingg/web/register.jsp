<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <form action="#" method="POST">
                <div class="row justify-content-lg-between">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" data-aos="fade-up" data-aos-delay="500">
                        <div class="form_item">
                            <input type="text" name="name" placeholder="Your Name*" required>
                        </div>
                        <div class="form_item">
                            <input type="email" name="email" placeholder="Your Email*" required>
                        </div>
                        <div class="form_item">
                            <input type="text" name="username" placeholder="Username*" required>
                        </div>
                        <div class="form_item">
                            <input type="password" name="password" placeholder="Password*" required>
                        </div>
                        <div class="form_item">
                            <input type="password" name="confirmpass" placeholder="Confirm Password*" required>
                        </div>
                        <div class="form_item">
                            <input type="tel" name="phone" placeholder="Phone Number*" required>
                        </div>
                        <div class="form_item">
                            <input type="text" name="address" placeholder="Address*">
                        </div>
                        <div class="form_item">
                            <!-- Nút bấm register -->
                            <button type="submit" name="register" class="btn btn-primary">Register</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
