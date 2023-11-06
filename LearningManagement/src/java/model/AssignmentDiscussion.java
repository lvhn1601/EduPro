/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Time;

/**
 *
 * @author acer
 */
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@ToString
public class AssignmentDiscussion {
    private int assignmentDiscussionId;
    private int lessonId;
    private Account account;
    private String commentValue;
    private String createAt;
}
