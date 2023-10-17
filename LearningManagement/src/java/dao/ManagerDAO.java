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
import model.Chapter;
import model.Config;
import model.Dimension;
import model.Lesson;
import model.Question;
import model.Quiz;
import model.Subject;

/**
 *
 * @author lvhn1
 */
public class ManagerDAO extends DBContext {
//    public List<Question> getQuestions(int manager_id) {
//        
//    }

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

    public List<Dimension> getListDimensions(int manager_id, int subject_id) {
        String sql = "SELECT * FROM dimension\n"
                + "join subject on dimension.dimension_subject_id = subject.subject_id\n"
                + "where subject_manager_id = ? and subject_id = ? and dimension_status = 1";

        List<Dimension> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, manager_id);
            ps.setInt(2, subject_id);
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
        String sql = "SELECT quiz_id, quiz_title, quiz_type, subject_id, subject_code, chapter_id, chapter_title, quiz_status, creator.account_name as created_by, quiz.created_at, updater.account_name as update_by, quiz.update_at \n"
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

            return ps.execute();
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean updateQuiz(int id, String title, int subject, int chapter, boolean type, boolean status, int manager_id) {
        String sql = "UPDATE quiz SET quiz_title = ?, quiz_subject_id = ?, quiz_chapter_id = ?, quiz_type = ?, quiz_status = ?, update_by = ?\n"
                + "WHERE quiz_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setInt(2, subject);
            ps.setInt(3, chapter);
            ps.setBoolean(4, type);
            ps.setBoolean(5, status);
            ps.setInt(6, manager_id);
            ps.setInt(7, id);

            return ps.execute();
        } catch (SQLException e) {
            return false;
        }
    }

    public void addConfig(int dimension, int chapter, int num_of_question, int quiz) {
        String sql = "insert into quiz_config(config_dimension_id, config_chapter_id, config_num_of_question, config_quiz_id)\n"
                + "values (?, ?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, dimension);
            ps.setInt(2, chapter);
            ps.setInt(3, num_of_question);
            ps.setInt(4, quiz);

            ps.execute();
        } catch (SQLException e) {
        }
    }

    public void deleteConfig(int id) {
        String sql = "DELETE from quiz_config where config_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ps.execute();
        } catch (SQLException e) {
        }
    }

    public void updateConfig(int id, int dimension, int chapter, int num_of_question) {
        String sql = "UPDATE quiz_config SET config_dimension_id = ?, config_chapter_id = ?, config_num_of_question = ?\n"
                + "WHERE config_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, dimension);
            ps.setInt(2, chapter);
            ps.setInt(3, num_of_question);
            ps.setInt(4, id);

            ps.execute();
        } catch (SQLException e) {
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

    public void addLesson(String title, int chapter, String type, boolean status, String video, String description, int manager_id) {
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
        } catch (SQLException e) {
        }
    }

    public int getLessonId(String database) {
        String sql = "SELECT `AUTO_INCREMENT` as num\n"
                + "FROM  INFORMATION_SCHEMA.TABLES\n"
                + "WHERE TABLE_SCHEMA = ?\n"
                + "AND   TABLE_NAME   = 'lesson';";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, database);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("num");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public void addQuizLesson(int lesson, int quiz, int duration, int passVal, int maxAttempt) {
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
        } catch (SQLException e) {
        }
    }

    public void updateLesson(int id, String title, String type, boolean status, String video, String description) {
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
        } catch (SQLException e) {
        }
    }

    public void updateQuizLesson(int id, int quiz, int duration, int passVal, int maxAttempt) {
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
        } catch (SQLException e) {
        }
    }
}
