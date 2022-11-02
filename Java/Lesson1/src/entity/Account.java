package entity;

import java.time.LocalDate;
import java.util.Arrays;

public class Account {
    static int         accountId;

    String mail;

    String userName;

    String fullName;

    Department department;

    Position position;

    LocalDate   createDate;

    Group[]     groups;

    @Override
    public String toString() {
        return "Account{" +
                "accountId=" + accountId +
                ", mail='" + mail + '\'' +
                ", userName='" + userName + '\'' +
                ", fullName='" + fullName + '\'' +
                ", department=" + department +
                ", position=" + position +
                ", createDate=" + createDate +
                ", groups=" + Arrays.toString(groups) +
                '}';
    }
}
