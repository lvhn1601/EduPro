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
import model.Chapter;
import model.Setting;
import model.Subject;
import model.Class;
import model.Lesson;

/**
 *
 * @author tango
 */
public class TrainerDAO extends DBContext {

    public boolean addLesson(String title, int chapter, String type, boolean status, String video, String description, int manager_id) {
        String sql = "insert into lesson(lesson_title, lesson_chapter_id, lesson_type, lesson_status, lesson_video_link, lesson_description, lesson_extra, created_by, update_by)\n"
                + "values (?, ?, ?, ?, ?, ?, 1, ?, ?)";

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

    public boolean addExtraLessonForClass(int classid, int lesson_id) {
        String sql = "INSERT into extra_lesson values (?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, classid);
            ps.setInt(2, lesson_id);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean addAssignment(int assignment, int classid, String duedate) {
        String sql = "insert into assignment_class\n"
                + "values (?, ?, ?);";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, assignment);
            ps.setInt(2, classid);
            ps.setString(3, duedate);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean removeExtraLesson(int lessonid, int classid) {
        String sql = "delete from extra_lesson where lesson_id = ? and class_id = ?;";
                
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lessonid);
            ps.setInt(2, classid);

            ps.execute();

            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    // modify to method that can search trainee with their email
    // email == "" => find all trainee in the system
    public List<Account> getAllTrainee(String email, int page) {
        ArrayList<Account> accs = new ArrayList<>();
        String sql = "select * from account where account_role_id = 4\n"
                + "and account_email like '%" + email + "%'\n"
                + "limit 8 offset ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, (page - 1) * 8);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = Account.builder()
                        .id(rs.getInt("account_id"))
                        .name(rs.getString("account_name"))
                        .email(rs.getString("account_email"))
                        .active(rs.getInt("account_active"))
                        .phone(rs.getString("account_phone"))
                        .role(Setting.builder()
                                .id(rs.getInt("account_role_id"))
                                .build())
                        .build();
                accs.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return accs;
    }

    // count all trainee in the system
    public int countAllTrainee(String email) {
        String sql = "select COUNT(*) from account where account_role_id = 4\n"
                + "and account_email like '%" + email + "%'\n";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            int rowCount = rs.next() ? rs.getInt(1) : 0;
            return rowCount;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    // ngăn trainer add 1 student vào 1 class 2 lần
    public int checkDupplicateTrainee(int class_id, int trainee_id) {
        String sql = "select COUNT(*) from class_trainee\n"
                + "where class_id = ? and trainee_id = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, class_id);
            stm.setInt(2, trainee_id);
            ResultSet rs = stm.executeQuery();
            int rowCount = rs.next() ? rs.getInt(1) : 0;
            return rowCount;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public void addTraineeToClass(int trainee_id, int class_id) {
        String sql = "Insert into class_trainee values (?, ?)";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, class_id);
            stm.setInt(2, trainee_id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    public List<Account> getTraineeByEmail(String email) {
        List<Account> accs = new ArrayList<>();
        String sql = "select account_id from account where account_email = ?";
        try ( PreparedStatement stm = connection.prepareCall(sql)) {
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = Account.builder()
                        .id(rs.getInt("account_id"))
                        .build();
                accs.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return accs;
    }

    public List<Class> getClassByTrainerId(int trainer_id, String class_name, String subject_name, String semester, int page) {
        List<Class> classes = new ArrayList<>();
        String sql = "select c.class_id, c.class_name, s.subject_name, st.setting_title from class c\n"
                + "inner join subject s on c.class_subject_id = s.subject_id\n"
                + "inner join Setting st on st.setting_id = c.class_semester_id\n"
                + "where class_trainer_id = ?\n"
                + "and class_name like '%" + class_name + "%'\n"
                + "and subject_name like '%" + subject_name + "%'\n"
                + "and setting_title like '%" + semester + "%'\n"
                + "limit 8 offset ?";

        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, trainer_id);
            stm.setInt(2, (page - 1) * 8);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Class c = Class.builder()
                        .class_id(rs.getInt("class_id"))
                        .class_name(rs.getString("class_name"))
                        .class_subject_name(rs.getString("subject_name"))
                        .class_semester_name(rs.getString("setting_title"))
                        .build();
                classes.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return classes;
    }

    public int countClasses(int trainer_id, String class_name, String subject_name, String semester) {
        String sql = "select COUNT(*) from class c\n"
                + "inner join subject s on c.class_subject_id = s.subject_id\n"
                + "inner join Setting st on st.setting_id = c.class_semester_id\n"
                + "where class_trainer_id = ?\n"
                + "and class_name like '%" + class_name + "%'\n"
                + "and subject_name like '%" + subject_name + "%'\n"
                + "and setting_title like '%" + semester + "%'\n";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, trainer_id);
            ResultSet rs = stm.executeQuery();
            int rowCount = rs.next() ? rs.getInt(1) : 0;
            return rowCount;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    // lay danh sach trainee trong 1 lop + phan trang
    public List<Account> getTraineeInAClass(int class_id, String email, int page) {
        List<Account> trainees = new ArrayList<>();
        String sql = "select a.account_id, a.account_name, a.account_email, a.account_phone, a.account_active from class_trainee c \n"
                + "inner join account a on c.trainee_id = a.account_id\n"
                + "where account_email like '%" + email + "%'\n"
                + "and c.class_id = ?\n"
                + "limit 8 offset ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, class_id);
            stm.setInt(2, (page - 1) * 8);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account acc = Account.builder()
                        .id(rs.getInt("account_id"))
                        .name(rs.getString("account_name"))
                        .email(rs.getString("account_email"))
                        .phone(rs.getString("account_phone"))
                        .active(rs.getInt("account_active"))
                        .build();
                trainees.add(acc);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return trainees;
    }

    // lay danh sach trainee trong 1 lop de export
    public List<Account> getTraineeInAClass(int class_id, String email) {
        List<Account> trainees = new ArrayList<>();
        String sql = "select a.account_id, a.account_name, a.account_email, a.account_phone, a.account_active from class_trainee c \n"
                + "inner join account a on c.trainee_id = a.account_id\n"
                + "where account_email like '%" + email + "%'\n"
                + "and c.class_id = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, class_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account acc = Account.builder()
                        .id(rs.getInt("account_id"))
                        .name(rs.getString("account_name"))
                        .email(rs.getString("account_email"))
                        .phone(rs.getString("account_phone"))
                        .active(rs.getInt("account_active"))
                        .build();
                trainees.add(acc);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return trainees;
    }

    // count trainee in a class
    public int countTrainee(int class_id, String email) {
        String sql = "select COUNT(*) from class_trainee c\n"
                + "inner join account a on c.trainee_id = a.account_id\n"
                + "where account_email like '%" + email + "%'\n"
                + "and c.class_id = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, class_id);
            ResultSet rs = stm.executeQuery();
            int rowCount = rs.next() ? rs.getInt(1) : 0;
            return rowCount;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    // search by class id and email
    public List<Account> searchTrainee(String class_id, String email) {
        List<Account> trainees = new ArrayList<>();
        String sql = "select a.account_id, a.account_name, a.account_email, a.account_phone, a.account_active from class_trainee c \n"
                + "inner join account a on c.trainee_id = a.account_id\n"
                + "where account_email like ?";
        if (!class_id.equals("0")) {
            sql = sql + " and c.class_id = " + class_id;
        }
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, "%" + email + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account acc = Account.builder()
                        .id(rs.getInt("account_id"))
                        .name(rs.getString("account_name"))
                        .email(rs.getString("account_email"))
                        .phone(rs.getString("account_phone"))
                        .active(rs.getInt("account_active"))
                        .build();
                trainees.add(acc);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return trainees;
    }

    public void removeTrainee(int class_id, int trainee_id) {
        String sql = "delete from class_trainee where class_id = ? and trainee_id = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, class_id);
            stm.setInt(2, trainee_id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    // tao moi 1 trainee
    public void createNewTrainee(String email, String name, int trainer_id) {
        String sql = "insert into account (account_email, account_password, account_active, account_name, account_role_id, created_by)\n"
                + "values (?, '123456', 1, ?, 4, ?)";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, email);
            stm.setString(2, name);
            stm.setInt(3, trainer_id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    // select chapter by subjectId for fetch data
    public List<Chapter> getChapterBySubject(int subject_id) {
        List<Chapter> list = new ArrayList();
        String sql = "select chapter_id, chapter_title from chapter where chapter_subject_id = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, subject_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Chapter c = Chapter.builder()
                        .id(rs.getInt(1))
                        .title(rs.getString(2))
                        .build();
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return list;
    }

    // // lấy danh sách tất cả các subject
    public List<Subject> getAllSubjects() {
        List<Subject> list = new ArrayList();
        String sql = "select * from subject";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = Subject.builder()
                        .id(rs.getInt("subject_id"))
                        .name(rs.getString("subject_name"))
                        .code(rs.getString("subject_code"))
                        .build();
                list.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return list;
    }

    // get list semester
    public List<Setting> getListSemester() {
        List<Setting> list = new ArrayList();
        String sql = "select * from setting where setting_key = 2";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Setting s = Setting.builder()
                        .id(rs.getInt("setting_id"))
                        .title(rs.getString("setting_title"))
                        .build();
                list.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return list;
    }

    //EXTRA LESSON DAO
    // get all lesson
    public List<Lesson> getLessons(int subject_id, int chapter_id, String type, String title, String status, int page) {
        List<Lesson> list = new ArrayList<>();
        String sql = "SELECT * FROM lesson l\n"
                + "inner join chapter c on c.chapter_id = lesson_chapter_id\n"
                + "inner join subject s on s.subject_id = c.chapter_subject_id\n"
                + "where lesson_type like '%" + type + "%' \n"
                + (subject_id != 0 ? "and chapter_subject_id = " + subject_id + "\n" : "")
                + (chapter_id != 0 ? "and lesson_chapter_id = ?" + chapter_id + "\n" : "")
                + "and lesson_title like '%" + title + "%'\n"
                + (status != "" ? "and lesson_status = " + status + "\n" : "")
                + "limit 8 offset ?";
        System.out.println(sql);
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, 8 * (page - 1));
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lesson l = Lesson.builder()
                        .id(rs.getInt("lesson_id"))
                        .type(rs.getString("lesson_type"))
                        .title(rs.getString("lesson_title"))
                        .description(rs.getString("lesson_description"))
                        .video_link(rs.getString("lesson_video_link"))
                        .status(rs.getBoolean("lesson_status"))
                        .chapter(Chapter.builder()
                                .id(rs.getInt("lesson_chapter_id"))
                                .title(rs.getString("chapter_title"))
                                .build())
                        .subject(Subject.builder()
                                .code(rs.getString("subject_code"))
                                .build())
                        .build();
                list.add(l);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return list;
    }

    // code phân trang
    public int countLessons(int subject_id, int chapter_id, String type, String title, String status) {
        String sql = "SELECT COUNT(*) FROM lesson l\n"
                + "inner join chapter c on c.chapter_id = lesson_chapter_id\n"
                + "inner join subject s on s.subject_id = c.chapter_subject_id\n"
                + "where lesson_type like '%" + type + "%' \n"
                + (subject_id != 0 ? "and chapter_subject_id = " + subject_id + "\n" : "")
                + (chapter_id != 0 ? "and lesson_chapter_id = ?" + chapter_id + "\n" : "")
                + "and lesson_title like '%" + title + "%'\n"
                + (status != "" ? "and lesson_status = " + status + "\n" : "");
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            int rowCount = rs.next() ? rs.getInt(1) : 0;
            return rowCount;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    // video / quiz
    public List<String> getLessonType() {
        List<String> list = new ArrayList<>();
        String sql = "select distinct lesson_type from lesson";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("lesson_type"));
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return list;
    }

    public List<String> getLessonStatus() {
        List<String> list = new ArrayList<>();
        String sql = "select distinct lesson_status from lesson";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add((rs.getInt("lesson_status") == 1 ? "true" : "false"));
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return list;
    }

    // assign extra lesson to a class
    public void addExtraLesson(int class_id, int lesson_id) {
        String sql = "insert into extra_lesson values (?, ?)";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, class_id);
            stm.setInt(2, lesson_id);
            int n = stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    public int getTopLessonId() {
        String sql = "select lesson_id from lesson order by lesson_id desc limit 1";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public int getTopTraineeId() {
        String sql = "select account_id from account order by account_id desc limit 1";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    // delete an extra lesson from a class
    public void deleteExtraLesson(int lesson_id) {
        String sql = "delete from extra_lesson where lesson_id = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, lesson_id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    // get list class that extra_lesson was assigned
    public List<Class> getExtraLessonListClass(int trainer_id, int lesson_id) {
        List<Class> list = new ArrayList();
        String sql = "select c.class_id, e.lesson_id, c.class_name from extra_lesson e \n"
                + "inner join class c on e.class_id = c.class_id\n"
                + "where c.class_trainer_id = ? and e.lesson_id = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, trainer_id);
            stm.setInt(2, lesson_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Class c = Class.builder()
                        .class_id(rs.getInt("class_id"))
                        .class_name(rs.getString("class_name"))
                        .build();
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return list;
    }

    // lấy danh sách lớp học 1 trainer quản lý nhưng ko cần phân trang
    // phục vụ cho phần add extra lesson to a class
    public List<Class> getClassByTrainerId(int trainer_id, String class_name, String subject_name, String semester) {
        List<Class> classes = new ArrayList<>();
        String sql = "select c.class_id, c.class_name, s.subject_name, st.setting_title from class c\n"
                + "inner join subject s on c.class_subject_id = s.subject_id\n"
                + "inner join Setting st on st.setting_id = c.class_semester_id\n"
                + "where class_trainer_id = ?\n"
                + "and class_name like '%" + class_name + "%'\n"
                + "and subject_name like '%" + subject_name + "%'\n"
                + "and setting_title like '%" + semester + "%'\n";

        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, trainer_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Class c = Class.builder()
                        .class_id(rs.getInt("class_id"))
                        .class_name(rs.getString("class_name"))
                        .class_subject_name(rs.getString("subject_name"))
                        .class_semester_name(rs.getString("setting_title"))
                        .build();
                classes.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return classes;
    }

    public static void main(String[] args) {
        TrainerDAO dao = new TrainerDAO();
        List<Account> acc = dao.getTraineeByEmail("trantib@gmail.com");

        System.out.println(acc.get(0).getId());
    }
}
