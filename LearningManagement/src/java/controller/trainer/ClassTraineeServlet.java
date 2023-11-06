/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.trainer;

import dao.ManagerDAO;
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

/**
 *
 * @author tango
 */
@WebServlet(name="ClassTraineeServlet", urlPatterns={"/trainer/class-trainee"})
public class ClassTraineeServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ClassTraineeServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClassTraineeServlet at " + request.getContextPath () + "</h1>");
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
        
        String class_name = request.getParameter("search");
        if(class_name == null) {
            class_name = "";
        }
        String subject_name = request.getParameter("subject");
        if(subject_name == null) {
            subject_name = "";
        }
        String semester = request.getParameter("semester");
        if(semester == null) {
            semester = "";
        }
        
        int page_num;
        try {
            page_num = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException | NullPointerException e) {
            page_num = 1;
        }
        
        System.out.println(class_name);
        // pagination backend
        int num_of_classes = dao.countClasses(acc.getId(), class_name, subject_name, semester);
        System.out.println(acc.getId()+" "+class_name+" "+subject_name+" "+semester);
        request.setAttribute("count", num_of_classes);
        request.setAttribute("pages", Math.round(num_of_classes / 8) + (num_of_classes % 8 == 0 ? 0 : 1));
        request.setAttribute("subjects", dao.getAllSubjects());
        request.setAttribute("semesters", dao.getListSemester());
        request.setAttribute("classes", dao.getClassByTrainerId(acc.getId(), class_name, subject_name, semester, page_num));
        request.getRequestDispatcher("class-trainee.jsp").forward(request, response);
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
