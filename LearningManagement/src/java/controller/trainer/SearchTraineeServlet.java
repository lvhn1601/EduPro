/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.trainer;

import dao.TrainerDAO;
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
 * @author tango
 */
@WebServlet(name="SearchTraineeServlet", urlPatterns={"/trainer/search-trainee"})
public class SearchTraineeServlet extends HttpServlet {
   
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
            out.println("<title>Servlet SearchTraineeServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchTraineeServlet at " + request.getContextPath () + "</h1>");
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
        TrainerDAO dao = new TrainerDAO();
        
        String search = request.getParameter("search");
        String class_id = request.getParameter("classId");
        String action = request.getParameter("action");
        if(action == null) {
            action = "add";
        }
        int page_num;
        try {
            page_num = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException | NullPointerException e) {
            page_num = 1;
        } 
        // search student in a class
        if(action.equals("view")) {
            int num_of_trainees = dao.countTrainee(Integer.parseInt(class_id), search);
            request.setAttribute("action", action);
            request.setAttribute("class_id", Integer.parseInt(class_id));
            request.setAttribute("count", num_of_trainees);
            request.setAttribute("pages", Math.round(num_of_trainees / 8) + (num_of_trainees % 8 == 0 ? 0 : 1));
            request.setAttribute("trainees", dao.getTraineeInAClass(Integer.parseInt(class_id), search, page_num));
        } 
        // search all student to add to a class
        else {
            int num_of_trainees = dao.countAllTrainee(search);
            // pagination backend
            request.setAttribute("action", action);
            request.setAttribute("count", num_of_trainees);
            request.setAttribute("pages", Math.round(num_of_trainees / 8) + (num_of_trainees % 8 == 0 ? 0 : 1));
            request.setAttribute("class_id", Integer.parseInt(class_id));
            //search by class id and trainee email
            request.setAttribute("trainees", dao.getAllTrainee(search, page_num));
        }
        request.getRequestDispatcher("view-trainee.jsp").forward(request, response);
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
