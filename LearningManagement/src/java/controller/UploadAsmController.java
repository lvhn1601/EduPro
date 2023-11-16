package controller;

import dao.ClassDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Account;
import model.AssignmentSubmit;
import model.Lesson;

@WebServlet(name = "UploadAsmController", urlPatterns = {"/upload-asm"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
public class UploadAsmController extends HttpServlet {

    PrintWriter out = null;

    HttpSession session = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        ClassDAO classDAO = new ClassDAO();

        int asmId = Integer.parseInt(request.getParameter("asmId"));
        int accId = Integer.parseInt(request.getParameter("accId"));
        int classid = Integer.parseInt(request.getParameter("classid"));
        int subject = Integer.parseInt(request.getParameter("subject"));
        AssignmentSubmit asmSub = classDAO.getAsmSubmitted(asmId, accId);
        if (asmSub != null) {
            classDAO.deleteSubmit(asmId, accId);
        }
        System.out.println(asmId);
        System.out.println(accId);

        out = response.getWriter();
        session = request.getSession(false);
        String folderName = "resources";
        String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName;
        File dir = new File(uploadPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        Part filePart = request.getPart("file");

        String fileName = filePart.getSubmittedFileName();
        String path = folderName + File.separator + fileName;
        InputStream is = filePart.getInputStream();
        Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
        AssignmentSubmit asm = AssignmentSubmit.builder()
                .lessonId(Lesson.builder().id(asmId).build())
                .submitterId(Account.builder().id(accId).build())
                .submitUrl(path)
                .build();

        classDAO.insertAssignment(asm);
        session.setAttribute("fileName", fileName);
//        String msg = "" + fileName + " File uploaded successfully...";
//        request.setAttribute("msg", msg);
        response.sendRedirect("assignment-detail?id=" + asmId + "&subject=" + subject + "&classid=" + classid);

    }

}
