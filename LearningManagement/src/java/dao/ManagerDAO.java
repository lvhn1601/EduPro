/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Class;
import model.Setting;
import model.Subject;

/**
 *
 * @author acer
 */
public class ManagerDAO extends DBContext {

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

    public static void main(String[] args) {
        System.out.println(new ManagerDAO().getSubject());
        System.out.println(new ManagerDAO().getSemester());
    }
}
