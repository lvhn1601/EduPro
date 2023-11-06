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
import model.Account;
import model.Alert;

/**
 *
 * @author lvhn1
 */
@WebServlet(name = "QuestionDetailsServlet", urlPatterns = {"/manager/question-details"})
public class QuestionDetailsServlet extends HttpServlet {

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
            out.println("<title>Servlet QuestionDetailsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuestionDetailsServlet at " + request.getContextPath() + "</h1>");
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
        Account acc = (Account) request.getSession().getAttribute("accountCur");
        ManagerDAO db = new ManagerDAO();

        HttpSession session = request.getSession();
        request.setAttribute("alert", session.getAttribute("alert"));
        session.removeAttribute("alert");

        request.setAttribute("subjects", db.getListSubjects(acc.getId()));

        if (request.getParameter("action").equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("question", db.getQuestionWithId(id));
        }

        request.getRequestDispatcher("question-details.jsp").forward(request, response);
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
        Account acc = (Account) request.getSession().getAttribute("accountCur");
        ManagerDAO db = new ManagerDAO();

        HttpSession session = request.getSession();

        String action = request.getParameter("action");

        int id;
        int dimension = Integer.parseInt(request.getParameter("dimension"));
        String detail = request.getParameter("detail");
        boolean status = request.getParameter("status").equals("true");

        if (action.equals("add")) {
            int subject = Integer.parseInt(request.getParameter("subject"));
            int chapter = Integer.parseInt(request.getParameter("chapter"));
            int lesson = Integer.parseInt(request.getParameter("lesson"));

            if (db.addQuestion(subject, chapter, lesson, detail, status, acc.getId())) {
                session.setAttribute("alert", Alert.builder()
                        .type(true)
                        .message("You have added new question successfully!")
                        .build()
                );
            } else {
                session.setAttribute("alert", Alert.builder()
                        .type(false)
                        .message("Add new question failed! Please try again...")
                        .build()
                );

                response.sendRedirect("question-details?action=add");
                return;
            }

            id = db.getId("question");
            if (!db.addQuestionDimension(id, dimension)) {
                session.setAttribute("alert", Alert.builder()
                        .type(false)
                        .message("Failed to add dimensions to question!")
                        .build()
                );
            }
        } else {
            id = Integer.parseInt(request.getParameter("id"));
            if (db.updateQuestion(id, detail, status, acc.getId())) {
                session.setAttribute("alert", Alert.builder()
                        .type(true)
                        .message("You have updated question " + id + " successfully!")
                        .build()
                );
            } else {
                session.setAttribute("alert", Alert.builder()
                        .type(false)
                        .message("Update question " + id + " failed! Please try again...")
                        .build()
                );

                response.sendRedirect("question-details?action=update&id=" + id);
                return;
            }

            if (!db.updateQuestionDimension(id, dimension)) {
                session.setAttribute("alert", Alert.builder()
                        .type(false)
                        .message("Failed to update dimensions of question!")
                        .build()
                );
            }
        }

        String[] aids = request.getParameterValues("answer-id");
        String[] adetails = request.getParameterValues("answer-detail");
        String[] acorrect = request.getParameterValues("answer-correct");
        String[] aremoves = request.getParameterValues("answer-remove");

        boolean alert = true;

        if (aids != null) {
            for (int i = 0; i < aids.length; i++) {
                int aid = Integer.parseInt(aids[i]);
                if (aid == 0 && !aremoves[i].equals("yes")) {
                    if (!db.addAnswer(adetails[i], acorrect[i].equals("true"), id)) {
                        alert = false;
                    }
                } else if (aid != 0) {
                    if (aremoves[i].equals("yes")) {
                        if (!db.deleteAnswer(aid)) {
                            alert = false;
                        }
                    } else {
                        if (!db.updateAnswer(aid, adetails[i], acorrect[i].equals("true"))) {
                            alert = false;
                        }
                    }
                }
            }

            if (!alert) {
                session.setAttribute("alert", Alert.builder()
                        .type(false)
                        .message("Add list answers to question have some problems. Please check again!")
                        .build()
                );
            }
        }

        response.sendRedirect("question-details?action=add");
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
