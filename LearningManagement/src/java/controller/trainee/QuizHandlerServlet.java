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
import model.Chapter;
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
        Account acc = (Account) request.getSession().getAttribute("accountCur");
        StudentDAO sd = new StudentDAO();

        int qnum = 1;
        try {
            qnum = Integer.parseInt(request.getParameter("qnum"));
        } catch (NumberFormatException | NullPointerException e) {
        }

        int submitId = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("take") && sd.quizExpired(submitId)) {
            response.sendRedirect("lesson?classid=" + request.getParameter("classid") + "&id=" + sd.getQuizLessonId(submitId));
        } else {
            Question question = sd.getQuestionByNum(submitId, qnum, !action.equalsIgnoreCase("take"));
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

            if (acc.getRole().getId() == 4) {
                request.setAttribute("classList", sd.getClassList(acc.getId()));
            }
            request.setAttribute("correctNum", correct);
            request.setAttribute("numOfQues", sd.getNumOfQuestions(submitId));
            request.setAttribute("lid", sd.getQuizLessonId(submitId));
            request.setAttribute("timeleft", sd.getSecondLeft(submitId));
            
            // Data cho Sidebar
            int sid = Integer.parseInt(request.getParameter("subject"));
            List<model.Class> listClasses = sd.getClassList(acc.getId(), sid, acc.getRole().getId());

            request.setAttribute("classList", listClasses);

            String cid_raw = request.getParameter("classid");

            int cid = 0;
            if (cid_raw != null) {
                cid = Integer.parseInt(cid_raw);
            } else {
                cid = listClasses.get(0).getClass_id();
            }
            request.setAttribute("classId", cid);

            List<Chapter> listChapters = sd.getChaptersList(sid);
            request.setAttribute("materials", listChapters);
            // Het

            request.getRequestDispatcher("trainee/quiz-handler.jsp").forward(request, response);
        }
        
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
        
        response.sendRedirect("lesson?subject=" + request.getParameter("subject") + "&classid=" + request.getParameter("classid") + "&id=" + sd.getQuizLessonId(submitId));
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
