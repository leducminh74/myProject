package vn.hcmuaf.edu.fit.lab6.controler.admin_controler;

import vn.hcmuaf.edu.fit.lab6.service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

@WebServlet(name = "Revenue_Management", value = "/admin/revenue-management")
public class Revenue_Management extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double totalRevenue = AdminService.getInstance().totalRevenue();
        int currentMonth = Calendar.getInstance().get(Calendar.MONTH) +1 ;
        double totalRevenueByMonth = AdminService.getInstance().getRevenueByMonth(currentMonth);
        int totalOrderStatusPending = AdminService.getInstance().getTotalOrderStatusPending();
        int totalAccountIsCustomer = AdminService.getInstance().getTotalAccountIsCustomer();

        request.setAttribute("totalRevenue",totalRevenue);
        request.setAttribute("totalRevenueByMonth",totalRevenueByMonth);
        request.setAttribute("totalOrderStatusPending",totalOrderStatusPending);
        request.setAttribute("totalAccountIsCustomer",totalAccountIsCustomer);
        request.getRequestDispatcher("revenue-management.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sMonth = request.getParameter("month");
        int month = 0;
        if(sMonth.equals("0")){
            month = Calendar.getInstance().get(Calendar.MONTH) +1 ;
        }else{
            month = Integer.parseInt(sMonth);
        }
        double totalRevenueByMonth = AdminService.getInstance().getRevenueByMonth(month);
        PrintWriter out = response.getWriter();
        out.println(totalRevenueByMonth);


    }
}
