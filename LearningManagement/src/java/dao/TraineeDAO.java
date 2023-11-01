/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Quiz;

/**
 *
 * @author dell
 */
public class TraineeDAO extends DBContext{
    public Quiz getQuizById(int quizId) {
        Quiz quiz = null;
        String sql = "select * from quiz where quiz_id = ?;";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, quizId);  // Set the subjectId parameter
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                quiz = Quiz.builder()
                        .title(rs.getString("quiz_title"))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return quiz;
    }
}
