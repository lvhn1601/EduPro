/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.sun.org.apache.xerces.internal.impl.dv.xs.DateTimeDV;
import connection.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.AssignmentDiscussion;
import model.AssignmentSubmit;
import model.Lesson;
import model.QuizResult;

/**
 *
 * @author acer
 */
public class ShowAssigmentSubmitDAO extends DBContext {

    public List<AssignmentSubmit> getSubmitAssignmentByAccountId(int accountId) {
        String sql = "select * from assignment_submit s inner join lesson l on s.assignment_id = l.lesson_id where submitter_id = ?";

        List<AssignmentSubmit> listAsm = new ArrayList<>();

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AssignmentSubmit asm = AssignmentSubmit.builder()
                        .lessonId(Lesson.builder()
                                .id(rs.getInt("lesson_id"))
                                .title(rs.getString("lesson_title"))
                                .description(rs.getString("lesson_description"))                                
                                .build())
                       
                        .submitScore(rs.getFloat("submit_score"))
                        .submitTime(rs.getString("submit_at"))
                        .build();
                listAsm.add(asm);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listAsm;
    }
    
    public List<QuizResult> getSubmitQuizzByAccountId(int accountId) {
        String sql = "select *  from quiz_submit q inner join quiz a on q.quiz_id = a.quiz_id inner join lesson l on q.quiz_id = l.lesson_id where submitter_id = ?";

        List<QuizResult> listAsm = new ArrayList<>();

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                QuizResult asm = QuizResult.builder()
                        .lesson(Lesson.builder()
                                .title(rs.getString("lesson_title"))
                                .build())
                        .score(rs.getFloat("quizsubmit_score"))
                        .submit_at(rs.getString("submit_at"))                       
                        .build();
                listAsm.add(asm);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listAsm;
    }
    public static void main(String[] args) {
        System.out.println(new ShowAssigmentSubmitDAO().getSubmitAssignmentByAccountId(9));
    }

}
