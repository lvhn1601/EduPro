/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ClassDAO;
import dao.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Account;
import model.Assignment;
import model.AssignmentSubmit;
import model.Chapter;

/**
 *
 * @author dell
 */
@WebServlet(name = "AssignmentDetailController", urlPatterns = {"/assignment-detail"})
public class AssignmentDetailController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AssignmentSubmit</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AssignmentSubmit at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ClassDAO classDAO = new ClassDAO();
        Account accountCur = (Account) session.getAttribute("accountCur");
        int asmId = Integer.parseInt(request.getParameter("id"));
        Assignment asm = classDAO.getAsmById(asmId);
        AssignmentSubmit asmSub = classDAO.getAsmSubmitted(asmId, accountCur.getId());
        if (asmSub != null) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime timeSubmit = LocalDateTime.parse(asmSub.getSubmitTime(), formatter);
            LocalDateTime timeDueDate = LocalDateTime.parse(asm.getDueDate(), formatter);
            int comparison = timeSubmit.compareTo(timeDueDate);

            if (comparison < 0) {
                request.setAttribute("msg", "Submitted");
            } else if (comparison >= 0) {
                request.setAttribute("msg", "Late");
            }
        } else {
            request.setAttribute("msg", "Missing");
        }

        request.setAttribute("asmSub", asmSub);
        request.setAttribute("asm", asm);
        
        StudentDAO sd = new StudentDAO();
        
        // Data cho Sidebar
        int sid = Integer.parseInt(request.getParameter("subject"));
        List<model.Class> listClasses = sd.getClassList(accountCur.getId(), sid);
        
        if (accountCur.getRole().getId() == 4) {
            request.setAttribute("classList", listClasses);
        }
        
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
        
        request.getRequestDispatcher("assignment-detail.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
