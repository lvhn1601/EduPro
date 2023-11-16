/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.ManagerDAO;
import dao.StudentDAO;
import dao.TrainerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Alert;
import model.Chapter;
import model.Class;

/**
 *
 * @author lvhn1
 */
@WebServlet(name="ClassDashboardServlet", urlPatterns={"/class-dashboard"})
public class ClassDashboardServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ClassDashboardServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClassDashboardServlet at " + request.getContextPath () + "</h1>");
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
        
        // Data cho Sidebar
        int sid = Integer.parseInt(request.getParameter("subject"));
        List<Class> listClasses = sd.getClassList(acc.getId(), sid, acc.getRole().getId());
        
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
        
        request.setAttribute("classData", sd.getClassWithId(cid));
        
        int chapterNum = 1;
        if (request.getParameter("chapter") != null)
            chapterNum = Integer.parseInt(request.getParameter("chapter"));
        
        Chapter chapter = listChapters.get(chapterNum-1);
        
        request.setAttribute("chapter", chapter);
        
        request.setAttribute("lessons", sd.getLessonsList(chapter.getId(), cid));
        
        HttpSession session = request.getSession();
        session.removeAttribute("alert");
        
        request.getRequestDispatcher("class-dashboard.jsp").forward(request, response);
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
        
        TrainerDAO td = new TrainerDAO();
        ManagerDAO db = new ManagerDAO();
        
        String action = request.getParameter("action");
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        boolean status = request.getParameter("status") != null;
        String video = request.getParameter("video");
        String description = request.getParameter("description");
        
        HttpSession session = request.getSession();
        int chapter = Integer.parseInt(request.getParameter("chapter"));
        int classid = Integer.parseInt(request.getParameter("classid"));
        
        if (action.equals("add")) {
            if (td.addLesson(title, chapter, type, status, video, description, acc.getId()))
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
            
            int lesson = db.getId("lesson");
            
            td.addExtraLessonForClass(classid, lesson);
            
            if (type.equals("Quiz")) {
                int quiz = Integer.parseInt(request.getParameter("quiz"));
                int duration = Integer.parseInt(request.getParameter("duration"));
                int passVal = Integer.parseInt(request.getParameter("pass-val"));
                int maxAttempt = Integer.parseInt(request.getParameter("max-attempt"));
                
                response.getWriter().println(request.getParameter("quiz"));
                response.getWriter().println(request.getParameter("duration"));
                response.getWriter().println(request.getParameter("pass-val"));
                response.getWriter().println(request.getParameter("max-attempt"));
                
                db.addQuizLesson(lesson, quiz, duration, passVal, maxAttempt);
            } else if (type.equals("Assignment")) {
                String duedate = request.getParameter("due-date");
                
                response.getWriter().println(duedate);
                td.addAssignment(lesson, classid, duedate);
            }
        }
        
        response.sendRedirect("class-dashboard?subject=" + request.getParameter("subject") + "&classid=" + classid + "&chapter=" + request.getParameter("chapternum"));
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
