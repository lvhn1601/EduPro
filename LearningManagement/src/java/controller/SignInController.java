/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import consts.IConstants;
import dao.AccountDAO;
import dao.SettingDAO;
import dto.UserGoogleDto;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Setting;
import static utils.Helper.getToken;
import static utils.Helper.getUserInfo;

public class SignInController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountDAO accountDAO = new AccountDAO();
        ArrayList<Account> accs = accountDAO.getAll();
        SettingDAO settingdao = new SettingDAO();

        if (request.getParameter("code") != null) {
            String code = request.getParameter("code");

            String accessToken = getToken(code);
            // Tiếp tục xử lý với access token

            UserGoogleDto user = getUserInfo(accessToken);
//            System.out.println(user);
            boolean foundMatch = false;

            for (Account a : accs) {
                if (user.getEmail().equals(a.getEmail())) {
                    Account account = accountDAO.getOneByEmail(user.getEmail());

//                    accountDAO.updateGoogleAcc(user.getName(), user.getPicture(), user.getId(), user.getEmail());
                    session.setAttribute("accountCur", accountDAO.getOneByEmail(user.getEmail()));
                    if (account.getRole().getId() == 4) {
                        response.sendRedirect("/LearningManagement");
                    }
                    if (account.getRole().getId() == 1) {
                        response.sendRedirect("admin/users");
                    }
                    if (account.getRole().getId() == 2) {
                        response.sendRedirect("manager/subject-list");
                    }
                    foundMatch = true;
                    return;
                }
            }

            if (!foundMatch) {
                List<Setting> list = settingdao.getListDomain();
                List<String> domains = new ArrayList<>();
                for (Setting s : list) {
                    domains.add(s.getTitle());
                }
                String email = user.getEmail();
                int atIndex = email.indexOf('@');
                String domain = email.substring(atIndex + 1);

                if (domains.contains(domain)) {
                    accountDAO.registerGoogleAcc(user);
                    accountDAO.updateGoogleAcc(user.getName(), user.getPicture(), user.getId(), user.getEmail());
                    session.setAttribute("accountCur", accountDAO.getOneByEmail(user.getEmail()));
                    response.sendRedirect("/LearningManagement");
                    return;
                } else {
                    request.setAttribute("msg", "Invalid domain!");
                    request.getSession().setAttribute("msg", "Invalid domain!");
                    response.sendRedirect("sign-in");
                    return;
                }

            }

        } else {
            request.setAttribute("GOOGLE_LOGIN_HREF", IConstants.GOOGLE_LOGIN_HREF);
        }
        request.getRequestDispatcher("sign-in.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountDAO accountDAO = new AccountDAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Account account = accountDAO.authenticate(username, password);
        if (account == null) {
            request.setAttribute("msg", "Sign in fail username or password");
            request.getRequestDispatcher("sign-in.jsp").forward(request, response);
        } else {
            session.setAttribute("accountCur", accountDAO.getOneByAccountId(account.getId()));
//            System.out.println(accountDAO.getOneByAccountId(account.getId()));
//            System.out.println(account.getRole().getId());
            if (account.getRole().getId() == 4) {
                response.sendRedirect("/LearningManagement");
            }
            if (account.getRole().getId() == 1) {
                response.sendRedirect("admin/users");
            }
            if (account.getRole().getId() == 2) {
                response.sendRedirect("manager/subject-detail-management");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
