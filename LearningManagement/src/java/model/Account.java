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
public class Account {

    private int id;
    private String email;
    private String phone;
    private String password;
    private int active;
    private String name;
    private String avatar_url;
    private Date dob;
    private Setting role;
    private String created_by;
    private String created_at;
    private String update_by;
    private String update_at;
    private String oauth;

}
