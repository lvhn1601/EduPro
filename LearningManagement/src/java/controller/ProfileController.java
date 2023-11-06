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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.sql.Date;
import java.util.List;
import model.Account;

/**
 *
 * @author acer
 */
@WebServlet(name = "ProfileController", urlPatterns = {"/profile"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
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
    private static final long serialVersionUID = 1L;

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
                if (account.getPassword() != null && !oldPass.equals(account.getPassword())) {
                    session.setAttribute("msgchangePassword", "Password is wrong, please again");
                } else if (account.getPassword() == null || oldPass.equals(account.getPassword())) {
                    boolean isChangePasswordSuccess = accountDAO.changePassword(account.getId(), newPass);
                    if (isChangePasswordSuccess) {
                        account.setPassword(newPass);
                        session.setAttribute("accountCur", account);
                        session.setAttribute("msgchangePassword", "Change password Success");
                    } else {
                        session.setAttribute("msgchangePassword", "Change password Fail");
                    }
                } else {
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

                if (!accountEmail.equals("") && adminDAO.emailExist(accountEmail) && !currentEmail.equals(accountEmail)) {
                    session.setAttribute("msgchangeInformation", "Email already exist!");
                } else if (!accountPhone.equals("") && adminDAO.phoneExist(accountPhone) && !currentPhone.equals(accountPhone)) {
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
                boolean isChangeAvatar = false;
                String uploadedFileName = null;

                for (Part part : request.getParts()) {
                    String fileName = extractFileName(part);
                    if (!fileName.isEmpty()) {

                        fileName = new File(fileName).getName();
                        part.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
                        uploadedFileName = fileName;
                        isChangeAvatar = true;
                    }
                }

                if (isChangeAvatar) {

                    String newAvatarUrl = request.getContextPath() + "/file/" + uploadedFileName;
                    System.out.println(request.getParameter("accountId"));
                    int accountId = Integer.parseInt(request.getParameter("accountId"));

                    accountDAO.uploadAvatar(accountId, newAvatarUrl);

                    account.setAvatar_url(newAvatarUrl);

                    request.setAttribute("message", "Upload File Success!");
                    request.getSession().setAttribute("accountCur", account);
                    request.getSession().setAttribute("msgchangeAvatar", "Change Avatar Success");
                } else {
                    request.setAttribute("message", "No file selected");
                    request.getSession().setAttribute("msgchangeAvatar", "Change Avatar Fail");
                }

                break;
            }

        }

        response.sendRedirect("profile");

    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public File getFolderUpload() {
        String readPart = getServletContext().getRealPath("/");
        String partUpload = readPart.replace("build\\", "") + "file";
        File folderUpload = new File(partUpload);
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

    public String listDomains(List<String> list) {
        String str = "";

        for (String s : list) {
            str += "'" + s + "',";
        }

        return "[" + str.substring(0, str.length() - 1) + "]";
    }
}
