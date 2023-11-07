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
import jakarta.servlet.http.Cookie;
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

    private static final String REMEMBER_ME_COOKIE_USERNAME = "rememberMeUsername";
    private static final String REMEMBER_ME_COOKIE_PASSWORD = "rememberMePasword";
    private static final int REMEMBER_ME_COOKIE_MAX_AGE = 3600 * 24 * 30;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        String username = null;
        String password = null;

        HttpSession session = request.getSession();
        AccountDAO accountDAO = new AccountDAO();
        ArrayList<Account> accs = accountDAO.getAll();
        SettingDAO settingdao = new SettingDAO();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(REMEMBER_ME_COOKIE_USERNAME)) {
                    username = cookie.getValue();
                }
                if (cookie.getName().equals(REMEMBER_ME_COOKIE_PASSWORD)) {
                    password = cookie.getValue();
                }
            }
            Account account = accountDAO.authenticate(username, password);
            if (account != null) {
                session.setAttribute("accountCur", account);
                if (account.getRole().getId() == 4) {
                    response.sendRedirect("/LearningManagement/assignment-detail?id=35");
                }
                if (account.getRole().getId() == 1) {
                    response.sendRedirect("admin/users");
                }
                if (account.getRole().getId() == 2) {
                    response.sendRedirect("manager/subject-list");
                }
                if (account.getRole().getId() == 3) {
                    response.sendRedirect("assignment?classId=1");
                }
                return;
            }
        }

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
                    if (account.getRole().getId() == 3) {
                        response.sendRedirect("/LearningManagement");
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
        boolean isRemeberMe = request.getParameter("isRemeberMe") != null;

        Account account = accountDAO.authenticate(username, password);
        if (account == null) {
            request.setAttribute("msg", "Sign in fail username or password");
            request.getRequestDispatcher("sign-in.jsp").forward(request, response);
        } else {
            session.setAttribute("accountCur", accountDAO.getOneByAccountId(account.getId()));
//            System.out.println(accountDAO.getOneByAccountId(account.getId()));
//            System.out.println(account.getRole().getId());
            if (isRemeberMe) {
                Cookie cookieUsername = new Cookie(REMEMBER_ME_COOKIE_USERNAME, username);
                cookieUsername.setMaxAge(REMEMBER_ME_COOKIE_MAX_AGE);
                Cookie cookiePassword = new Cookie(REMEMBER_ME_COOKIE_PASSWORD, password);
                cookiePassword.setMaxAge(REMEMBER_ME_COOKIE_MAX_AGE);
                response.addCookie(cookieUsername);
                response.addCookie(cookiePassword);
            }
            if (account.getRole().getId() == 4) {
                response.sendRedirect("/LearningManagement");
            }
            if (account.getRole().getId() == 1) {
                response.sendRedirect("admin/users");
            }
            if (account.getRole().getId() == 2) {
                response.sendRedirect("manager/subject-list");
            }
            if (account.getRole().getId() == 3) {
                response.sendRedirect("/LearningManagement");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
