/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.promotion;

import dal.promotion.PromotionByDateDAO;
import model.promotion.Promotions_By_Date;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */

@WebServlet(name = "PromotionByDateController", urlPatterns = {"/promotion/promotion_date", "/promotion/editDatePromotion", "/promotion/deleteDatePromotion"})
public class PromotionByDateController extends HttpServlet {

    private PromotionByDateDAO promotionDAO = new PromotionByDateDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getServletPath();

        if ("/editDatePromotion".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Promotions_By_Date promotion = promotionDAO.get(id);
            request.setAttribute("promotion", promotion);
            request.getRequestDispatcher("datePromo.jsp").forward(request, response);
        } 
        else if ("/deleteDatePromotion".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Promotions_By_Date promo = new Promotions_By_Date();
            promo.setId(id);
            promotionDAO.delete(promo);
            response.sendRedirect("promotion_date"); // Quay về trang danh sách
        } 
        else {
            // Lấy danh sách khuyến mãi theo ngày
            List<Promotions_By_Date> promotions = promotionDAO.list();
            request.setAttribute("promotions", promotions); // Kiểm tra dữ liệu này được gán đúng chưa
            request.getRequestDispatcher("datePromo.jsp").forward(request, response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = request.getParameter("id") != null && !request.getParameter("id").isEmpty() 
                    ? Integer.parseInt(request.getParameter("id")) 
                    : 0;
            String name = request.getParameter("name");
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            double discount = Double.parseDouble(request.getParameter("discount"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = sdf.parse(startDateStr);
            Date endDate = sdf.parse(endDateStr);

            Promotions_By_Date promotion = new Promotions_By_Date(id, name, startDate, endDate, discount, quantity);

            if (id > 0) {
                promotionDAO.update(promotion);
            } else {
                promotionDAO.insert(promotion);
            }

            response.sendRedirect("promotion_date"); // Quay lại danh sách sau khi thêm/sửa
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
