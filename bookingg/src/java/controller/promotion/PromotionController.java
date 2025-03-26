package controller.promotion;

import dal.promotion.PromotionByCodeDAO;
import dal.promotion.PromotionByDateDAO;
import dal.promotion.PromotionByPassengersDAO;
import model.promotion.Promotions_By_Code;
import model.promotion.Promotions_By_Date;
import model.promotion.Promotions_By_Passengers;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "PromotionController", urlPatterns = {"/promotions"})
public class PromotionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy dữ liệu từ 3 DAO
        PromotionByDateDAO pbdDAO = new PromotionByDateDAO();
        ArrayList<Promotions_By_Date> datePromotions = pbdDAO.list1();

        PromotionByCodeDAO pbcDAO = new PromotionByCodeDAO();
        ArrayList<Promotions_By_Code> codePromotions = pbcDAO.list1();

        PromotionByPassengersDAO pbpDAO = new PromotionByPassengersDAO();
        ArrayList<Promotions_By_Passengers> passengerPromotions = pbpDAO.list();

        // Đặt dữ liệu vào request attributes
        request.setAttribute("datePromotions", datePromotions);
        request.setAttribute("codePromotions", codePromotions);
        request.setAttribute("passengerPromotions", passengerPromotions);

        // Chuyển hướng đến trang JSP
        request.getRequestDispatcher("promotions.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Promotion Controller Servlet";
    }
}