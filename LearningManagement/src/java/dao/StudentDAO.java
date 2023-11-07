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
import model.Answer;
import model.Chapter;
import model.Class;
import model.Config;
import model.Dimension;
import model.PracticeQuiz;
import model.Question;
import model.Quiz;
import model.QuizResult;

/**
 *
 * @author dell
 */
public class StudentDAO extends DBContext {

    public List<Class> getClassList(int user_id) {
        String sql = "select * from class \n"
                + "join class_trainee on class.class_id = class_trainee.class_id\n"
                + "where trainee_id = ? and class_start <= current_date() and class_end >= current_date() and class_status = 1";

        List<Class> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Class.builder()
                        .class_id(rs.getInt("class_id"))
                        .class_name(rs.getString("class_name"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public int getSubjectId(int classId) {
        String sql = "select class_subject_id from class\n"
                + "where class_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, classId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("class_subject_id");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public void createQuizSubmit(int quiz_lesson, int submitter) {
        String sql = "insert into quiz_submit(quizlesson_id, submitter_id)\n"
                + "values (?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quiz_lesson);
            ps.setInt(2, submitter);

            ps.execute();
        } catch (SQLException e) {
        }
    }

    public int getNewSubmitId(int submitter) {
        String sql = "select max(quizsubmit_id) as id from quiz_submit\n"
                + "where submitter_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, submitter);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public Quiz getQuizBySubmitId(int submitId) {
        String sql = "select quiz.quiz_id, quiz_type, quiz_config_by from quiz_submit\n"
                + "join lesson on quizlesson_id = lesson_id\n"
                + "join quiz_lesson on quiz_lesson.lesson_id = lesson.lesson_id\n"
                + "join quiz on quiz.quiz_id = quiz_lesson.quiz_id\n"
                + "where quizsubmit_id = ?;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, submitId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return Quiz.builder()
                        .id(rs.getInt("quiz_id"))
                        .type(rs.getBoolean("quiz_type"))
                        .config_by(rs.getBoolean("quiz_config_by"))
                        .build();
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Config> getListConfigsByQuiz(int quizId) {
        String sql = "select config_id, config_dimension_id, config_chapter_id, config_num_of_question from quiz\n"
                + "join quiz_config on quiz_id = config_quiz_id\n"
                + "where quiz_id = ?;";

        List<Config> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quizId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(Config.builder()
                        .id(rs.getInt("config_id"))
                        .dimension(Dimension.builder().id(rs.getInt("config_dimension_id")).build())
                        .chapter(Chapter.builder().id(rs.getInt("config_chapter_id")).build())
                        .num_of_question(rs.getInt("config_num_of_question"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Question> getListQuestionByDimension(int dimension_id, int num_of_ques) {
        String sql = "select question.question_id, question_detail, dimension_id from question \n"
                + "join question_dimension on question.question_id = question_dimension.question_id\n"
                + "where dimension_id = ? and question_status = 1\n"
                + "group by (question.question_id)\n"
                + "order by rand()\n"
                + "limit ?";

        List<Question> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, dimension_id);
            ps.setInt(2, num_of_ques);

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

    public List<Question> getListQuestionByChapter(int chapter_id, int num_of_ques) {
        String sql = "select question_id, question_detail, question_chapter_id from question\n"
                + "where question_chapter_id = ? and question_status = 1\n"
                + "group by (question_id)\n"
                + "order by rand()\n"
                + "limit ?";

        List<Question> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, chapter_id);
            ps.setInt(2, num_of_ques);

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

    public List<Question> getFixedQuestions(int quiz) {
        String sql = "select question.question_id, question_detail from quiz_question\n"
                + "join question on quiz_question.question_id = question.question_id\n"
                + "where quiz_id = ?";

        List<Question> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quiz);

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

    public void addQuestionsToQuiz(int submitId, int questionId, int quesNum) {
        String sql = "insert into quizsubmit_question values (?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, submitId);
            ps.setInt(2, questionId);
            ps.setInt(3, quesNum);
            System.out.println(ps.toString());

            ps.execute();
        } catch (SQLException e) {
        }
    }

    public int getNumOfQuestions(int submitId) {
        String sql = "select count(question_id) as num from quizsubmit_question\n"
                + "where quizsubmit_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, submitId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("num");
            }

        } catch (SQLException e) {
        }
        return 0;
    }

    public Question getQuestionByNum(int submitId, int quesNum, boolean getCorrect) {
        String sql = "select question.question_id, question_detail from quizsubmit_question\n"
                + "join question on quizsubmit_question.question_id = question.question_id\n"
                + "where quizsubmit_id = ? and question_num = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, submitId);
            ps.setInt(2, quesNum);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return Question.builder()
                        .id(rs.getInt("question_id"))
                        .detail(rs.getString("question_detail"))
                        .answers(getAnswersOfQuestion(rs.getInt("question_id"), submitId, getCorrect))
                        .correct_id(countCorrect(rs.getInt("question_id")))
                        .build();
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Answer> getAnswersOfQuestion(int quesId, int submitId, boolean getCorrect) {
        String sql = "select * from answer where answer_question_id = ?";

        List<Answer> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quesId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Answer answer = Answer.builder()
                        .id(rs.getInt("answer_id"))
                        .detail(rs.getString("answer_detail"))
                        .choose(choosenAnswer(rs.getInt("answer_id"), submitId))
                        .build();

                if (getCorrect) {
                    answer.setCorrect(rs.getBoolean("answer_correct"));
                }

                list.add(answer);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public boolean choosenAnswer(int answerId, int submitId) {
        String sql = "select * from quiz_answer where answer_id = ? and quizsubmit_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, answerId);
            ps.setInt(2, submitId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public int countCorrect(int quesId) {
        String sql = "select count(answer_id) as num from question\n"
                + "join answer on answer_question_id = question_id\n"
                + "where question_id = ? and answer_correct = 1";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quesId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("num");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public void addQuizAnswer(int submitId, int quesId, int ansId) {
        String sql = "insert into quiz_answer values (?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, submitId);
            ps.setInt(2, quesId);
            ps.setInt(3, ansId);

            ps.execute();
        } catch (SQLException e) {
        }
    }

    public void removeQuizAnswer(int submitId, int quesId, int ansId) {
        String sql = "delete from quiz_answer where quizsubmit_id = ? and question_id = ? and answer_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, submitId);
            ps.setInt(2, quesId);
            ps.setInt(3, ansId);

            ps.execute();
        } catch (SQLException e) {
        }
    }

    public int countMark(int submitId) {
        String sql = "select myVal / maxVal * 100 AS mark\n"
                + "FROM (\n"
                + "    SELECT COUNT(*) AS myVal\n"
                + "    FROM quiz_answer\n"
                + "    RIGHT JOIN answer ON quiz_answer.answer_id = answer.answer_id\n"
                + "    WHERE quizsubmit_id = ? AND answer_correct = 1\n"
                + ") AS subquery1\n"
                + "CROSS JOIN (\n"
                + "    SELECT COUNT(*) AS maxVal\n"
                + "    FROM quizsubmit_question\n"
                + "    JOIN answer ON answer_question_id = question_id\n"
                + "    WHERE quizsubmit_id = ? AND answer_correct = 1\n"
                + ") AS subquery2;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, submitId);
            ps.setInt(2, submitId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("mark");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public void submitQuiz(int submitId) {
        String sql = "update quiz_submit set quizsubmit_status = 1, quizsubmit_score = ?, submit_at = current_timestamp()\n"
                + "where quizsubmit_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, countMark(submitId));
            ps.setInt(2, submitId);

            ps.execute();
        } catch (SQLException e) {
        }
    }

    public int getQuizLessonId(int submitId) {
        String sql = "select quizlesson_id from quiz_submit\n"
                + "where quizsubmit_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, submitId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("quizlesson_id");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<QuizResult> getQuizResults(int lesson, int submitter) {
        String sql = "select * from quiz_submit\n"
                + "where quizlesson_id = ? and submitter_id = ?";

        List<QuizResult> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lesson);
            ps.setInt(2, submitter);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(QuizResult.builder()
                        .id(rs.getInt("quizsubmit_id"))
                        .status(rs.getBoolean("quizsubmit_status"))
                        .score(rs.getInt("quizsubmit_score"))
                        .submit_at(rs.getString("submit_at"))
                        .expired(quizExpired(rs.getInt("quizsubmit_id")))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<PracticeQuiz> getPracticeQuizzes(int traineeId) {
        String sql = "select quiz_id, quiz_title, quiz_config_by, quiz_dimension_type, quiz_num_of_question, practice_quiz_time, practice_quiz_result from practice_quiz\n"
                + "join quiz on practice_quiz_id = quiz_id\n"
                + "where created_by = ?";

        List<PracticeQuiz> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, traineeId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(PracticeQuiz.builder()
                        .id(rs.getInt("quiz_id"))
                        .title(rs.getString("quiz_title"))
                        .questionGroup(rs.getBoolean("quiz_config_by"))
                        .source(rs.getString("quiz_dimension_type"))
                        .numOfQuestion(rs.getInt("quiz_num_of_question"))
                        .spentTime(rs.getInt("practice_quiz_time"))
                        .result(rs.getInt("practice_quiz_result"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public boolean addPracticeQuiz(String title, boolean configBy, int totalNum, String dimensionType, int creator) {
        String sql = "insert into quiz(quiz_title, quiz_config_by, quiz_num_of_question, quiz_dimension_type, quiz_practice, created_by, update_by)\n"
                + "values (?, ?, ?, ?, 1, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setBoolean(2, configBy);
            ps.setInt(3, totalNum);
            ps.setString(4, dimensionType);
            ps.setInt(5, creator);
            ps.setInt(6, creator);
            System.out.println(ps.toString());

            ps.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public int getQuizId(int creator) {
        String sql = "select max(quiz_id) as num from quiz where created_by = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, creator);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("num");
            }
        } catch (SQLException e) {
        }
        return 0;
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

    public boolean addPracticeQuiz(int quiz) {
        String sql = "insert into practice_quiz(practice_quiz_id) values (?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quiz);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public int getSecondLeft(int submitId) {
        String sql = "SELECT TIMESTAMPDIFF(second, NOW(), end_at) AS second_left\n"
                + "FROM (\n"
                + "    SELECT DATE_ADD(quiz_submit.created_at, INTERVAL quiz_lesson.quizlesson_duration MINUTE) AS end_at\n"
                + "    FROM quiz_submit\n"
                + "    JOIN quiz_lesson ON quiz_submit.quizlesson_id = quiz_lesson.lesson_id\n"
                + "    WHERE quiz_submit.quizsubmit_id = ?\n"
                + ") as subquery;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, submitId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int s = rs.getInt("second_left");
                return s < 0 ? 0 : s;
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public boolean quizExpired(int submitId) {
        String sql = "select current_timestamp() > end_at as expired \n"
                + "FROM (\n"
                + "    SELECT DATE_ADD(quiz_submit.created_at, INTERVAL quiz_lesson.quizlesson_duration + 1 MINUTE) AS end_at\n"
                + "    FROM quiz_submit\n"
                + "    JOIN quiz_lesson ON quiz_submit.quizlesson_id = quiz_lesson.lesson_id\n"
                + "    WHERE quiz_submit.quizsubmit_id = ?\n"
                + ") as subquery;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, submitId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getBoolean("expired");
            }
        } catch (SQLException e) {
        }
        return true;
    }
}
