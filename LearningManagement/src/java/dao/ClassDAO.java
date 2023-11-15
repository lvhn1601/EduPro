/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Assignment;
import model.AssignmentSubmit;
import model.Class;
import model.Lesson;
import model.Quiz;

/**
 *
 * @author dell
 */
public class ClassDAO extends DBContext {

    public int countSubmit(int asmId) {
        String sql = "select count(submitter_id) as num from assignment_submit \n"
                + "where assignment_id = ?;";

        int count = 0;

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, asmId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("num");
            }
        } catch (SQLException e) {
        }

        return count;
    }

    public List<AssignmentSubmit> getSubmitInPage(int page_num, int asmId) {
        String sql = "select account_id, account_name, submit_score, submit_attach_url, submit_at from assignment_submit s\n"
                + "inner join account a on a.account_id = s.submitter_id\n"
                + "where assignment_id = ?\n"
                + "limit 8 offset ?";

        List<AssignmentSubmit> listAsm = new ArrayList<>();

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, asmId);
            ps.setInt(2, (page_num - 1) * 8);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AssignmentSubmit asm = AssignmentSubmit.builder()
                        .lessonId(Lesson.builder()
                                .id(asmId)
                                .build())
                        .submitterId(Account.builder()
                                .id(rs.getInt("account_id"))
                                .name(rs.getString("account_name"))
                                .build())
                        .submitScore(rs.getFloat("submit_score"))
                        .submitUrl(rs.getString("submit_attach_url"))
                        .submitTime(rs.getString("submit_at"))
                        .build();
                listAsm.add(asm);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi bằng cách in ra ngoại lệ
        }

        return listAsm;
    }

    public List<Assignment> getAllAsmByClass(int classId) {
        List<Assignment> asms = new ArrayList<>();
        String sql = "SELECT * from assignment_class asm\n"
                + "inner join lesson l on l.lesson_id = asm.assignment_id\n"
                + "inner join class c on c.class_id = asm.class_id\n"
                + "where asm.class_id = ?";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, classId);  // Set the subjectId parameter
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Assignment asm = Assignment.builder()
                        .lessonId(Lesson.builder()
                                .id(rs.getInt("lesson_id"))
                                .title(rs.getString("lesson_title"))
                                .description(rs.getString("lesson_description"))
                                .status(rs.getBoolean("lesson_status"))
                                .build())
                        .classId(Class.builder()
                                .class_name(rs.getString("class_name"))
                                .build())
                        .dueDate(rs.getString("assignment_exprired"))
                        .build();
                asms.add(asm);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return asms;
    }

    public Assignment getAsmById(int asmId) {
        Assignment asm = null;
        String sql = "SELECT * from assignment_class asm\n"
                + "inner join lesson l on l.lesson_id = asm.assignment_id\n"
                + "where assignment_id = ?";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, asmId);  // Set the subjectId parameter
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                asm = Assignment.builder()
                        .lessonId(Lesson.builder()
                                .id(rs.getInt("lesson_id"))
                                .title(rs.getString("lesson_title"))
                                .description(rs.getString("lesson_description"))
                                .status(rs.getBoolean("lesson_status"))
                                .build())
                        .dueDate(rs.getString("assignment_exprired"))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return asm;
    }

    public Class getClassById(int classId) {
        Class c = null;
        String sql = "select * from class\n"
                + "where class_id = ?";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, classId);  // Set the subjectId parameter
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                c = Class.builder()
                        .class_name(rs.getString("class_name"))
                        .class_id(rs.getInt("class_id"))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return c;
    }

    public void insertAssignment(AssignmentSubmit obj) {
        String sql = " INSERT INTO assignment_submit (assignment_id, submitter_id, submit_attach_url) VALUES (?, ?, ?)";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, obj.getLessonId().getId());
            ps.setInt(2, obj.getSubmitterId().getId());
            ps.setString(3, obj.getSubmitUrl());
            int rs = ps.executeUpdate();

            if (rs > 0) {

            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    public AssignmentSubmit getAsmSubmitted(int asmId, int accId) {
        AssignmentSubmit asm = null;
        String sql = "Select * from assignment_submit where assignment_id = ? and submitter_id = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, asmId);
            ps.setInt(2, accId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                asm = AssignmentSubmit.builder()
                        .lessonId(Lesson.builder().id(asmId).build())
                        .submitterId(Account.builder().id(accId).build())
                        .submitTime(rs.getString("submit_at"))
                        .submitUrl(rs.getString("submit_attach_url"))
                        .submitScore(rs.getFloat("submit_score"))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return asm;
    }

    public boolean updateScore(float score, int asmId, int accId) {
        int check = 0;
        String sql = "UPDATE assignment_submit SET submit_score = ? WHERE assignment_id = ? and  submitter_id = ?";

        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setObject(1, score);
            stm.setObject(2, asmId);
            stm.setObject(3, accId);

            check = stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean deleteSubmit(int asmId, int accId) {
        int check = 0;
        String sql = "delete from assignment_submit where assignment_id = ? and submitter_id = ?";

        try ( PreparedStatement stm = connection.prepareStatement(sql)) {

            stm.setObject(1, asmId);
            stm.setObject(2, accId);
            check = stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public static void main(String[] args) {
        System.out.println(new ClassDAO().getAsmById(35));
    }
}
