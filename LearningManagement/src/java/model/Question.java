/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@ToString
public class Question {

    private int id;
    private String detail;
    private int correct_id;
    private Lesson lesson;
    private Chapter chapter;
    private Subject subject;
    private boolean status;
    private String created_by;
    private String created_at;
    private String update_by;
    private String update_at;
}
