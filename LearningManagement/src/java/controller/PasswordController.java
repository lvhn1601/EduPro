/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import model.Account;

/**
 *
 * @author dell
 */
@WebServlet(name = "PasswordController", urlPatterns = {"/password"})
public class PasswordController extends HttpServlet {

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
            out.println("<title>Servlet ResetPasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetPasswordController at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            request.getRequestDispatcher("password-creation.jsp").forward(request, response);
        } else if ("reset".equals(action)) {
            request.getRequestDispatcher("password-recovery.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }

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
        String action = request.getParameter("action");

        if ("reset".equals(action)) {
            String phone = request.getParameter("phone");
            if (phone != null && phone.startsWith(" 84")) {
                phone = "0" + phone.substring(3);
            }
            String email = (String) session.getAttribute("email");
            String accountPassword = request.getParameter("accountPassword");

            if (email != null) {
                accountDAO.resetPassword(email, accountPassword);
            } else {
                accountDAO.resetPassword(phone, accountPassword);
            }

            session.removeAttribute("email");
            session.removeAttribute("isOtpConfirmSuccess");
            request.setAttribute("msg", "Reset password successful");
            request.getSession().setAttribute("msg", "Reset password sucessful!!");
            response.sendRedirect("sign-in");
            return;
        }
        if ("register".equals(action)) {
            String phone = request.getParameter("phone");

            if (phone != null) {
                phone = "0" + phone.substring(3);
            }
            String email = (String) session.getAttribute("email");
            String accountPassword = request.getParameter("accountPassword");
            String accountDetailName = request.getParameter("accountDetailName");
            Account acc = Account.builder()
                    .email(email)
                    .phone(phone)
                    .password(accountPassword)
                    .name(accountDetailName)
                    .build();
            accountDAO.register(acc);

            System.out.println(acc);
            session.removeAttribute("email");
            session.removeAttribute("isOtpConfirmSuccess");
            session.setAttribute("msg", "Register successful");
            response.sendRedirect("sign-in");
//            request.getRequestDispatcher("sign-in.jsp").forward(request, response);
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
