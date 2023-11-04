/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Answer;
import model.Chapter;
import model.Config;
import model.Dimension;
import model.Lesson;
import model.Question;
import model.Quiz;
import model.Setting;
import model.Subject;
import model.Class;

/**
 *
 * @author lvhn1
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
        String sql = "select s.subject_id, s.subject_name, s.subject_code from subject s where s.subject_manager_id= ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, managerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Subject subject = Subject.builder()
                        .id(rs.getInt("subject_id"))
                        .name(rs.getString("subject_name"))
                        .code(rs.getString("subject_code"))
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
        String sql = "INSERT INTO `chapter` (`chapter_title`, `chapter_description`, `chapter_subject_id`, `created_by`, `update_by`) "
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
        String sql = "INSERT INTO `dimension` (`dimension_type`, `dimension_name`, `dimension_subject_id`, `created_by`, `update_by`) "
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

    public List<Question> GetListQuestionExport(int subjectId) {
        List<Question> questions = new ArrayList<>();
        String sql = "select question_id, question_detail from question \n"
                + "where question_subject_id = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, subjectId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question question = Question.builder()
                        .id(rs.getInt("question_id"))
                        .detail(rs.getString("question_detail"))
                        .answers(getAnswerByQuestion(rs.getInt("question_id")))
                        .build();
                questions.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return questions;
    }

    public List<Answer> getAnswerByQuestion(int questionId) {
        List<Answer> answers = new ArrayList();
        String sql = "select * from answer where answer_question_id = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, questionId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Answer answer = Answer.builder()
                        .id(rs.getInt("answer_id"))
                        .detail(rs.getString("answer_detail"))
                        .correct(rs.getBoolean("answer_correct"))
                        .build();
                answers.add(answer);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return answers;
    }

    public int getTopQuestionId() {
        int n = 0;
        String sql = "SELECT question_id \n"
                + "FROM question \n"
                + "ORDER BY question_id DESC\n"
                + "LIMIT 1";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                n = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return n;
    }

    public List<Subject> getListSubjects(int manager_id) {
        String sql = "SELECT * FROM subject where subject_manager_id = ? and subject_status = 1";

        List<Subject> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, manager_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Subject.builder()
                        .id(rs.getInt("subject_id"))
                        .code(rs.getString("subject_code"))
                        .name(rs.getString("subject_name"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Chapter> getListChapters(int manager_id) {
        String sql = "SELECT * FROM chapter\n"
                + "JOIN subject on chapter.chapter_subject_id = subject.subject_id\n"
                + "WHERE subject_manager_id = ? and chapter_status = 1\n"
                + "ORDER BY chapter_display_order";

        List<Chapter> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, manager_id);
            System.out.println(ps.toString());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Chapter.builder()
                        .id(rs.getInt("chapter_id"))
                        .title(rs.getString("chapter_title"))
                        .subject(Subject.builder()
                                .id(rs.getInt("subject_id"))
                                .code(rs.getString("subject_code"))
                                .build()
                        )
                        .display_order(rs.getInt("chapter_display_order"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Chapter> getListChapters(int manager_id, int subject_id) {
        String sql = "SELECT * FROM chapter\n"
                + "JOIN subject on chapter.chapter_subject_id = subject.subject_id\n"
                + "WHERE subject_manager_id = ? and subject_id = ? and chapter_status = 1\n"
                + "ORDER BY chapter_display_order";

        List<Chapter> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, manager_id);
            ps.setInt(2, subject_id);
            System.out.println(ps.toString());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Chapter.builder()
                        .id(rs.getInt("chapter_id"))
                        .title(rs.getString("chapter_title"))
                        .subject(Subject.builder()
                                .id(rs.getInt("subject_id"))
                                .code(rs.getString("subject_code"))
                                .build()
                        )
                        .display_order(rs.getInt("chapter_display_order"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<String> getDimensionTypes(int subject_id) {
        String sql = "select DISTINCT dimension_type from dimension where dimension_subject_id = ?";

        List<String> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, subject_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(rs.getString("dimension_type"));
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Dimension> getListDimensions(int subject_id, String dimension_type) {
        String sql = "SELECT dimension_id, dimension_name FROM dimension\n"
                + "where dimension_subject_id = ? and dimension_type = ?";

        List<Dimension> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, subject_id);
            ps.setString(2, dimension_type);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Dimension.builder()
                        .id(rs.getInt("dimension_id"))
                        .name(rs.getString("dimension_name"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Question> getListQuestions(int subject_id) {
        String sql = "SELECT * FROM question WHERE question_subject_id = ?";

        List<Question> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, subject_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Question.builder()
                        .id(rs.getInt("question_id"))
                        .detail(rs.getString("question_detail"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Config> getListConfig(int quiz_id) {
        String sql = "SELECT * FROM quiz_config where config_quiz_id = ?";

        List<Config> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quiz_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Config.builder()
                        .id(rs.getInt("config_id"))
                        .type(rs.getBoolean("config_type"))
                        .dimension(Dimension.builder()
                                .id(rs.getInt("config_dimension_id"))
                                .build()
                        )
                        .num_of_question(rs.getInt("config_num_of_question"))
                        .chapter(Chapter.builder()
                                .id(rs.getInt("config_chapter_id"))
                                .build()
                        )
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Question> getListQuizQuestions(int quiz_id) {
        String sql = "SELECT quiz_question.question_id, question_detail FROM quiz_question\n"
                + "JOIN question on quiz_question.question_id = question.question_id\n"
                + "WHERE quiz_question.quiz_id = ?";

        List<Question> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quiz_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Question.builder()
                        .id(rs.getInt("question_id"))
                        .detail(rs.getString("question_detail"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Quiz> getListQuizzes(int subject_id) {
        String sql = "select * from quiz where quiz_subject_id = ? and quiz_status = 1";

        List<Quiz> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, subject_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Quiz.builder()
                        .id(rs.getInt("quiz_id"))
                        .title(rs.getString("quiz_title"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public int countQuizzes(int manager_id, String search, int subject_id) {
        String sql = "select count(quiz_id) as num from quiz\n"
                + "join subject on quiz.quiz_subject_id = subject.subject_id\n"
                + "where subject.subject_manager_id = ?" + (subject_id == 0 ? "" : " and subject_id = " + subject_id) + " and quiz_title like '%" + search + "%'";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, manager_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("num");
            }
        } catch (SQLException e) {
        }

        return 0;
    }

    public List<Quiz> getQuizzes(int manager_id, String search, int page_num, int subject_id) {
        String sql = "SELECT quiz_id, quiz_title, quiz_description, quiz_type, subject_id, subject_code, chapter_id, chapter_title, quiz_status, quiz_config_by, quiz_dimension_type, quiz_num_of_question, creator.account_name as created_by, quiz.created_at, updater.account_name as update_by, quiz.update_at \n"
                + "FROM quiz\n"
                + "JOIN subject on quiz.quiz_subject_id = subject.subject_id\n"
                + "JOIN chapter on quiz.quiz_chapter_id = chapter.chapter_id\n"
                + "JOIN account as creator on quiz.created_by = creator.account_id\n"
                + "JOIN account as updater on quiz.update_by = updater.account_id\n"
                + "WHERE subject.subject_manager_id = ?" + (subject_id == 0 ? "" : " and subject_id = " + subject_id) + " and quiz_title like '%" + search + "%'\n"
                + "limit 8 offset ?";

        List<Quiz> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, manager_id);
            ps.setInt(2, (page_num - 1) * 8);
            System.out.println(ps.toString());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Quiz.builder()
                        .id(rs.getInt("quiz_id"))
                        .title(rs.getString("quiz_title"))
                        .description(rs.getString("quiz_description"))
                        .type(rs.getBoolean("quiz_type"))
                        .subject(Subject.builder()
                                .id(rs.getInt("subject_id"))
                                .code(rs.getString("subject_code"))
                                .build()
                        )
                        .chapter(Chapter.builder()
                                .id(rs.getInt("chapter_id"))
                                .title(rs.getString("chapter_title"))
                                .build()
                        )
                        .status(rs.getBoolean("quiz_status"))
                        .config_by(rs.getBoolean("quiz_config_by"))
                        .dimension_type(rs.getString("quiz_dimension_type"))
                        .num_of_question(rs.getInt("quiz_num_of_question"))
                        .created_by(rs.getString("created_by"))
                        .created_at(rs.getString("created_at"))
                        .update_by(rs.getString("update_by"))
                        .update_at(rs.getString("update_at"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public boolean addQuiz(String title, int subject, int chapter, boolean type, boolean status, int manager_id) {
        String sql = "INSERT INTO quiz(quiz_title, quiz_subject_id, quiz_chapter_id, quiz_type, quiz_status, created_by, update_by)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setInt(2, subject);
            ps.setInt(3, chapter);
            ps.setBoolean(4, type);
            ps.setBoolean(5, status);
            ps.setInt(6, manager_id);
            ps.setInt(7, manager_id);

            ps.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean updateQuiz(int id, String title, String descrition, int chapter, boolean type, boolean status, boolean config_by, String dimension_type, int numOfQues, int manager_id) {
        String sql = "UPDATE quiz SET quiz_title = ?, quiz_description = ?, quiz_chapter_id = ?, quiz_type = ?, quiz_status = ?, quiz_config_by = ?, quiz_dimension_type = ?, quiz_num_of_question = ?, update_by = ?\n"
                + "WHERE quiz_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, descrition);
            ps.setInt(3, chapter);
            ps.setBoolean(4, type);
            ps.setBoolean(5, status);
            ps.setBoolean(6, config_by);
            ps.setString(7, dimension_type);
            ps.setInt(8, numOfQues);
            ps.setInt(9, manager_id);
            ps.setInt(10, id);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean addConfig(int dimension, int chapter, int num_of_question, int quiz) {
        String sql = "insert into quiz_config(config_dimension_id, config_chapter_id, config_num_of_question, config_quiz_id)\n"
                + "values (?, ?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, dimension);
            ps.setInt(2, chapter);
            ps.setInt(3, num_of_question);
            ps.setInt(4, quiz);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean addConfig(boolean type, int config, int num_of_question, int quiz) {
        String sql;

        if (type) {
            sql = "insert into quiz_config(config_type, config_dimension_id, config_num_of_question, config_quiz_id)\n"
                    + "values (?, ?, ?, ?)";
        } else {
            sql = "insert into quiz_config(config_type, config_chapter_id, config_num_of_question, config_quiz_id)\n"
                    + "values (?, ?, ?, ?)";
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, type);
            ps.setInt(2, config);
            ps.setInt(3, num_of_question);
            ps.setInt(4, quiz);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean deleteAllConfig(int quiz_id) {
        String sql = "DELETE from quiz_config where config_quiz_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quiz_id);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean deleteConfig(int id) {
        String sql = "DELETE from quiz_config where config_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean updateConfig(int id, int dimension, int chapter, int num_of_question) {
        String sql = "UPDATE quiz_config SET config_dimension_id = ?, config_chapter_id = ?, config_num_of_question = ?\n"
                + "WHERE config_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, dimension);
            ps.setInt(2, chapter);
            ps.setInt(3, num_of_question);
            ps.setInt(4, id);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean addQuizQuestion(int quiz, int question) {
        String sql = "INSERT INTO quiz_question(quiz_id, question_id) VALUES (?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quiz);
            ps.setInt(2, question);

            ps.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean deleteQuizQuestion(int quiz, int question) {
        String sql = "DELETE from quiz_question where quiz_id = ? and question_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quiz);
            ps.setInt(2, question);

            ps.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public int countLessons(int manager_id, String search, int subject_id) {
        String sql = "select count(lesson_id) as num from lesson\n"
                + "join chapter on lesson_chapter_id = chapter_id\n"
                + "join subject on chapter_subject_id = subject_id\n"
                + "where subject_manager_id = ?" + (subject_id == 0 ? "" : " and subject_id = " + subject_id) + " and lesson_title like '%" + search + "%'";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, manager_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("num");
            }
        } catch (SQLException e) {
        }

        return 0;
    }

    public List<Lesson> getLessons(int manager_id, String search, int page_num, int subject_id) {
        String sql = "select lesson_id, lesson_type, lesson_title, lesson_description, lesson_video_link, lesson_display_order, lesson_status, subject_id, subject_code, "
                + "chapter_id, chapter_title, creator.account_name as created_by, lesson.created_at, updater.account_name as update_by, lesson.update_at from lesson\n"
                + "join chapter on lesson_chapter_id = chapter_id\n"
                + "join subject on chapter_subject_id = subject_id\n"
                + "join account as creator on lesson.created_by = creator.account_id\n"
                + "join account as updater on lesson.update_by = updater.account_id\n"
                + "where subject_manager_id = ?" + (subject_id == 0 ? "" : " and subject_id = " + subject_id) + " and lesson_title like '%" + search + "%'"
                + "limit 8 offset ?";

        List<Lesson> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, manager_id);
            ps.setInt(2, (page_num - 1) * 8);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Lesson.builder()
                        .id(rs.getInt("lesson_id"))
                        .type(rs.getString("lesson_type"))
                        .title(rs.getString("lesson_title"))
                        .description(rs.getString("lesson_description"))
                        .video_link(rs.getString("lesson_video_link"))
                        .display_order(rs.getInt("lesson_display_order"))
                        .status(rs.getBoolean("lesson_status"))
                        .subject(Subject.builder()
                                .id(rs.getInt("subject_id"))
                                .code(rs.getString("subject_code"))
                                .build()
                        )
                        .chapter(Chapter.builder()
                                .id(rs.getInt("chapter_id"))
                                .title(rs.getString("chapter_title"))
                                .build()
                        )
                        .created_by(rs.getString("created_by"))
                        .created_at(rs.getString("created_at"))
                        .update_by(rs.getString("update_by"))
                        .update_at(rs.getString("update_at"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public Lesson getLessonWithId(int id) {
        String sql = "select lesson.lesson_id, lesson_type, lesson_title, lesson_description, lesson_video_link, lesson_display_order, lesson_status, subject_id, subject_code, chapter_id, chapter_title, quiz_id, quizlesson_duration, quizlesson_pass_value, quizlesson_max_attempt from lesson\n"
                + "join chapter on lesson_chapter_id = chapter_id\n"
                + "join subject on chapter_subject_id = subject_id\n"
                + "left join quiz_lesson on lesson.lesson_id = quiz_lesson.lesson_id\n"
                + "where lesson.lesson_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Lesson lesson = Lesson.builder()
                        .id(rs.getInt("lesson_id"))
                        .type(rs.getString("lesson_type"))
                        .title(rs.getString("lesson_title"))
                        .description(rs.getString("lesson_description"))
                        .video_link(rs.getString("lesson_video_link"))
                        .display_order(rs.getInt("lesson_display_order"))
                        .status(rs.getBoolean("lesson_status"))
                        .subject(Subject.builder()
                                .id(rs.getInt("subject_id"))
                                .code(rs.getString("subject_code"))
                                .build()
                        )
                        .chapter(Chapter.builder()
                                .id(rs.getInt("chapter_id"))
                                .title(rs.getString("chapter_title"))
                                .build()
                        )
                        .quiz(Quiz.builder().id(rs.getInt("quiz_id")).build())
                        .duration(rs.getInt("quizlesson_duration"))
                        .passValue(rs.getInt("quizlesson_pass_value"))
                        .maxAttempt(rs.getInt("quizlesson_max_attempt"))
                        .build();

                return lesson;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public boolean addLesson(String title, int chapter, String type, boolean status, String video, String description, int manager_id) {
        String sql = "insert into lesson(lesson_title, lesson_chapter_id, lesson_type, lesson_status, lesson_video_link, lesson_description, created_by, update_by)\n"
                + "values (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setInt(2, chapter);
            ps.setString(3, type);
            ps.setBoolean(4, status);
            ps.setString(5, video);
            ps.setString(6, description);
            ps.setInt(7, manager_id);
            ps.setInt(8, manager_id);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public int getId(String table) {
        String sql = "SELECT max(" + table + "_id) as num from " + table;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("num");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public boolean addQuizLesson(int lesson, int quiz, int duration, int passVal, int maxAttempt) {
        String sql = "insert into quiz_lesson(lesson_id, quiz_id, quizlesson_duration, quizlesson_pass_value, quizlesson_max_attempt)\n"
                + "values (?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lesson);
            ps.setInt(2, quiz);
            ps.setInt(3, duration);
            ps.setInt(4, passVal);
            ps.setInt(5, maxAttempt);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean updateLesson(int id, String title, String type, boolean status, String video, String description) {
        String sql = "update lesson set lesson_title = ?, lesson_type = ?, lesson_status = ?, lesson_video_link = ?, lesson_description = ?\n"
                + "where lesson_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, type);
            ps.setBoolean(3, status);
            ps.setString(4, video);
            ps.setString(5, description);
            ps.setInt(6, id);

            ps.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean updateQuizLesson(int id, int quiz, int duration, int passVal, int maxAttempt) {
        String sql = "update quiz_lesson set quiz_id = ?, quizlesson_duration = ?, quizlesson_pass_value = ?, quizlesson_max_attempt = ?\n"
                + "where quiz_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quiz);
            ps.setInt(2, duration);
            ps.setInt(3, passVal);
            ps.setInt(4, maxAttempt);
            ps.setInt(5, id);

            ps.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public List<Lesson> getListLessons(int chapter_id) {
        String sql = "select * from lesson where lesson_chapter_id = ?";

        List<Lesson> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, chapter_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Lesson.builder()
                        .id(rs.getInt("lesson_id"))
                        .title(rs.getString("lesson_title"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public boolean addQuestion(int subject, int chapter, int lesson, String detail, boolean status, int manager_id) {
        String sql = "insert into question(question_subject_id, question_chapter_id, question_lesson_id, question_detail, question_status, created_by, update_by)\n"
                + "values (?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, subject);
            ps.setInt(2, chapter);
            ps.setInt(3, lesson);
            ps.setString(4, detail);
            ps.setBoolean(5, status);
            ps.setInt(6, manager_id);
            ps.setInt(7, manager_id);

            ps.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean addQuestionDimension(int question, int dimension) {
        String sql = "insert into question_dimension(question_id, dimension_id)\n"
                + "values (?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, question);
            ps.setInt(2, dimension);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean updateQuestion(int id, String detail, boolean status, int manager_id) {
        String sql = "update question set question_detail = ?, question_status = ?, update_by = ?\n"
                + "where question_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, detail);
            ps.setBoolean(2, status);
            ps.setInt(3, manager_id);
            ps.setInt(4, id);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean updateQuestionDimension(int question, int dimension) {
        String sql = "update question_dimension set dimension_id = ? where question_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, dimension);
            ps.setInt(2, question);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean addAnswer(String detail, boolean correct, int question) {
        String sql = "insert into answer(answer_detail, answer_correct, answer_question_id)\n"
                + "values (?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, detail);
            ps.setBoolean(2, correct);
            ps.setInt(3, question);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean deleteAnswer(int id) {
        String sql = "delete from answer where answer_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean updateAnswer(int id, String detail, boolean correct) {
        String sql = "update answer set answer_detail = ?, answer_correct = ? where answer_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, detail);
            ps.setBoolean(2, correct);
            ps.setInt(3, id);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public Question getQuestionWithId(int id) {
        String sql = "select * from question where question_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return Question.builder()
                        .id(rs.getInt("question_id"))
                        .detail(rs.getString("question_detail"))
                        .status(rs.getBoolean("question_status"))
                        .subject(Subject.builder().id(rs.getInt("question_subject_id")).build())
                        .chapter(Chapter.builder().id(rs.getInt("question_chapter_id")).build())
                        .lesson(Lesson.builder().id(rs.getInt("question_lesson_id")).build())
                        .dimensions(getQuestionDimensions(id))
                        .answers(getAnswers(id))
                        .build();
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Answer> getAnswers(int question) {
        String sql = "select * from answer where answer_question_id = ?";

        List<Answer> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, question);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Answer.builder()
                        .id(rs.getInt("answer_id"))
                        .detail(rs.getString("answer_detail"))
                        .correct(rs.getBoolean("answer_correct"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Dimension> getQuestionDimensions(int question) {
        String sql = "SELECT * FROM question_dimension where question_id = ?";

        List<Dimension> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, question);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Dimension.builder()
                        .id(rs.getInt("dimension_id"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Class> getAllClass() {
        List<Class> listClass = new ArrayList<>();
        String sql = "SELECT\n"
                + "    c.class_id,\n"
                + "    c.class_name,\n"
                + "    s.subject_name,\n"
                + "    se.setting_title,\n"
                + "    trainer.account_email AS trainer_email,\n"
                + "    c.class_status,\n"
                + "    c.class_start,\n"
                + "    c.class_end,\n"
                + "    creator.account_email AS created_by_email,\n"
                + "    c.created_at,\n"
                + "    updater.account_email AS updated_by_email,\n"
                + "    c.update_at\n"
                + "FROM class c\n"
                + "LEFT JOIN subject s ON c.class_subject_id = s.subject_id\n"
                + "LEFT JOIN setting se ON c.class_semester_id = se.setting_id\n"
                + "LEFT JOIN account trainer ON c.class_trainer_id = trainer.account_id\n"
                + "LEFT JOIN account creator ON c.created_by = creator.account_id\n"
                + "LEFT JOIN account updater ON c.update_by = updater.account_id;";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Class c = Class.builder()
                        .class_id(rs.getInt("class_id"))
                        .class_name(rs.getString("class_name"))
                        .class_subject_name(rs.getString("subject_name"))
                        .class_semester_name(rs.getString("setting_title"))
                        .class_trainer_name(rs.getString("trainer_email"))
                        .class_status(rs.getBoolean("class_status"))
                        .class_start(rs.getDate("class_start"))
                        .class_end(rs.getDate("class_end"))
                        .created_by(rs.getString("created_by_email"))
                        .created_at(rs.getDate("created_at"))
                        .update_by(rs.getString("updated_by_email"))
                        .update_at(rs.getDate("update_at"))
                        .build();
                listClass.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return listClass;
    }

    public boolean addClass(String class_name, int class_subject_id, int class_semester_id,
            int class_trainer_id, Boolean class_status, Date class_start, Date class_end,
            int created_by, LocalDateTime created_at) {
        int check = 0;
        String sql = "INSERT INTO edupro.class (class_name,class_subject_id,class_semester_id,"
                + "class_trainer_id,class_status,class_start,class_end,created_by,created_at) \n"
                + "VALUES (?,?,?,?,?,?,?,?,?);";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setObject(1, class_name);
            ps.setObject(2, class_subject_id);
            ps.setObject(3, class_semester_id);
            ps.setObject(4, class_trainer_id);
            ps.setObject(5, class_status);
            ps.setObject(6, class_start);
            ps.setObject(7, class_end);
            ps.setObject(8, created_by);
            ps.setObject(9, created_at);

            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean classExist(String className) {
        String sql = "select *\n"
                + "from class where class_name = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, className);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
        }
        return false;
    }

    public List<Subject> getSubject() {
        String sql = "SELECT subject_id,subject_name FROM edupro.subject where subject_status =1;";

        List<Subject> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Subject.builder()
                        .id(rs.getInt("subject_id"))
                        .name(rs.getString("subject_name"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Account> getTrainer() {
        String sql = "SELECT account_id,account_email,account_name FROM edupro.account where account_role_id = 3;";

        List<Account> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Account.builder()
                        .id(rs.getInt("account_id"))
                        .email(rs.getString("account_email"))
                        .name(rs.getString("account_name"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Setting> getSemester() {
        String sql = "SELECT setting_id,setting_title FROM edupro.setting where setting_key = 2 AND setting_status = 1;";

        List<Setting> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Setting.builder()
                        .id(rs.getInt("setting_id"))
                        .title(rs.getString("setting_title"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public int getTotalClasses() {
        int totalClasses = 0;
        String sql = "SELECT COUNT(*) FROM class";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalClasses = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return totalClasses;
    }

    public List<Class> getClassesForPage(int start, int pageSize) {
        List<Class> listClass = new ArrayList<>();
        String sql = "SELECT\n"
                + "    c.class_id,\n"
                + "    c.class_name,\n"
                + "    s.subject_name,\n"
                + "    se.setting_title,\n"
                + "    trainer.account_email AS trainer_email,\n"
                + "    c.class_status,\n"
                + "    c.class_start,\n"
                + "    c.class_end,\n"
                + "    creator.account_email AS created_by_email,\n"
                + "    c.created_at,\n"
                + "    updater.account_email AS updated_by_email,\n"
                + "    c.update_at\n"
                + "FROM class c\n"
                + "LEFT JOIN subject s ON c.class_subject_id = s.subject_id\n"
                + "LEFT JOIN setting se ON c.class_semester_id = se.setting_id\n"
                + "LEFT JOIN account trainer ON c.class_trainer_id = trainer.account_id\n"
                + "LEFT JOIN account creator ON c.created_by = creator.account_id\n"
                + "LEFT JOIN account updater ON c.update_by = updater.account_id\n"
                + "LIMIT ?, ?"; // Sử dụng LIMIT để trả về một phạm vi kết quả cụ thể
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, start);
            stm.setInt(2, pageSize);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Class c = Class.builder()
                        .class_id(rs.getInt("class_id"))
                        .class_name(rs.getString("class_name"))
                        .class_subject_name(rs.getString("subject_name"))
                        .class_semester_name(rs.getString("setting_title"))
                        .class_trainer_name(rs.getString("trainer_email"))
                        .class_status(rs.getBoolean("class_status"))
                        .class_start(rs.getDate("class_start"))
                        .class_end(rs.getDate("class_end"))
                        .created_by(rs.getString("created_by_email"))
                        .created_at(rs.getDate("created_at"))
                        .update_by(rs.getString("updated_by_email"))
                        .update_at(rs.getDate("update_at"))
                        .build();
                listClass.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return listClass;
    }

    public List<Class> searchClasses(String searchKeyword) {
        List<Class> listClass = new ArrayList<>();
        String sql = "SELECT\n"
                + "    c.class_id,\n"
                + "    c.class_name,\n"
                + "    s.subject_name,\n"
                + "    se.setting_title,\n"
                + "    trainer.account_email AS trainer_email,\n"
                + "    c.class_status,\n"
                + "    c.class_start,\n"
                + "    c.class_end,\n"
                + "    creator.account_email AS created_by_email,\n"
                + "    c.created_at,\n"
                + "    updater.account_email AS updated_by_email,\n"
                + "    c.update_at\n"
                + "FROM class c\n"
                + "LEFT JOIN subject s ON c.class_subject_id = s.subject_id\n"
                + "LEFT JOIN setting se ON c.class_semester_id = se.setting_id\n"
                + "LEFT JOIN account trainer ON c.class_trainer_id = trainer.account_id\n"
                + "LEFT JOIN account creator ON c.created_by = creator.account_id\n"
                + "LEFT JOIN account updater ON c.update_by = updater.account_id\n"
                + "WHERE c.class_name LIKE ?"; // Sử dụng LIKE để tìm kiếm theo tên lớp

        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, "%" + searchKeyword + "%"); // Bắt đầu hoặc kết thúc bằng từ khóa tìm kiếm

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Class c = Class.builder()
                        .class_id(rs.getInt("class_id"))
                        .class_name(rs.getString("class_name"))
                        .class_subject_name(rs.getString("subject_name"))
                        .class_semester_name(rs.getString("setting_title"))
                        .class_trainer_name(rs.getString("trainer_email"))
                        .class_status(rs.getBoolean("class_status"))
                        .class_start(rs.getDate("class_start"))
                        .class_end(rs.getDate("class_end"))
                        .created_by(rs.getString("created_by_email"))
                        .created_at(rs.getDate("created_at"))
                        .update_by(rs.getString("updated_by_email"))
                        .update_at(rs.getDate("update_at"))
                        .build();
                listClass.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return listClass;
    }
}
