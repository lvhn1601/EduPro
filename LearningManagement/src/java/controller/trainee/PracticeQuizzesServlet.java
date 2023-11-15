/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.trainee;

import dao.ManagerDAO;
import dao.StudentDAO;
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
@WebServlet(name="PracticeQuizzesServlet", urlPatterns={"/practice-quizzes"})
public class PracticeQuizzesServlet extends HttpServlet {
   
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
            out.println("<title>Servlet PracticeQuizzesServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PracticeQuizzesServlet at " + request.getContextPath () + "</h1>");
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
        StudentDAO sd = new StudentDAO();
        ManagerDAO md = new ManagerDAO();
        
        int classId = Integer.parseInt(request.getParameter("classid"));
        
        int subjectId = sd.getSubjectId(classId);
        
        if (acc.getRole().getId() == 4) {
            request.setAttribute("classList", sd.getClassList(acc.getId()));
        }
        
        request.setAttribute("subjectId", subjectId);
        request.setAttribute("chapters", md.getListChaptersBySubject(subjectId));
        request.setAttribute("dimensionTypes", md.getDimensionTypes(subjectId));
        
        request.setAttribute("quizzes", sd.getPracticeQuizzes(acc.getId()));
        
        request.getRequestDispatcher("trainee/practice-quizzes.jsp").forward(request, response);
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
        StudentDAO sd = new StudentDAO();
        
        boolean success = true;
        
        String title = request.getParameter("title");
        boolean configBy = request.getParameter("config-type").equals("1");
        int totalNum = Integer.parseInt(request.getParameter("totalNum"));
        String dimensionType = request.getParameter("dimensionType");
        
        success = sd.addPracticeQuiz(title, configBy, totalNum, dimensionType, acc.getId()) ? success : false;
        int id = sd.getQuizId(acc.getId());
        success = sd.addPracticeQuiz(id) ? success : false;
        
        String[] nums = request.getParameterValues("numOfQues");
        if (configBy) {
            String[] cds = request.getParameterValues("config-dimension");
            for (int i=0; i<cds.length; i++)
                success = sd.addConfig(configBy, Integer.parseInt(cds[i]), Integer.parseInt(nums[i]), id) ? success : false;
        } else {
            String[] ccs = request.getParameterValues("config-chapter");
            for (int i=0; i<ccs.length; i++)
                success = sd.addConfig(configBy, Integer.parseInt(ccs[i]), Integer.parseInt(nums[i]), id) ? success : false;
        }
        
        HttpSession session = request.getSession();
        
        if (success)
            session.setAttribute("alert", Alert.builder()
                    .type(true)
                    .message("You have added practice quiz successfully!")
                    .build()
            );
        else
            session.setAttribute("alert", Alert.builder()
                    .type(false)
                    .message("Add practice quiz failed! Please try again!")
                    .build()
            );
        
        response.sendRedirect("practice-quizzes?classid=" + request.getParameter("classid"));
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
