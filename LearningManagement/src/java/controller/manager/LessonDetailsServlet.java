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
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Alert;

/**
 *
 * @author lvhn1
 */
@WebServlet(name="LessonDetailsServlet", urlPatterns={"/manager/lesson-details"})
public class LessonDetailsServlet extends HttpServlet {
   
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
            out.println("<title>Servlet LessonDetailsServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LessonDetailsServlet at " + request.getContextPath () + "</h1>");
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
        
        if (request.getParameter("action").equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("lesson", db.getLessonWithId(id));
        }
        
        request.getRequestDispatcher("lesson-details.jsp").forward(request, response);
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
        ManagerDAO db = new ManagerDAO();
        HttpSession session = request.getSession();
        
        String action = request.getParameter("action");
        
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        boolean status = request.getParameter("status") != null;
        String video = request.getParameter("video");
        String description = request.getParameter("description");
        
        if (action.equals("add")) {
            int chapter = Integer.parseInt(request.getParameter("chapter"));
            if (db.addLesson(title, chapter, type, status, video, description, acc.getId()))
                session.setAttribute("alert", Alert.builder()
                        .type(true)
                        .message("You have added new lesson succesfully!")
                        .build()
                );
            else
                session.setAttribute("alert", Alert.builder()
                        .type(false)
                        .message("Add new lesson failed! Please try again...")
                        .build()
                );
            
            if (type.equals("Quiz")) {
                int lesson = db.getId("lesson");
                int quiz = Integer.parseInt(request.getParameter("quiz"));
                int duration = Integer.parseInt(request.getParameter("duration"));
                int passVal = Integer.parseInt(request.getParameter("pass-val"));
                int maxAttempt = Integer.parseInt(request.getParameter("max-attempt"));
                
                db.addQuizLesson(lesson, quiz, duration, passVal, maxAttempt);
            }
        } else {
            int id = Integer.parseInt(request.getParameter("lesson-id"));
            
            if (db.updateLesson(id, title, type, status, video, description))
                session.setAttribute("alert", Alert.builder()
                        .type(true)
                        .message("You have updated lesson " + id + " succesfully!")
                        .build()
                );
            else
                session.setAttribute("alert", Alert.builder()
                        .type(false)
                        .message("Update lesson " + id + " failed! Please try again...")
                        .build()
                );
            
            if (type.equals("Quiz")) {
                int quiz = Integer.parseInt(request.getParameter("quiz"));
                int duration = Integer.parseInt(request.getParameter("duration"));
                int passVal = Integer.parseInt(request.getParameter("pass-val"));
                int maxAttempt = Integer.parseInt(request.getParameter("max-attempt"));
                
                db.updateQuizLesson(id, quiz, duration, passVal, maxAttempt);
            }
        }
        
        response.sendRedirect("lessons");
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
