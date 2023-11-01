package model;

import java.sql.Date;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@ToString
/**
 *
 * @author acer
 */
public class Class {

    private int class_id;
    private String class_name;
    private String class_subject_name;
    private String class_semester_name;
    private String class_trainer_name;
    private Boolean class_status;
    private Date class_start;
    private Date class_end;
    private String created_by;
    private Date created_at;
    private String update_by;
    private Date update_at;

}
