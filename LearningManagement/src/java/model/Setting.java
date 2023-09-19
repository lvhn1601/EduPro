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
    private int settingId;
    private int settingRole;
    private String setttingSemester;
}
