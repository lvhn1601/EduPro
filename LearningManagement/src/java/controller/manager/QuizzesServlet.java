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
@WebServlet(name="QuizzesServlet", urlPatterns={"/manager/quizzes"})
public class QuizzesServlet extends HttpServlet {
   
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
            out.println("<title>Servlet QuizzesServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizzesServlet at " + request.getContextPath () + "</h1>");
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
        //request.setAttribute("chapters", db.getListChapter(acc.getId()));
        
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
        
        int num_of_quizzes = db.countQuizzes(acc.getId(), search, subject_id);
        request.setAttribute("count", num_of_quizzes);
        request.setAttribute("pages", Math.round(num_of_quizzes / 8) + (num_of_quizzes % 8 == 0 ? 0 : 1));
        request.setAttribute("quizzes", db.getQuizzes(acc.getId(), search, page_num, subject_id));
        
        request.getRequestDispatcher("quizzes.jsp").forward(request, response);
        
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
        
        String action = request.getParameter("action");
        int id, subject, chapter, quiz;
        String title;
        boolean type, status;
        
        switch (action) {
            case "addNewGeneral":
                title = request.getParameter("title");
                subject = Integer.parseInt(request.getParameter("subject"));
                chapter = Integer.parseInt(request.getParameter("chapter"));
                type = request.getParameter("type").equals("1");
                status = request.getParameter("status") != null;
                
                db.addQuiz(title, subject, chapter, type, status, acc.getId());
                break;
            case "updateGeneral":
                id = Integer.parseInt(request.getParameter("id"));
                title = request.getParameter("title");
                chapter = Integer.parseInt(request.getParameter("chapter"));
                type = request.getParameter("type").equals("1");
                status = request.getParameter("status") != null;

                db.updateQuiz(id, title, chapter, type, status, acc.getId());
                break;
            case "updateConfig":
                String[] ids = request.getParameterValues("id");
                String[] dimensions = request.getParameterValues("dimension");
                String[] chapters = request.getParameterValues("chapter");
                String[] numOfQues = request.getParameterValues("numOfQues");
                String[] removes = request.getParameterValues("remove");
                quiz = Integer.parseInt(request.getParameter("quiz"));
                
                for (int i=0; i<ids.length; i++) {
                    if (ids[i].equals("0") && !removes[i].equals("yes")) {
                        int dim = Integer.parseInt(dimensions[i]);
                        int chap = Integer.parseInt(chapters[i]);
                        int num = Integer.parseInt(numOfQues[i]);
                        db.addConfig(dim, chap, num, quiz);
                    } else if (!ids[i].equals("0")) {
                        if (removes[i].equals("yes")) {
                            db.deleteConfig(Integer.parseInt(ids[i]));
                        } else {
                            int dim = Integer.parseInt(dimensions[i]);
                            int chap = Integer.parseInt(chapters[i]);
                            int num = Integer.parseInt(numOfQues[i]);
                            
                            db.updateConfig(Integer.parseInt(ids[i]), dim, chap, num);
                        }
                    }
                }
                break;
            case "updateQuestions":
                String[] quesID = request.getParameterValues("question-id");
                String[] quesStatus = request.getParameterValues("status");
                String[] quesRemove = request.getParameterValues("remove");
                quiz = Integer.parseInt(request.getParameter("quiz"));
                
                for (int i=0; i<quesID.length; i++) {
                    int ques = Integer.parseInt(quesID[i]);
                    
                    if (quesStatus[i].equals("new") && !quesRemove[i].equals("yes"))
                        db.addQuizQuestion(quiz, ques);
                    else
                        if (quesStatus[i].equals("old") && quesRemove[i].equals("yes"))
                            db.deleteQuizQuestion(quiz, ques);
                }
                break;
        }
        
        response.sendRedirect("quizzes");
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
