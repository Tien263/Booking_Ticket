/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.promotion;

import dal.promotion.PromotionByCodeDAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.promotion.Promotions_By_Code;

/**
 * Servlet điều khiển quản lý mã giảm giá
 */
@WebServlet(name = "PromotionByCodeController", urlPatterns = {"/promotion/promotion_code", "/promotion/editPromotion", "/promotion/deletePromotion"})
public class PromotionByCodeController extends HttpServlet {

    private PromotionByCodeDAO promotionDAO = new PromotionByCodeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getServletPath();

        if ("/editPromotion".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Promotions_By_Code promotion = promotionDAO.get(id);
            request.setAttribute("promotion", promotion);
            request.getRequestDispatcher("codePromo.jsp").forward(request, response);
        } 
        else if ("/deletePromotion".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            promotionDAO.delete(id);
            response.sendRedirect("promotion_code"); // Quay về trang danh sách
        } 
        else {
            // Lấy danh sách mã giảm giá
            List<Promotions_By_Code> promotions = promotionDAO.list();
            request.setAttribute("promotions", promotions);
            request.getRequestDispatcher("codePromo.jsp").forward(request, response);
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
            String code = request.getParameter("code");
            double discount = Double.parseDouble(request.getParameter("discount"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String endDateStr = request.getParameter("endDate");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date endDate = sdf.parse(endDateStr);

            Promotions_By_Code promotion = new Promotions_By_Code(id, name, code, discount, endDate, quantity);

            if (id > 0) {
                promotionDAO.update(promotion);
            } else {
                promotionDAO.insert(promotion);
            }

            response.sendRedirect("promotion_code"); // Quay lại danh sách sau khi thêm/sửa
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}