/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.trainee;

import dao.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Config;
import model.Question;
import model.Quiz;

/**
 *
 * @author lvhn1
 */
@WebServlet(name="QuizHandlerServlet", urlPatterns={"/quiz"})
public class QuizHandlerServlet extends HttpServlet {
   
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
            out.println("<title>Servlet QuizHandlerServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizHandlerServlet at " + request.getContextPath () + "</h1>");
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
        //Account acc = (Account) request.getSession().getAttribute("accountCur");
        StudentDAO sd = new StudentDAO();

        int qnum = 1;
        try {
            qnum = Integer.parseInt(request.getParameter("qnum"));
        } catch (NumberFormatException | NullPointerException e) {
        }

        int submitId = Integer.parseInt(request.getParameter("id"));

        Question question = sd.getQuestionByNum(submitId, qnum, !request.getParameter("action").equalsIgnoreCase("take"));
        request.setAttribute("question", question);
        
        String correct;
        switch (question.getCorrect_id()) {
            case 1:
                correct = "one";
                break;
            case 2:
                correct = "two";
                break;
            case 3:
                correct = "three";
                break;
            case 4:
                correct = "four";
                break;
            case 5:
                correct = "five";
                break;
            default:
                correct = "correct answers";
                break;
        }
        request.setAttribute("correctNum", correct);
        request.setAttribute("numOfQues", sd.getNumOfQuestions(submitId));
        request.setAttribute("lid", sd.getQuizLessonId(submitId));
        
        request.getRequestDispatcher("trainee/quiz-handler.jsp").forward(request, response);
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
        StudentDAO sd = new StudentDAO();
        int submitId = Integer.parseInt(request.getParameter("id"));
        sd.submitQuiz(submitId);
        
        response.sendRedirect("lesson?id=" + sd.getQuizLessonId(submitId));
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
