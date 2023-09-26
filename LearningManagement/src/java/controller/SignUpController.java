/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import consts.IConstants;
import dao.AccountDAO;
import dao.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Setting;
import utils.Helper;
import utils.Mail;

/**
 *
 * @author DELL
 */
@WebServlet(name = "SignUpByMailController", urlPatterns = {"/sign-up-byMail"})
public class SignUpController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignUpController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("sign-up-byMail.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountDAO accountDAO = new AccountDAO();
        SettingDAO settingdao = new SettingDAO();

        String email = request.getParameter("email");
        if (accountDAO.getOneByEmail(email) != null) {
            request.setAttribute("msg", "Email already exist! Input again");
            request.getRequestDispatcher("sign-up-byMail.jsp").forward(request, response);
        } else {
            List<Setting> list = settingdao.getListDomain();
            List<String> domains = new ArrayList<>();
            int atIndex = email.indexOf('@');
            
            String domain = email.substring(atIndex + 1);
            System.out.println(domain);

            for (Setting s : list) {
                domains.add(s.getTitle());
            }
            System.out.println(domains);
            if (domains.contains(domain)) {
                session.setAttribute("email", email);
                String otp = Helper.genRandSixDigit();
                session.setAttribute("systemOtp", otp);
                System.out.println(email);
                Mail.send(email, "OTP to sign up", otp);
                response.sendRedirect("otp-confirmation");
            } else {
                request.setAttribute("msg", "Invalid domain!");
                request.getRequestDispatcher("sign-up-byMail.jsp").forward(request, response);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
