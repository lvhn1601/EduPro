/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dell
 */
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import model.Class;
import model.Lesson;

@Builder
@Getter
@Setter
@ToString
public class Assignment {

    private Lesson lessonId;
    private Class classId;
    private String dueDate;

}
