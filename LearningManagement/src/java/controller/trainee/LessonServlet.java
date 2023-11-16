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
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Chapter;
import model.Config;
import model.Lesson;
import model.Question;
import model.Quiz;

/**
 *
 * @author lvhn1
 */
@WebServlet(name="LessonServlet", urlPatterns={"/lesson"})
public class LessonServlet extends HttpServlet {
   
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
            out.println("<title>Servlet LessonServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LessonServlet at " + request.getContextPath () + "</h1>");
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
        
        int id = Integer.parseInt(request.getParameter("id"));
        ManagerDAO md = new ManagerDAO();
        StudentDAO sd = new StudentDAO();
        Lesson lesson = md.getLessonWithId(id);
        
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
        
        if (lesson.getType().equalsIgnoreCase("quiz")) {
            request.setAttribute("lesson", lesson);
            request.setAttribute("results", sd.getQuizResults(id, acc.getId()));
            
            request.getRequestDispatcher("trainee/quiz-lesson.jsp").forward(request, response);
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
        Account acc = (Account) request.getSession().getAttribute("accountCur");
        StudentDAO sd = new StudentDAO();
        String type = request.getParameter("type");
        int classId = Integer.parseInt(request.getParameter("classid"));
        if (type.equalsIgnoreCase("quiz")) {
            int lesson_id = Integer.parseInt(request.getParameter("id"));
            sd.createQuizSubmit(lesson_id, acc.getId(), classId);
            
            int submitId = sd.getNewSubmitId(acc.getId());
            Quiz quiz = sd.getQuizBySubmitId(submitId);
            System.out.println(quiz.toString());
            
            if (quiz.isType()) {
                List<Config> listCf = sd.getListConfigsByQuiz(quiz.getId());
                List<Question> listQues = new ArrayList<>();
                if (quiz.isConfig_by()) {
                    for (Config c : listCf) {
                        listQues.addAll(sd.getListQuestionByDimension(c.getDimension().getId(), c.getNum_of_question()));
                    }
                } else {
                    for (Config c : listCf)
                        listQues.addAll(sd.getListQuestionByChapter(c.getChapter().getId(), c.getNum_of_question()));
                }
                int i = 0;
                for (Question q : listQues) {
                    i++;
                    sd.addQuestionsToQuiz(submitId, q.getId(), i);
                }
            } else {
                List<Question> listQues = sd.getFixedQuestions(quiz.getId());
                int i = 0;
                for (Question q : listQues) {
                    i++;
                    sd.addQuestionsToQuiz(submitId, q.getId(), i);
                }
            }
            
            response.sendRedirect("quiz?action=take&id=" + submitId + "&qnum=1&subject=" + request.getParameter("subject") + "&classid=" + classId);
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

}
