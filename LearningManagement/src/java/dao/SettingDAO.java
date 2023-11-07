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
import model.Setting;

/**
 *
 * @author dell
 */
public class SettingDAO extends DBContext {

    public List<Setting> getListDomain() {

        String sql = "select s.setting_id, s.setting_key, s.setting_title from setting s\n"
                + "where setting_key = 3";

        try ( PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();
            System.out.println(sql);
            List<Setting> list = new ArrayList<>();//
            while (rs.next()) {
                Setting s = Setting.builder()
                        .id(rs.getInt("setting_id"))
                        .title(rs.getString("setting_title"))
                        .build();
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(new SettingDAO().getListDomain());
    }
}
