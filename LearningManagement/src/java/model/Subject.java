/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author lvhn1
 */

@Builder
@Getter
@Setter
@ToString
public class Subject {
    private int id;
    private String name;
    private String code;
    private Account manager;
    private boolean status;
    private List<Dimension> dimension;
    private List<Chapter> chapter;
    private String created_by;
    private String created_at;
    private String update_by;
    private String update_at;
    
    private int countClass;
}
