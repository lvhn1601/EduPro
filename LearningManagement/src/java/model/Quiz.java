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
public class Quiz {
    private int id;
    private String title;
    private String description;
    private boolean type;
    private Subject subject;
    private Chapter chapter;
    private boolean status;
    private boolean config_by;
    private String dimension_type;
    private int num_of_question;
    private String created_by;
    private String created_at;
    private String update_by;
    private String update_at;
}
