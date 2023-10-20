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
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Setting;
import model.Subject;

/**
 *
 * @author lvhn1
 */
public class AdminDAO extends DBContext {

    // Check valid email & phone
    public boolean emailExist(String email) {
        String sql = "select *\n"
                + "from account where account_email = ?";
        
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
                return true;
            
        } catch (SQLException e) {
        }
        return false;
    }
    
    public boolean phoneExist(String phone) {
        String sql = "select *\n"
                + "from account where account_phone = ?";
        
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
                return true;
            
        } catch (SQLException e) {
        }
        return false;
    }
    
    public List<Setting> getRoles() {
        String sql = "select this.setting_id, this.setting_title, this.setting_status, creator.account_name as created_by, this.created_at, updater.account_name as update_by, this.update_at\n"
                + "from \n"
                + "	setting as this\n"
                + "left join \n"
                + "	account as creator\n"
                + "on creator.account_id = this.created_by\n"
                + "left join \n"
                + "	account as updater\n"
                + "on updater.account_id = this.update_by\n"
                + "where setting_key = 1";

        List<Setting> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Setting.builder()
                        .id(rs.getInt("setting_id"))
                        .title(rs.getString("setting_title"))
                        .status(rs.getBoolean("setting_status"))
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

    public List<String> getDomains() {
        String sql = "select setting_title\n"
                + "from setting\n"
                + "where setting_key = 3 and setting_status = 1";
        
        List<String> list = new ArrayList<>();
        
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(rs.getString("setting_title"));
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Account> getUsersInPage(String search, int page_num) {
        String sql = "select this.account_id, this.account_email, this.account_phone, this.account_active, this.account_name, this.account_avatar_url, \n"
                + "this.account_dob, role.setting_id as role_id, role.setting_title as role_title, creator.account_name as created_by, this.created_at, updater.account_name as update_by, this.update_at\n"
                + "from \n"
                + "	account as this\n"
                + "join\n"
                + "	setting as `role`\n"
                + "on role.setting_id = this.account_role_id\n"
                + "left join\n"
                + "	account as creator\n"
                + "on this.created_by = creator.account_id\n"
                + "left join\n"
                + "	account as updater\n"
                + "on this.update_by = updater.account_id\n"
                + "where this.account_name like '%" + search + "%'\n"
                + "limit 8 offset ?";

        List<Account> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (page_num - 1) * 8);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Account.builder()
                        .id(rs.getInt("account_id"))
                        .email(rs.getString("account_email"))
                        .phone(rs.getString("account_phone"))
                        .active(rs.getBoolean("account_active"))
                        .name(rs.getString("account_name"))
                        .avatar_url(rs.getString("account_avatar_url"))
                        .dob(rs.getDate("account_dob"))
                        .role(Setting.builder()
                                .id(rs.getInt("role_id"))
                                .title(rs.getString("role_title"))
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

    public Account getUserByID(int id) {
        String sql = "select this.account_id, this.account_email, this.account_phone, this.account_active, this.account_name, this.account_avatar_url, \n"
                + "this.account_dob, role.setting_id as role_id, role.setting_title as role_title, creator.account_name as created_by, this.created_at, updater.account_name as update_by, this.update_at\n"
                + "from \n"
                + "	account as this\n"
                + "join\n"
                + "	setting as `role`\n"
                + "on role.setting_id = this.account_role_id\n"
                + "left join\n"
                + "	account as creator\n"
                + "on this.created_by = creator.account_id\n"
                + "left join\n"
                + "	account as updater\n"
                + "on this.update_by = updater.account_id\n"
                + "where this.account_id = ?";

        Account user = null;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = Account.builder()
                        .id(rs.getInt("account_id"))
                        .email(rs.getString("account_email"))
                        .phone(rs.getString("account_phone"))
                        .active(rs.getBoolean("account_active"))
                        .name(rs.getString("account_name"))
                        .avatar_url(rs.getString("account_avatar_url"))
                        .dob(rs.getDate("account_dob"))
                        .role(Setting.builder()
                                .id(rs.getInt("role_id"))
                                .title(rs.getString("role_title"))
                                .build()
                        )
                        .created_by(rs.getString("created_by"))
                        .created_at(rs.getString("created_at"))
                        .update_by(rs.getString("update_by"))
                        .update_at(rs.getString("update_at"))
                        .build();
            }
        } catch (SQLException e) {
        }

        return user;
    }

    public void addUser(String name, String email, String phone, Date dob, int role_id, int admin_id) {
        String sql = "insert into `account` (account_email, account_phone, account_password, account_name, account_avatar_url, account_dob, account_role_id, created_by, update_by)\n"
                + "values (?, ?, '1', ?, \"https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg\", ?, ?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, (email.equals("") ? null : email));
            ps.setString(2, (phone.equals("") ? null : phone));
            ps.setString(3, name);
            ps.setDate(4, dob);
            ps.setInt(5, role_id);
            ps.setInt(6, admin_id);
            ps.setInt(7, admin_id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateUserInfo(int id, String name, String email, String phone, Date dob, int role_id, int admin_id) {
        String sql = "update account \n"
                + "set \n"
                + "	account_name = ?,\n"
                + "	account_email = ?, \n"
                + "    account_phone = ?,\n"
                + "    account_dob = ?,\n"
                + "    account_role_id = ?,\n"
                + "    update_by = ? \n"
                + "where account_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, (email.equals("") ? null : email));
            ps.setString(3, (phone.equals("") ? null : phone));
            ps.setDate(4, dob);
            ps.setInt(5, role_id);
            ps.setInt(6, admin_id);
            ps.setInt(7, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int countUsers(String search) {
        String sql = "select count(account_id) as num from account\n"
                + "where account_name like '%" + search + "%'";

        int count = 0;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery(sql);

            if (rs.next()) {
                count = rs.getInt("num");
            }
        } catch (SQLException e) {
        }

        return count;
    }

    public void updateStatus(String table, String title, int id, int value, int admin_id) {
        String sql = "update " + table + " set " + title + " = " + value + ", update_by = ? where " + table + "_id = " + id;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, admin_id);
            System.out.println(ps.toString());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateRole(int id, int role_id, int admin_id) {
        String sql = "update account set account_role_id = ?, update_by = ? where account_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, role_id);
            ps.setInt(2, admin_id);
            ps.setInt(3, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateDisplayOrder(int id, int value, int admin_id) {
        String sql = "update setting set setting_display_order = ?, update_by = ? where setting_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, value);
            ps.setInt(2, admin_id);
            ps.setInt(3, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Subject> getSubjectInPage(String search, int page_num) {
        String sql = "SELECT s.subject_id, s.subject_name, s.subject_code, manager.account_id as manager_id, manager.account_name as manager_name, s.subject_status, creator.account_name as created_by, s.created_at, updater.account_name as update_by, s.update_at \n"
                + "FROM \n"
                + "	subject as s\n"
                + "left join\n"
                + "	account as manager\n"
                + "on s.subject_manager_id = manager.account_id\n"
                + "left join\n"
                + "	account as creator\n"
                + "on s.created_by = creator.account_id\n"
                + "left join\n"
                + "	account as updater\n"
                + "on s.update_by = updater.account_id\n"
                + "where subject_name like '%" + search + "%' or subject_code like '%" + search + "%'\n"
                + "limit 8 offset ?";

        List<Subject> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (page_num - 1) * 8);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Subject.builder()
                        .id(rs.getInt("subject_id"))
                        .name(rs.getString("subject_name"))
                        .code(rs.getString("subject_code"))
                        .manager(Account.builder()
                                .id(rs.getInt("manager_id"))
                                .name(rs.getString("manager_name"))
                                .build()
                        )
                        .status(rs.getBoolean("subject_status"))
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

    public int countSubjects(String search) {
        String sql = "select count(subject_id) as num from subject\n"
                + "where subject_name like '%" + search + "%' or subject_code like '%" + search + "%'";

        int count = 0;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt("num");
            }
        } catch (SQLException e) {
        }

        return count;
    }

    public List<Account> getManagers() {
        String sql = "select account_id, account_name from account\n"
                + "left join setting on account_role_id = setting_id\n"
                + "where setting_key = 1 and account_active = 1 and setting_id = 2";

        List<Account> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Account.builder()
                        .id(rs.getInt("account_id"))
                        .name(rs.getString("account_name"))
                        .build()
                );
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public Subject getSubjectByID(int id) {
        String sql = "SELECT s.subject_id, s.subject_name, s.subject_code, manager.account_id as manager_id, manager.account_name as manager_name, s.subject_status, creator.account_name as created_by, s.created_at, updater.account_name as update_by, s.update_at \n"
                + "FROM \n"
                + "	subject as s\n"
                + "left join\n"
                + "	account as manager\n"
                + "on s.subject_manager_id = manager.account_id\n"
                + "left join\n"
                + "	account as creator\n"
                + "on s.created_by = creator.account_id\n"
                + "left join\n"
                + "	account as updater\n"
                + "on s.update_by = updater.account_id\n"
                + "where s.subject_id = ?";

        Subject subject = null;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                subject = Subject.builder()
                        .id(rs.getInt("subject_id"))
                        .name(rs.getString("subject_name"))
                        .code(rs.getString("subject_code"))
                        .manager(Account.builder()
                                .id(rs.getInt("manager_id"))
                                .name(rs.getString("manager_name"))
                                .build()
                        )
                        .status(rs.getBoolean("subject_status"))
                        .created_by(rs.getString("created_by"))
                        .created_at(rs.getString("created_at"))
                        .update_by(rs.getString("update_by"))
                        .update_by(rs.getString("update_at"))
                        .build();
            }
        } catch (SQLException e) {
        }

        return subject;
    }

    public void updateSubjectInfo(int id, String name, String code, int manager_id, int admin_id) {
        String sql = "update subject\n"
                + "set\n"
                + "	subject_name = ?,\n"
                + "	subject_code = ?,\n"
                + "	subject_manager_id = ?,\n"
                + "	update_by = ?\n"
                + "where subject_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, code);
            ps.setInt(3, manager_id);
            ps.setInt(4, admin_id);
            ps.setInt(5, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addSubject(String name, String code, int manager_id, int admin_id) {
        String sql = "insert into subject (subject_name, subject_code, subject_manager_id, created_by, update_by)\n"
                + "values\n"
                + "(?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, code);
            ps.setInt(3, manager_id);
            ps.setInt(4, admin_id);
            ps.setInt(5, admin_id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Setting> getSettings(int key) {
        String sql = "select s.setting_id, s.setting_title, s.setting_display_order, s.setting_status, creator.account_name as created_by, s.created_at, updater.account_name as update_by, s.update_at\n"
                + "from \n"
                + "	setting as s\n"
                + "left join\n"
                + "	account as creator\n"
                + "on s.created_by = creator.account_id\n"
                + "left join\n"
                + "	account as updater\n"
                + "on s.update_by = updater.account_id\n"
                + "where s.setting_key = ?";

        List<Setting> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, key);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(Setting.builder()
                        .id(rs.getInt("setting_id"))
                        .title(rs.getString("setting_title"))
                        .display_order(rs.getInt("setting_display_order"))
                        .status(rs.getBoolean("setting_status"))
                        .created_by(rs.getString("created_by") == null ? "System" : rs.getString("created_by"))
                        .created_at(rs.getString("created_at"))
                        .update_by(rs.getString("update_by") == null ? "System" : rs.getString("update_by"))
                        .update_at(rs.getString("update_at"))
                        .build()
                );
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public void updateSetting(int id, String title, int admin_id) {
        String sql = "update setting\n"
                + "set setting_title = ?, update_by = ?\n"
                + "where setting_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setInt(2, admin_id);
            ps.setInt(3, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addSetting(int key, String title, int admin_id) {
        String sql = "insert into setting (setting_key, setting_title, created_by, update_by)\n"
                + "values (?, ?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, key);
            ps.setString(2, title);
            ps.setInt(3, admin_id);
            ps.setInt(4, admin_id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
