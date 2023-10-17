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
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Chapter;
import model.Dimension;
import model.Subject;

/**
 *
 * @author dell
 */
//@WebServlet(name = "SubjectDetailManagementController", urlPatterns = {"manager/subject-detail-management"})
public class SubjectDetailManagementController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SubjectManagerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectManagerController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account accountCur = (Account) session.getAttribute("accountCur");
        ManagerDAO managerDAO = new ManagerDAO();
        List<Subject> subjects = managerDAO.getListSubject(accountCur.getId());
        if (request.getParameter("id") != null) {
            int subjectId = Integer.parseInt(request.getParameter("id"));
            Subject subject = managerDAO.getSubjectById(subjectId);

            List<Chapter> chapters = new ManagerDAO().getChapterBySubject(subjectId);
            List<Dimension> dimensions = new ManagerDAO().getDimensionBySubject(subjectId);
            String action = request.getParameter("action");
            System.out.println(chapters);
            // Kiểm tra xem có chuyển hướng với tham số "deleteType" không
            String deleteType = request.getParameter("deleteType");

            if (action != null && action.equals("delete-dimension")) {

                int dimensionId = Integer.parseInt(request.getParameter("did"));
                managerDAO.deleteDimension(dimensionId);
                // Chuyển hướng với tham số "deleteType"
                response.sendRedirect("subject-detail-management?id=" + subjectId + "&deleteType=dimension");
                return;
            }
            if (action != null && action.equals("delete-chapter")) {

                int chapterId = Integer.parseInt(request.getParameter("cid"));
                managerDAO.deleteChapter(chapterId);
                // Chuyển hướng với tham số "deleteType"
                response.sendRedirect("subject-detail-management?id=" + subjectId + "&deleteType=chapter");
                return;
            }

            System.out.println(subjectId);
            request.setAttribute("subjects", subjects);
            request.setAttribute("dimensions", dimensions);
            request.setAttribute("chapters", chapters);
            request.setAttribute("subject", subject);

            // Đặt giá trị "deleteType" vào request để sử dụng trong JSP
            request.setAttribute("deleteType", deleteType);

            request.getRequestDispatcher("subject-detail-management.jsp").forward(request, response);
        } else {
            request.setAttribute("subjects", subjects);
            int firstId = subjects.get(0).getId();
            response.sendRedirect("subject-detail-management?id=" + firstId);
//            request.getRequestDispatcher("subject-detail-management.jsp").forward(request, response);
        }
    }

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ManagerDAO managerDAO = new ManagerDAO();
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        System.out.println(subjectId);
        String action = request.getParameter("action");
        Account accountCur = (Account) session.getAttribute("accountCur");
        System.out.println(accountCur.getName());
        switch (action) {

            case "update-chapter":
                int id = Integer.parseInt(request.getParameter("id"));
                Chapter chapter = Chapter.builder()
                        .title(request.getParameter("title"))
                        .description(request.getParameter("description"))
                        .status("active".equals(request.getParameter("status")))
                        .build();
                managerDAO.updateChapter(chapter, id, accountCur.getId());

                response.sendRedirect("subject-detail-management?id=" + subjectId + "&updateType=" + "chapter");
                break;

            case "update-dimension":
                int idD = Integer.parseInt(request.getParameter("id"));
                Dimension dimension = Dimension.builder()
                        .type(request.getParameter("title"))
                        .name(request.getParameter("description"))
                        .status("active".equals(request.getParameter("status")))
                        .build();
                managerDAO.updateDimension(dimension, idD, accountCur.getId());
                response.sendRedirect("subject-detail-management?id=" + subjectId + "&updateType=" + "dimension");
                break;
            case "add-chapter":
                Chapter chapterAdd = Chapter.builder()
                        .title(request.getParameter("title"))
                        .description(request.getParameter("description"))
                        .build();
                managerDAO.addChapter(chapterAdd, accountCur.getId(), subjectId);
                response.sendRedirect("subject-detail-management?id=" + subjectId + "&addType=" + "chapter");
                break;
            case "add-dimension":
                Dimension dimensionAdd = Dimension.builder()
                        .type(request.getParameter("title"))
                        .name(request.getParameter("description"))
                        .build();
                managerDAO.addDimension(dimensionAdd, accountCur.getId(), subjectId);
                response.sendRedirect("subject-detail-management?id=" + subjectId + "&addType=" + "dimension");
                break;
            default:
                throw new AssertionError();
        }

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
