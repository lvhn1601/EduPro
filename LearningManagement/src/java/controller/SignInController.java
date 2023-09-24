/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import consts.IConstants;
import static consts.IConstants.GOOGLE_LOGIN_HREF;
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
import utils.Helper;
import static utils.Helper.getToken;
import static utils.Helper.getUserInfo;
import utils.Mail;

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
            UserGoogleDto user = getUserInfo(accessToken);
            System.out.println(user);
            boolean foundMatch = false;

            for (Account a : accs) {
                if (user.getEmail().equals(a.getEmail())) {

//                    accountDAO.updateGoogleAcc(user.getName(), user.getPicture(), user.getId(), user.getEmail());
                    
                    response.sendRedirect("/LearningManagement");
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
                    String otp = Helper.genRandSixDigit();
                    session.setAttribute("systemOtp", otp);
                    session.setAttribute("user", user);
                    Mail.send(user.getEmail(), "OTP to sign up", otp);
                    response.sendRedirect("otp-confirmation");
                    return;
                } else {
                    request.setAttribute("msg", "Invalid domain!");
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
        AccountDAO accountDAO = new AccountDAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Account account = accountDAO.authenticate(username, password);
        if (account == null) {
            request.setAttribute("msg", "Sign in fail username or pasword");
            request.getRequestDispatcher("sign-in.jsp").forward(request, response);
        } else {
            response.sendRedirect("/LearningManagement");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
