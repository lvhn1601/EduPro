/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.manager;

import dao.ManagerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Iterator;
import model.Account;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author tango
 */
@WebServlet(name="QuestionImportServlet", urlPatterns={"/manager/question-import"})
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 1024, // 
    maxRequestSize = 1024 * 1024 * 1024 // 
)
public class QuestionImportServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ImportQuestionServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImportQuestionServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
        
        request.setAttribute("subjects", db.getListSubjects(acc.getId()));
        
        request.getRequestDispatcher("question-import.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
        
        int id;        
        boolean status = true;
        int subject = Integer.parseInt(request.getParameter("subject"));
        int chapter = Integer.parseInt(request.getParameter("chapter"));
        int lesson = Integer.parseInt(request.getParameter("lesson"));
        int dimension = Integer.parseInt(request.getParameter("dimension"));

        // Get the file upload part
        Part filePart = request.getPart("file");
        
         // Get an input stream for the file upload part
        InputStream inputStream = filePart.getInputStream();
        
        // Read the Excel file
        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
        
        //Get first sheet from the workbook
        XSSFSheet sheet = workbook.getSheetAt(0);
        Iterator<Row> rowIterator = sheet.iterator();
   
        while (rowIterator.hasNext()) {
            Row row = rowIterator.next();
            String detail = row.getCell(0).getStringCellValue();
            String adetails[] = {row.getCell(1).getStringCellValue(), 
                                row.getCell(2).getStringCellValue(), 
                                row.getCell(3).getStringCellValue(), 
                                row.getCell(4).getStringCellValue()};
            
            int correct = 0;
            switch(row.getCell(5).getStringCellValue()) {
                case "A": {
                    correct = 0;
                    break;
                }
                case "B": {
                    correct = 1;
                    break;
                }
                case "C": {
                    correct = 2;
                    break;
                }
                case "D": {
                    correct = 3;
                    break;
                }
            } 
            db.addQuestion(subject, chapter, lesson, detail, status, acc.getId());
            int questionId = db.getTopQuestionId();
            db.addQuestionDimension(questionId, dimension);
            for(int i=0; i<adetails.length; i++) {
                if(i == correct) {
                    db.addAnswer(adetails[i], true, questionId);
                } else db.addAnswer(adetails[i], false, questionId);
            }
        }
        request.setAttribute("message", "Import question successfully");
        request.setAttribute("subjectId", subject);
        request.getRequestDispatcher("success.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
