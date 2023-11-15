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
import model.Account;
import model.AssignmentDiscussion;

/**
 *
 * @author acer
 */
public class AssignmentDiscussionDAO extends DBContext {

    public void insertAssignmentDiscussion(AssignmentDiscussion obj) {
        String sql = " INSERT INTO assignment_discussion (lesson_id, account_id, comment_value, create_at) VALUES (?, ?, ?, Now())";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, obj.getLessonId());
            ps.setInt(2, obj.getAccount().getId());
            ps.setString(3, obj.getCommentValue());
            int rs = ps.executeUpdate();

            if (rs > 0) {

            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    public ArrayList<AssignmentDiscussion> getAllAssignmentDiscussionByLessonId(int lessonId) {
        ArrayList<AssignmentDiscussion> ad = new ArrayList<>();
        String sql = "SELECT * FROM testiter3.assignment_discussion ad INNER JOIN account a ON a.account_id = ad.account_id WHERE lesson_id = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, lessonId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AssignmentDiscussion a = AssignmentDiscussion.builder()
                        .assignmentDiscussionId(rs.getInt("assignment_discussion_id"))
                        .lessonId(rs.getInt("lesson_id"))
                        .account(Account.builder()
                                .id(rs.getInt("account_id"))
                                .name(rs.getString("account_name"))
                                .avatar_url(rs.getString("account_avatar_url"))
                                .build())
                        .commentValue(rs.getString("comment_value"))
                        .createAt(rs.getString("create_at"))
                        .build();
                ad.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return ad;
    }
    public static void main(String[] args) {
        System.out.println(new AssignmentDiscussionDAO().getAllAssignmentDiscussionByLessonId(35));
    }
}
