package model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@ToString
public class Account {

    private int accountId;
    private String accountEmail;
    private String accountPassword;
    private AccountDetail accountDetailId;
    private boolean accountDeleted;
    private Setting accountSettingId;

}
