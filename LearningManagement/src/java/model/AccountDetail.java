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
public class AccountDetail {

    private int accDetailId;
    private String accName;
    private String accAvatar;
    private String OAuthId;
    private Date dob;
}
