/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.accesscontrol;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 *
 * @author Nguyen Minh Duc
 */public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Map<String, String> faqDatabase = new HashMap<>();
    static {
faqDatabase.put("Làm thế nào để tạo tài khoản trên website?", "");
faqDatabase.put("Xem lịch trình các chuyến xe làm như thế nào?", "kích vào mục bookTicket ở trên trang chủ -> nhập điểm đi -> nhập điểm đến -> nhập thời gian -> nhập ngày ->  ");
faqDatabase.put("Làm sao để đăng nhập vào website?", "Bạn chỉ cần nhập email và mật khẩu đã đăng ký, sau đó nhấn 'Đăng nhập'.");
faqDatabase.put("Có thể thay đổi thông tin tài khoản không?", "Có, bạn có thể vào mục 'Tài khoản của tôi' và chỉnh sửa thông tin cá nhân.");
faqDatabase.put("Làm thế nào để đặt vé xe khách?", "Bạn có thể đặt vé xe khách thông qua website chính thức hoặc đến trực tiếp bến xe.");
faqDatabase.put("Tôi có thể đổi hoặc hủy vé xe khách không?", "Tùy vào chính sách của từng nhà xe, bạn có thể đổi hoặc hủy vé bằng cách liên hệ với nhà xe.");
faqDatabase.put("Lịch trình xe khách từ Hà Nội vào TP.HCM thế nào?", "Có nhiều chuyến xe chạy từ Hà Nội vào TP.HCM, bạn nên kiểm tra trên website nhà xe để biết chi tiết.");
faqDatabase.put("Các phương thức thanh toán cho vé xe khách là gì?", "Bạn có thể thanh toán bằng tiền mặt, thẻ tín dụng hoặc ví điện tử như Momo, ZaloPay.");
faqDatabase.put("Có cần mang giấy tờ tùy thân khi lên xe khách không?", "Có, bạn cần mang theo giấy tờ tùy thân như CMND/CCCD hoặc hộ chiếu khi lên xe.");
faqDatabase.put("Làm thế nào để kiểm tra trạng thái đơn hàng?", "Bạn có thể vào mục 'Đơn hàng của tôi' để xem trạng thái đơn hàng.");
faqDatabase.put("Tôi có thể yêu cầu hoàn tiền nếu có sự cố không?", "Có, nếu đơn hàng của bạn gặp sự cố, hãy liên hệ với bộ phận hỗ trợ để yêu cầu hoàn tiền.");
faqDatabase.put("Tôi có thể tìm kiếm sản phẩm trên website như thế nào?", "Bạn có thể sử dụng thanh tìm kiếm trên đầu trang để nhập từ khóa sản phẩm cần tìm.");
faqDatabase.put("Làm sao để liên hệ với bộ phận hỗ trợ?", "Bạn có thể gửi yêu cầu hỗ trợ qua email, hotline hoặc chat trực tiếp trên website.");
faqDatabase.put("Tôi có thể đánh giá sản phẩm sau khi mua không?", "Có, sau khi nhận hàng, bạn có thể vào trang sản phẩm và để lại đánh giá.");
faqDatabase.put("Làm thế nào để đổi trả sản phẩm nếu không ưng ý?", "Bạn có thể kiểm tra chính sách đổi trả trên website và làm theo hướng dẫn.");
faqDatabase.put("Website có hỗ trợ giao hàng tận nơi không?", "Có, chúng tôi hỗ trợ giao hàng tận nơi theo chính sách vận chuyển.");
faqDatabase.put("Làm thế nào để đăng ký nhận tin khuyến mãi?", "Bạn có thể nhập email vào mục đăng ký nhận bản tin trên website.");
faqDatabase.put("Website có phiên bản di động không?", "Có, bạn có thể sử dụng phiên bản di động hoặc tải ứng dụng của chúng tôi.");
faqDatabase.put("Làm sao để hủy đơn hàng trước khi giao?", "Bạn có thể vào mục 'Đơn hàng của tôi' và chọn hủy đơn hàng trước khi đơn được xử lý.");
faqDatabase.put("Có cần tài khoản để đặt hàng không?", "Không bắt buộc, nhưng có tài khoản sẽ giúp bạn theo dõi đơn hàng dễ dàng hơn.");
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        String question = request.getParameter("question").toLowerCase();
        String selectedQuestion = request.getParameter("selectedQuestion");
        System.out.println(selectedQuestion);
        List<String> matchingQuestions = findMatchingQuestions(question);

        String bestQuestion = null;
        String bestAnswer = null;
       
        if (selectedQuestion != null && faqDatabase.containsKey(selectedQuestion)) {
            // Khi người dùng chọn một câu hỏi gợi ý
             
             
            bestQuestion = selectedQuestion;
          
          
            bestAnswer = faqDatabase.get(selectedQuestion);

            // **Lưu vào session**
            HttpSession session = request.getSession();
            List<String[]> history = (List<String[]>) session.getAttribute("history");
            if (history == null) {
                history = new ArrayList<>();
            }
            history.add(new String[]{bestQuestion, bestAnswer});
            session.setAttribute("history", history);
        } else {
            // Khi nhập từ khóa nhưng chưa chọn câu hỏi nào
            bestQuestion = "Hãy chọn một câu hỏi gợi ý để nhận câu trả lời.";
            bestAnswer = "";
        }
        
         request.setAttribute("history", request.getSession().getAttribute("history"));
        request.setAttribute("bestQuestion", bestQuestion);
        request.setAttribute("bestAnswer", bestAnswer);
        request.setAttribute("suggestedQuestions", matchingQuestions);
        request.getRequestDispatcher("search.jsp").forward(request, response);
        } catch (Exception e) {
        String selectedQuestion = request.getParameter("selectedQuestion");
        String bestQuestion = null;
        String bestAnswer = null;
       
        if (selectedQuestion != null && faqDatabase.containsKey(selectedQuestion)) {
            // Khi người dùng chọn một câu hỏi gợi ý
            bestQuestion = selectedQuestion;
            if(bestQuestion.equals("Làm thế nào để tạo tài khoản trên website?")){
             System.out.println("Tétttt");
             response.sendRedirect("booking");
             return;  }
             if(bestQuestion.equals("Xem lịch trình các chuyến xe làm như thế nào?")){
             System.out.println("Tétttt");
             response.sendRedirect("home.jsp");
             return;  }
            bestAnswer = faqDatabase.get(selectedQuestion);

            // **Lưu vào session**
            HttpSession session = request.getSession();
            List<String[]> history = (List<String[]>)session.getAttribute("history");
            if (history == null){
                history = new ArrayList<>();
            }history.add(new String[]{bestQuestion, bestAnswer});
             session.setAttribute("history", history);
        } else {
            // Khi nhập từ khóa nhưng chưa chọn câu hỏi nào
            bestQuestion = "Hãy chọn một câu hỏi gợi ý để nhận câu trả lời.";
            bestAnswer = "";
        }

        // Gửi dữ liệu sang JSP
        request.setAttribute("history", request.getSession().getAttribute("history"));
        request.setAttribute("bestQuestion", bestQuestion);
        request.setAttribute("bestAnswer", bestAnswer);
        request.getRequestDispatcher("search.jsp").forward(request, response);  
        }
      
       
    }

    private List<String> findMatchingQuestions(String question) {
        String[] keywords = question.split("\\s+");
        Map<String, Integer> matchingScores = new HashMap<>();

        for (Map.Entry<String, String> entry : faqDatabase.entrySet()) {
            int score = 0;
            for (String keyword : keywords) {
                if (entry.getKey().toLowerCase().contains(keyword)) {
                    score++;
                }
            }
            if (score > 0) {
                matchingScores.put(entry.getKey(), score);
            }
        }

        return matchingScores.entrySet().stream()
                .sorted(Comparator.comparingInt(Map.Entry<String, Integer>::getValue).reversed())
                .map(Map.Entry::getKey)
                .limit(5) // Chỉ hiển thị tối đa 5 câu gợi ý
                .collect(Collectors.toList());
    }
    
      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}