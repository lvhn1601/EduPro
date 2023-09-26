/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;
import model.Account;

/**
 *
 * @author acer
 */
@WebServlet(name = "ProfileController", urlPatterns = {"/profile"})
public class ProfileController extends HttpServlet {

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
            out.println("<title>Servlet ProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileController at " + request.getContextPath() + "</h1>");
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
           AdminDAO adminDAO = new AdminDAO();
        
     
        request.setAttribute("domains", listDomains(adminDAO.getDomains()));
        Account account = (Account) session.getAttribute("accountCur");
        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        String type = request.getParameter("type");
        Account account = (Account) session.getAttribute("accountCur");
        
        switch (type) {
            case "changePassword": {
                String oldPass = request.getParameter("oldPass");
                String newPass = request.getParameter("newPass");
                String reNewPass = request.getParameter("reNewPass");
              if (account.getPassword()!=null && !oldPass.equals(account.getPassword())) {
                    session.setAttribute("msgchangePassword", "Password is wrong, please again");
                }else if(account.getPassword() == null||oldPass.equals(account.getPassword())) {
                        boolean isChangePasswordSuccess = accountDAO.changePassword(account.getId(), newPass);
                        if (isChangePasswordSuccess) {
                            account.setPassword(newPass);
                            session.setAttribute("accountCur", account);
                            session.setAttribute("msgchangePassword", "Change password Success");
                        } else {
                            session.setAttribute("msgchangePassword", "Change password Fail");
                        }
                    }
              else {
                    if (!newPass.equals(reNewPass)) {
                        session.setAttribute("msgchangePassword", "Renew Password is not match");
                    } 
                }
                break;
            }
            
            case "changeInformation": {
                
                String accountName = request.getParameter("accountName");
                Date accountDob = request.getParameter("accountDob").equals("") ? null : Date.valueOf(request.getParameter("accountDob"));
                String accountEmail = request.getParameter("accountEmail");
                String accountPhone = request.getParameter("accountPhone");
                String currentPhone = request.getParameter("currentPhone");
                String currentEmail = request.getParameter("currentEmail");
                
                if (!accountEmail.equals("") && adminDAO.emailExist(accountEmail)&& !currentEmail.equals(accountEmail)) {
                    session.setAttribute("msgchangeInformation", "Email already exist!");
                } else if (!accountPhone.equals("")  && adminDAO.phoneExist(accountPhone)&& !currentPhone.equals(accountPhone)) {
                    session.setAttribute("msgchangeInformation", "Phone number already exist!");
                    
                } else {
                    account.setName(accountName);
                    account.setDob(accountDob);
                    account.setEmail(accountEmail);
                    account.setPhone(accountPhone);
                    boolean isChangeInformationSuccess = accountDAO.update(account, account.getId());
                    session.setAttribute("accountCur", account);
                    if (isChangeInformationSuccess) {
                        session.setAttribute("msgchangeInformation", "Change Information Success");
                    } else {
                        session.setAttribute("msgchangeInformation", "Change Information Fail");
                    }
                }
                    break;
                    
                }
            
            
            case "changeAvatar": {
                String accountAvatarurl = request.getParameter("accoutAvatarUrl");
                account.setAvatar_url(accountAvatarurl);
                boolean isChangeAvatar = accountDAO.update(account, account.getId());
                session.setAttribute("accountCur", account);
                if (isChangeAvatar) {
                    session.setAttribute("msgchangeAvatar", "Change Avatar Success");
                } else {
                    session.setAttribute("msgchangeAvatar", "Change Avatar Fail");
                }
                break;
            }
        }

        response.sendRedirect("profile");
            
        }

        public String listDomains(List<String> list) {
        String str = "";
        
        for (String s : list)
            str += "'" + s + "',";
        
        return "[" + str.substring(0, str.length()-1) + "]";
    }
    }
