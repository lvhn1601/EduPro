/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.manager;

import com.google.gson.Gson;
import dao.ManagerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import model.Chapter;

/**
 *
 * @author lvhn1
 */
@WebServlet(name="GetChaptersServlet", urlPatterns={"/manager/getDatas"})
public class GetDatasServlet extends HttpServlet {
   
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
            out.println("<title>Servlet GetChaptersServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetChaptersServlet at " + request.getContextPath () + "</h1>");
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
        
        String table = request.getParameter("table");
        int subject_id, quiz_id, chapter_id;
        try {
            subject_id = Integer.parseInt(request.getParameter("subject"));
        } catch (NumberFormatException | NullPointerException e) {
            subject_id = 0;
        }
        
        Gson gson = new Gson();
        String jsonData;
        
        switch (table) {
            case "chapter":
                jsonData = gson.toJson(db.getListChapters(acc.getId(), subject_id));
                break;
            case "dimension":
                String dtype = request.getParameter("dimension-type");
                jsonData = gson.toJson(db.getListDimensions(subject_id, dtype));
                break;
            case "dimension-type":
                jsonData = gson.toJson(db.getDimensionTypes(subject_id));
                break; 
            case "question":
                jsonData = gson.toJson(db.getListQuestions(subject_id));
                break;
            case "config":
                quiz_id = Integer.parseInt(request.getParameter("quiz"));
                jsonData = gson.toJson(db.getListConfig(quiz_id));
                break;
            case "quiz-question":
                quiz_id = Integer.parseInt(request.getParameter("quiz"));
                jsonData = gson.toJson(db.getListQuizQuestions(quiz_id));
                break;
            case "quiz":
                jsonData = gson.toJson(db.getListQuizzes(subject_id));
                break;
            case "lesson":
                chapter_id = Integer.parseInt(request.getParameter("chapter"));
                jsonData = gson.toJson(db.getListLessons(chapter_id));
                break;
            default:
                return;
        }
        
        response.setContentType("application/json");
        
        response.getWriter().write(jsonData);
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
