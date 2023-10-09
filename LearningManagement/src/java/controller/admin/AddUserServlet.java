/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dao.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import model.Account;

/**
 *
 * @author lvhn1
 */
@WebServlet(name="AddUserServlet", urlPatterns={"/admin/add-user"})
public class AddUserServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddUserServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUserServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        AdminDAO db = new AdminDAO();
        
        request.setAttribute("roles", db.getRoles());
        request.setAttribute("domains", listDomains(db.getDomains()));
        
        request.getRequestDispatcher("add-user.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Account acc = (Account) request.getSession().getAttribute("accountCur");
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        Date dob = Date.valueOf(request.getParameter("dob"));
        int role_id = Integer.parseInt(request.getParameter("role"));
        
        AdminDAO db = new AdminDAO();
        
        if (!email.equals("") && db.emailExist(email)){
            request.setAttribute("error", "Email already exist!");
            doGet(request, response);
        }
        else if (!phone.equals("") && db.phoneExist(phone)) {
            request.setAttribute("error", "Phone number already exist!");
            doGet(request, response);
        }
        else {
            db.addUser(name, email, phone, dob, role_id, acc.getId());
            int last_page = db.countUsers("") / 8;
            last_page += last_page % 8 == 0 ? 0 : 1;
            response.sendRedirect("users?page=" + last_page);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    public String listDomains(List<String> list) {
        String str = "";
        
        for (String s : list)
            str += "'" + s + "',";
        
        return "[" + str.substring(0, str.length()-1) + "]";
    }
}
