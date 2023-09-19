/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.MySQLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.AccountDetail;
import model.Setting;

/**
 *
 * @author dell
 */
public class AccountDAO {

    public Account authenticate(String username, String password) {

        String sql = "SELECT a.account_id, a.account_email, a.account_password, a.account_deleted, d.account_detail_oauth, s.setting_role_id\n"
                + "FROM account a\n"
                + "INNER JOIN account_detail d ON a.account_detail_id = d.account_detail_id\n"
                + "INNER JOIN setting s ON a.account_setting_id = s.setting_id \n"
                + "where a.account_email = ? and a.account_password = ? and a.account_deleted = 0";

        try ( Connection connection = MySQLConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, username);
            ps.setObject(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = Account.builder()
                        .accountId(rs.getInt("account_id"))
                        .accountEmail(rs.getString("account_email"))
                        .accountPassword(rs.getString("account_password"))
                        .accountDetailId(AccountDetail.builder()
                                .OAuthId(rs.getString("account_detail_oauth"))
                                .build())
                        .accountSettingId(Setting.builder()
                                .settingId(rs.getInt("setting_role_id"))
                                .settingRole(rs.getInt("setting_role_id"))
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
        String sql = "SELECT a.account_id, a.account_email, a.account_password, d.account_detail_oauth, s.setting_role_id\n"
                + "FROM account a\n"
                + "INNER JOIN account_detail d ON a.account_detail_id = d.account_detail_id\n"
                + "INNER JOIN setting s ON a.account_setting_id = s.setting_id \n";
        try ( Connection connection = MySQLConnection.getConnection();  PreparedStatement stm = connection.prepareStatement(sql);) {

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = Account.builder()
                        .accountId(rs.getInt("account_id"))
                        .accountEmail(rs.getString("account_email"))
                        .accountPassword(rs.getString("account_password"))
                        .accountDetailId(AccountDetail.builder()
                                .OAuthId(rs.getString("account_detail_oauth"))
                                .build())
                        .accountSettingId(Setting.builder()
                                .settingId(rs.getInt("setting_role_id"))
                                .settingRole(rs.getInt("setting_role_id"))
                                .build())
                        .build();
                accs.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return accs;
    }

    public boolean updateGoogleAcc(String name, String avatar, String oauth) {
        int check = 0;
        String sql = "update account a\n"
                + "inner join account_detail d on a.account_detail_id = d.account_detail_id\n"
                + "set account_detail_name = ?, account_detail_avatar = ?, account_detail_oauth = ?\n"
                + "where a.account_email = 'tungtshe171091@fpt.edu.vn'";

        try ( Connection con = MySQLConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, name);
            ps.setObject(2, avatar);
            ps.setObject(3, oauth);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public static void main(String[] args) throws SQLException {
        ArrayList<Account> l = new AccountDAO().getAll();
        System.out.println(new AccountDAO().authenticate("tungtshe171091@fpt.edu.vn", "123"));
    }
}
