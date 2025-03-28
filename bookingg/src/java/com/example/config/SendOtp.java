package com.example.config;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Random;

public class SendOtp extends HttpServlet {
    private static final String API_KEY = "AIzaSyBbeonJ8jXTr1oQ4V6c3EyKzk5lWRlbok4"; // Web API Key từ Firebase

    @Override
    public void init() throws ServletException {
        // Khởi tạo Firebase khi Servlet khởi động
        ServletContext context = getServletContext();
        FirebaseConfig.initFirebase(context);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phoneNumber = request.getParameter("phone");

        if (!phoneNumber.startsWith("+")) {
            request.setAttribute("error", "Số điện thoại phải ở định dạng quốc tế (bắt đầu bằng mã quốc gia, ví dụ: +84)!");
            request.getRequestDispatcher("send-otp.jsp").forward(request, response);
            return;
        }

        String otp = String.valueOf(new Random().nextInt(900000) + 100000);
        request.getSession().setAttribute("otp", otp);
        request.getSession().setAttribute("phoneNumber", phoneNumber);

        try {
            // Gửi mã OTP qua Firebase Authentication REST API
            String urlString = "https://identitytoolkit.googleapis.com/v1/accounts:sendVerificationCode?key=" + API_KEY;
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String jsonInputString = String.format("{\"phoneNumber\": \"%s\", \"recaptchaToken\": \"dummy-token\"}", phoneNumber);
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                String inputLine;
                StringBuilder responseBody = new StringBuilder();
                while ((inputLine = in.readLine()) != null) {
                    responseBody.append(inputLine);
                }
                in.close();
                System.out.println("Đã gửi mã OTP qua SMS: " + responseBody.toString());
                response.sendRedirect("verify-otp.jsp");
            } else {
                BufferedReader errorReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                String errorLine;
                StringBuilder errorResponse = new StringBuilder();
                while ((errorLine = errorReader.readLine()) != null) {
                    errorResponse.append(errorLine);
                }
                errorReader.close();
                request.setAttribute("error", "Lỗi khi gửi mã OTP: " + errorResponse.toString());
                request.getRequestDispatcher("send-otp.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Lỗi khi gửi mã OTP: " + e.getMessage());
            request.getRequestDispatcher("send-otp.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("send-otp.jsp");
    }
}