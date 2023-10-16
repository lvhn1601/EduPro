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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Chapter;
import model.Dimension;
import model.Lesson;
import model.Question;
import model.Subject;

/**
 *
 * @author dell
 */
public class ManagerDAO extends DBContext {

    public Subject getSubjectById(int subjectId) {
        Subject subject = null;
        String sql = "SELECT\n"
                + "    s.subject_id,\n"
                + "    s.subject_name,\n"
                + "    s.subject_code,\n"
                + "    s.subject_manager_id,\n"
                + "    s.subject_status,\n"
                + "    a.account_id,\n"
                + "    a.account_name,\n"
                + "    d.dimension_id,\n"
                + "    d.dimension_type,\n"
                + "    d.dimension_name\n"
                + "FROM\n"
                + "    subject s\n"
                + "INNER JOIN account a ON a.account_id = s.subject_manager_id\n"
                + "LEFT JOIN dimension d ON s.subject_id = d.dimension_subject_id\n"
                + "WHERE\n"
                + "    s.subject_id = ?;";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, subjectId);  // Set the subjectId parameter
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Dimension d = Dimension.builder()
                        .id(rs.getInt("dimension_id"))
                        .type(rs.getString("dimension_type"))
                        .name(rs.getString("dimension_name"))
                        .build();

                List<Dimension> dimensions = new ArrayList<>();
                dimensions.add(d);

                subject = Subject.builder()
                        .id(rs.getInt("subject_id"))
                        .name(rs.getString("subject_name"))
                        .code(rs.getString("subject_code"))
                        .manager(Account.builder()
                                .id(rs.getInt("account_id"))
                                .name(rs.getString("account_name"))
                                .build())
                        .status(rs.getBoolean("subject_status"))
                        .dimension(dimensions)
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return subject;
    }

    public List<Chapter> getChapterBySubject(int subjectId) {
        List<Chapter> chapters = new ArrayList<>();
        String sql = "SELECT * FROM chapter\n"
                + "where chapter_subject_id = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, subjectId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Chapter chapter = Chapter.builder()
                        .id(rs.getInt("chapter_id"))
                        .title(rs.getString("chapter_title"))
                        .status(rs.getBoolean("chapter_status"))
                        .description(rs.getString("chapter_description"))
                        .build();
                chapters.add(chapter);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return chapters;
    }

    public List<Dimension> getDimensionBySubject(int subjectId) {
        List<Dimension> dimensions = new ArrayList<>();
        String sql = "SELECT * FROM dimension\n"
                + "where dimension_subject_id = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, subjectId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Dimension dimension = Dimension.builder()
                        .id(rs.getInt("dimension_id"))
                        .type(rs.getString("dimension_type"))
                        .status(rs.getBoolean("dimension_status"))
                        .name(rs.getString("dimension_name"))
                        .build();
                dimensions.add(dimension);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return dimensions;
    }

    public List<Subject> getListSubject(int managerId) {
        List<Subject> subjects = new ArrayList<>();
        String sql = "select s.subject_id, s.subject_name from subject s where s.subject_manager_id= ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, managerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Subject subject = Subject.builder()
                        .id(rs.getInt("subject_id"))
                        .name(rs.getString("subject_name"))
                        .build();
                subjects.add(subject);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return subjects;
    }

    public boolean updateChapter(Chapter obj, int id, int accId) {
        int check = 0;
        String sql = "update chapter  \n"
                + "set chapter_title = ?,\n"
                + "chapter_description = ?,\n"
                + "chapter_status = ?,\n"
                + "update_by = ?\n"
                + "where chapter_id = ?";

        try ( PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, obj.getTitle());
            ps.setObject(2, obj.getDescription());
            ps.setObject(3, obj.isStatus());
            ps.setObject(4, accId);
            ps.setObject(5, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean updateDimension(Dimension obj, int id, int accId) {
        int check = 0;
        String sql = "update dimension  \n"
                + "set dimension_type = ?,\n"
                + "dimension_name = ?,\n"
                + "dimension_status = ?,\n"
                + "update_by = ?\n"
                + "where dimension_id = ?";

        try ( PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, obj.getType());
            ps.setObject(2, obj.getName());
            ps.setObject(3, obj.isStatus());
            ps.setObject(4, accId);
            ps.setObject(5, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean deleteDimension(int dimensionId) {
        int check = 0;
        String sql = "DELETE FROM dimension\n"
                + "WHERE dimension_id = ?;";

        try ( PreparedStatement ps = connection.prepareStatement(sql);) {

            ps.setObject(1, dimensionId);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean deleteChapter(int chapterId) {
        int check = 0;
        String sql = "DELETE FROM chapter\n"
                + "WHERE chapter_id = ?;";

        try ( PreparedStatement ps = connection.prepareStatement(sql);) {

            ps.setObject(1, chapterId);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public int addChapter(Chapter obj, int accId, int subjectId) {
        int check = 0;
        String sql = "INSERT INTO `edupro2`.`chapter` (`chapter_title`, `chapter_description`, `chapter_subject_id`, `created_by`, `update_by`) "
                + "VALUES (?, ?, ?, ?, ?);";
        try ( PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, obj.getTitle());
            ps.setObject(2, obj.getDescription());
            ps.setObject(3, subjectId);
            ps.setObject(4, accId);
            ps.setObject(5, accId);
            check = ps.executeUpdate();
            if (check > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                rs.next();
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public int addDimension(Dimension obj, int accId, int subjectId) {
        int check = 0;
        String sql = "INSERT INTO `edupro2`.`dimension` (`dimension_type`, `dimension_name`, `dimension_subject_id`, `created_by`, `update_by`) "
                + "VALUES (?, ?, ?, ?, ?);";
        try ( PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, obj.getType());
            ps.setObject(2, obj.getName());
            ps.setObject(3, subjectId);
            ps.setObject(4, accId);
            ps.setObject(5, accId);
            check = ps.executeUpdate();
            if (check > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                rs.next();
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public List<Question> getListQuestion(int subjectId) {
        List<Question> questions = new ArrayList<>();
        String sql = "SELECT  q.question_id, q.question_detail, q.question_status, l.lesson_title, c.chapter_title\n"
                + "from question q\n"
                + "inner join lesson l on l.lesson_id = q.question_lesson_id\n"
                + "inner join chapter c on c.chapter_id = q.question_chapter_id\n"
                + "where question_subject_id = ? ";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, subjectId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question question = Question.builder()
                        .id(rs.getInt("question_id"))
                        .chapter(Chapter.builder()
                                .title(rs.getString("chapter_title"))
                                .build())
                        .lesson(Lesson.builder()
                                .title(rs.getString("lesson_title"))
                                .build())
                        .status(rs.getBoolean("question_status"))
                        .detail(rs.getString("question_detail"))
                        .build();
                questions.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return questions;
    }

    public static void main(String[] args) {
        System.out.println(new ManagerDAO().getListQuestion(1));
    }
}
