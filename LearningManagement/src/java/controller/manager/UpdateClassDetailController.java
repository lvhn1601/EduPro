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
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;
import model.Account;
import model.Setting;
import model.Subject;

/**
 *
 * @author acer
 */
@WebServlet(name = "updateClassDetailController", urlPatterns = {"/manager/class-detail"})
public class UpdateClassDetailController extends HttpServlet {

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
            out.println("<title>Servlet updateClassDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateClassDetailController at " + request.getContextPath() + "</h1>");
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
        ManagerDAO managerDAO = new ManagerDAO();
        int classDetailId = Integer.parseInt((request.getParameter("id")));
        List<Subject> listSubject = managerDAO.getSubject();
        List<Account> listTrainer = managerDAO.getTrainer();
        List<Account> listTrainee = managerDAO.getTrainee(classDetailId);
        List<Setting> listSemester = managerDAO.getSemester();
        List<model.Class> listClass = managerDAO.getAllClass();

        Account account = (Account) session.getAttribute("accountCur");

        request.setAttribute("listSubject", listSubject);
        request.setAttribute("listTrainer", listTrainer);
        request.setAttribute("listTrainee", listTrainee);
        request.setAttribute("listSemester", listSemester);
        request.setAttribute("listClass", listClass);
        request.setAttribute("classDetailId", classDetailId);

        request.getRequestDispatcher("update-class-detail.jsp").forward(request, response);
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
        HttpSession session = request.getSession();

        ManagerDAO managerDAO = new ManagerDAO();
        List<model.Class> listClass = (List<model.Class>) session.getAttribute("listClass");
        Account account = (Account) session.getAttribute("accountCur");

        int classId = Integer.parseInt(request.getParameter("classId"));
        String className = request.getParameter("className");
        int subjectId = Integer.parseInt(request.getParameter("classSubject"));
        int semesterId = Integer.parseInt(request.getParameter("classSemester"));
        int trainerId = Integer.parseInt(request.getParameter("classTrainer"));
        Date classStart = request.getParameter("classStart").equals("") ? null : Date.valueOf(request.getParameter("classStart"));
        Date classEnd = request.getParameter("classEnd").equals("") ? null : Date.valueOf(request.getParameter("classEnd"));
        Boolean classStatus = Boolean.parseBoolean(request.getParameter("classStatus"));
        LocalDateTime currentTime = LocalDateTime.now();

        boolean updateClassSuccess = managerDAO.updateClass(className, subjectId, semesterId, trainerId, classStatus, classStart, classEnd, account.getId(), currentTime, classId);
        session.setAttribute("listClass", listClass);
        if (updateClassSuccess) {
            session.setAttribute("msgUpdateClass", "Update Class Success");
        } else {
            session.setAttribute("msgUpdateClass", "Update Class Fail");
        }

        response.sendRedirect("class-detail?id=" + classId);
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
