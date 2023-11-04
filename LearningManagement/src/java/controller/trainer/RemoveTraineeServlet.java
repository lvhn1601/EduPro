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
import java.util.List;
import model.Account;
import model.Class;

/**
 *
 * @author tango
 */
@WebServlet(name="RemoveTraineeServlet", urlPatterns={"/trainer/remove-trainee"})
public class RemoveTraineeServlet extends HttpServlet {
   
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
            out.println("<title>Servlet RemoveTraineeServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RemoveTraineeServlet at " + request.getContextPath () + "</h1>");
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
        TrainerDAO dao = new TrainerDAO();
        
        int trainee_id = Integer.parseInt(request.getParameter("id"));
        int class_id = Integer.parseInt(request.getParameter("class_id"));
        System.out.println(class_id+" "+trainee_id);
        Account acc = (Account) request.getSession().getAttribute("accountCur");
        
        //remove a trainee from class
        dao.removeTrainee(class_id, trainee_id);
        
        int page_num;
        try {
            page_num = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException | NullPointerException e) {
            page_num = 1;
        }
        String email = request.getParameter("search");
        if(email == null) {
            email = "";
        }
        
        int num_of_trainees = dao.countTrainee(class_id, email);
        request.setAttribute("message", "Trainee was removed");
        request.setAttribute("class_id", class_id);
        request.setAttribute("action", "view");
        request.setAttribute("count", num_of_trainees);
        request.setAttribute("pages", Math.round(num_of_trainees / 8) + (num_of_trainees % 8 == 0 ? 0 : 1));
        request.setAttribute("trainees", dao.getTraineeInAClass(class_id, email, page_num));
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
