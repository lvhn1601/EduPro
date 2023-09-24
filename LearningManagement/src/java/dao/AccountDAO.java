/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.DBContext;
import dto.UserGoogleDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Setting;

/**
 *
 * @author dell
 */
public class AccountDAO extends DBContext {

    public Account authenticate(String username, String password) {
        String sql = "SELECT "
                + "account_id, "
                + "account_email, "
                + "account_phone, "
                + "account_password, "
                + "account_active, "
                + "account_role_id, "
                + "s.setting_id "
                + "FROM account a "
                + "INNER JOIN setting s ON a.account_role_id = s.setting_id "
                + "WHERE (account_password = ?) "
                + "AND account_active = 1 "
                + "AND (account_email = ? OR account_phone = ?)";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setObject(1, password);
            ps.setObject(2, username);
            ps.setObject(3, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = Account.builder()
                        .id(rs.getInt("account_id"))
                        .email(rs.getString("account_email"))
                        .password(rs.getString("account_password"))
                        .active(rs.getBoolean("account_active"))
                        .phone(rs.getString("account_phone"))
                        .role(Setting.builder()
                                .id(rs.getInt("account_role_id"))
                                .build())
                        .build();
                return a;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public ArrayList<Account> getAll() {
        ArrayList<Account> accs = new ArrayList<>();
        String sql = "select a.account_id, "
                + "a.account_email, "
                + "a.account_password, "
                + "a.account_active, "
                + "a.account_role_id, "
                + "s.setting_title, "
                + "a.account_phone "
                + "from account a "
                + "inner join setting s on a.account_role_id = s.setting_id "
                + "where a.account_active = 1";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = Account.builder()
                        .id(rs.getInt("account_id"))
                        .email(rs.getString("account_email"))
                        .password(rs.getString("account_password"))
                        .active(rs.getBoolean("account_active"))
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

    public boolean updateGoogleAcc(String name, String avatar, String oauth, String gmail) {
        int check = 0;
        String sql = "update account \n"
                + "  set account_name = ?, account_avatar_url = ?, account_oauth = ?\n"
                + "  where account_email = ?";

        try ( PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, name);
            ps.setObject(2, avatar);
            ps.setObject(3, oauth);
            ps.setObject(4, gmail);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public Account getOneByAccountId(int accountId) {

        String sql = "select * from Account where account_id = ?";//
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setObject(1, accountId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account s = Account.builder()
                        .id(rs.getInt("account_id"))
                        .email(rs.getString("account_email"))
                        .phone(rs.getString("account_phone"))
                        .password(rs.getString("account_password"))
                        .active(rs.getBoolean("account_active"))
                        .name(rs.getString("account_name"))
                        .avatar_url(rs.getString("account_avatar_url"))
                        .dob(rs.getDate("account_dob"))
                        .role(Setting.builder()
                                .id(rs.getInt("account_role_id"))
                                .build())
                        .build();
                return s;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public boolean changePassword(int account_id, String account_password) {
        int check = 0;
        String sql = "UPDATE Account SET account_password = ? WHERE account_id = ?";

        try ( PreparedStatement stm = connection.prepareStatement(sql)) {

            stm.setObject(1, account_password);
            stm.setObject(2, account_id);

            check = stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public Account getOneByEmail(String email) {

        String sql = "Select * FROM Account WHERE account_email = ?";

        try ( PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = Account.builder().email(rs.getString("account_email")).build();
                return a;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public Account getOneByPhoneNum(String phoneNum) {

        String sql = "Select * FROM Account WHERE account_phone = ?";

        try ( PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, phoneNum);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = Account.builder().phone(rs.getString("account_phone")).build();
                return a;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int register(Account obj) {
        int check = 0;
        String sql = "";
        if (obj.getEmail() != null) {
            sql = "INSERT INTO Account(account_email, account_password, account_name, account_role_id) VALUES (?, ?, ?, 1)";
        } else if (obj.getPhone() != null) {
            sql = "INSERT INTO Account(account_phone, account_password, account_name, account_role_id) VALUES (?, ?, ?, 1)";
        }
        if (sql.isEmpty()) {
            return 0;
        }
        try ( PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, obj.getEmail() != null ? obj.getEmail() : obj.getPhone());
            ps.setString(2, obj.getPassword());
            ps.setString(3, obj.getName());

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

    public int registerGoogleAcc(UserGoogleDto obj) {
        int check = 0;
        String sql = "INSERT INTO Account(account_email, account_avatar_url, account_name, account_oauth, account_role_id) VALUES (?, ?, ?, ?, 1)";

        if (sql.isEmpty()) {
            return 0;
        }
        try ( PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, obj.getEmail());
            ps.setString(2, obj.getPicture());
            ps.setString(3, obj.getName());
            ps.setString(4, obj.getId());
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

    public boolean resetPassword(String username, String newPassword) {
        int check = 0;
        String sql = "UPDATE account SET account_password = ? WHERE account_email = ? OR account_phone = ?;";

        try ( PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, newPassword);
            ps.setObject(2, username);
            ps.setObject(3, username);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public static void main(String[] args) {
    }
}
