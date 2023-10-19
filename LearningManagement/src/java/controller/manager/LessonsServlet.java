/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.manager;

import dao.ManagerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author lvhn1
 */
@WebServlet(name="LessonsServlet", urlPatterns={"/manager/lessons"})
public class LessonsServlet extends HttpServlet {
   
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
            out.println("<title>Servlet LessonsServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LessonsServlet at " + request.getContextPath () + "</h1>");
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
        Account acc = (Account) request.getSession().getAttribute("accountCur");
        ManagerDAO db = new ManagerDAO();
        
        request.setAttribute("subjects", db.getListSubjects(acc.getId()));
        
        int page_num;
        try {
            page_num = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException | NullPointerException e) {
            page_num = 1;
        }
        
        String search = request.getParameter("search");
        if (search == null)
            search = "";
        
        int subject_id;
        try {
            subject_id = Integer.parseInt(request.getParameter("subject"));
        } catch (NumberFormatException | NullPointerException e) {
            subject_id = 0;
        }
        
        int num_of_lessons = db.countLessons(acc.getId(), search, subject_id);
        request.setAttribute("count", num_of_lessons);
        request.setAttribute("pages", Math.round(num_of_lessons / 8) + (num_of_lessons % 8 == 0 ? 0 : 1));
        request.setAttribute("lessons", db.getLessons(acc.getId(), search, page_num, subject_id));
        
        request.getRequestDispatcher("lessons.jsp").forward(request, response);
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
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
