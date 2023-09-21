package model;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@ToString
public class Setting {
    private int id;
    private String title;
    private boolean status;
    private String created_by;
    private String created_at;
    private String update_by;
    private String update_at;
}
