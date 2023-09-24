/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Account;
import model.Setting;

/**
 *
 * @author dell
 */
public class AccountDAO extends DBContext {

    public Account authenticate(String username, String password) {
        String sql = "select "
                + "account_id, "
                + "account_email, "
                + "account_password, "
                + "account_active, "
                + "account_role_id, "
                + "s.setting_id " // Thay đổi tên cột thành "setting_id"
                + "from account a\n"
                + "inner join setting s on a.account_role_id = s.setting_id "
                + "where account_password = ? and account_email = ? and account_active = 1";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setObject(1, password);
            ps.setObject(2, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = Account.builder()
                        .id(rs.getInt("account_id"))
                        .email(rs.getString("account_email"))
                        .password(rs.getString("account_password"))
                        .active(rs.getBoolean("account_active"))
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
    try (PreparedStatement stm = connection.prepareStatement(sql)) {

        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Account a = Account.builder()
                    .id(rs.getInt("account_id"))
                    .email(rs.getString("account_email"))
                    .password(rs.getString("account_password"))
                    .active(rs.getBoolean("account_active"))
                    .phone(rs.getString("account_phone")) // Lấy giá trị account_phone từ ResultSet
                    .role(Setting.builder()
                            .id(rs.getInt("account_role_id")) // Sử dụng tên cột đúng
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
        String sql = "select * from account\n"
                + "update account a\n"
                + "set account_name = ?, account_avatar = ?, account_oauth = ?\n"
                + "where a.account_email = ?";

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
      
       public Account getOne(int accountId) {
              
    String sql = "select * from Account where account_id = ?";//
    try (PreparedStatement stm = connection.prepareStatement(sql)) {
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

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setObject(2, account_id);
            stm.setObject(1, account_password);
            check = stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }


    public static void main(String[] args) {
        Account acc = new AccountDAO().getOne(1);
//        System.out.println(new AccountDAO().authenticate("tungtshe171091@fpt.edu.vn", "123"));

System.out.println(new AccountDAO().changePassword(1, "234567"));
    }
}
