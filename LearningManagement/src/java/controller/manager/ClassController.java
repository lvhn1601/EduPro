/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dao.AccountDAO;
import dao.AdminDAO;
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
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Class;
import model.Setting;
import model.Subject;

/**
 *
 * @author acer
 */
@WebServlet(name = "ClassController", urlPatterns = {"/manager/class"})
public class ClassController extends HttpServlet {

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
            out.println("<title>Servlet ClassController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClassController at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ManagerDAO managerDAO = new ManagerDAO();
        List<Subject> listSubject = managerDAO.getSubject();
        List<Account> listTrainer = managerDAO.getTrainer();
        List<Setting> listSemester = managerDAO.getSemester();

        // Trang hiện tại (lấy từ tham số truy vấn "page")
        int curPage = 1;
        int pageSize = 8;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            curPage = Integer.parseInt(pageParam);
        }
        int start = (curPage - 1) * pageSize;

        String searchKeyword = request.getParameter("search");
        List<Class> listClass = new ArrayList<>();
        int totalClasses;
        int totalPages;

        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            listClass = managerDAO.searchClasses(searchKeyword);
        } else {
            // Nếu không có tìm kiếm, hiển thị tất cả các lớp
            listClass = managerDAO.getClassesForPage(start, pageSize);
        }

        totalClasses = managerDAO.getTotalClasses();
        totalPages = (int) Math.ceil((double) totalClasses / pageSize);

        Account account = (Account) session.getAttribute("accountCur");

        request.setAttribute("listClass", listClass);
        request.setAttribute("listSubject", listSubject);
        request.setAttribute("listTrainer", listTrainer);
        request.setAttribute("listSemester", listSemester);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("list-class.jsp").forward(request, response);
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

        AccountDAO accountDAO = new AccountDAO();
        AdminDAO adminDAO = new AdminDAO();
        ManagerDAO managerDAO = new ManagerDAO();

        List<Class> listClass = (List<Class>) session.getAttribute("listClass");

        Account account = (Account) session.getAttribute("accountCur");

        String type = request.getParameter("type");
        switch (type) {
            case "addClass": {
                List<Subject> listSubject = (List<Subject>) session.getAttribute("listSubject");
                List<Account> listTrainer = (List<Account>) session.getAttribute("listTrainer");
                List<Setting> listSemester = (List<Setting>) session.getAttribute("listSemester");

                String className = request.getParameter("className");
                int subjectId = Integer.parseInt(request.getParameter("classSubject"));
                int semesterId = Integer.parseInt(request.getParameter("classSemester"));
                int trainerId = Integer.parseInt(request.getParameter("classTrainer"));
                Date dateStart = request.getParameter("dateStart").equals("") ? null : Date.valueOf(request.getParameter("dateStart"));
                Date dateEnd = request.getParameter("dateEnd").equals("") ? null : Date.valueOf(request.getParameter("dateEnd"));
                String classStatusString = request.getParameter("status");
                boolean classStatus = false;
                if (classStatusString != null && classStatusString.equals("active")) {
                    classStatus = true;
                }
                LocalDateTime currentTime = LocalDateTime.now();

                boolean addClassSuccess = managerDAO.addClass(className, subjectId, semesterId, trainerId, classStatus, dateStart, dateEnd, account.getId(), currentTime);
                session.setAttribute("listClass", listClass);
                if (addClassSuccess) {
                    session.setAttribute("msgAddClass", "Add Class Success");
                } else {
                    session.setAttribute("msgAddClass", "Add Class Fail");
                }

                break;
            }
            case "updateClassDetail": {
                List<Subject> listSubject = (List<Subject>) session.getAttribute("listSubject");
                List<Account> listTrainer = (List<Account>) session.getAttribute("listTrainer");
                List<Setting> listSemester = (List<Setting>) session.getAttribute("listSemester");

                break;
            }

        }
        response.sendRedirect("/LearningManagement/manager/class");
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
