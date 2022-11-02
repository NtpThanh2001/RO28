package entity;

import java.time.LocalDate;
import java.util.Arrays;
import java.lang.String;

public class Account {
    private int accountId;

    private String mail;

    private String userName;

    private String fullName;

    private Department department;

    private Position position;

    private LocalDate createDate;

    private Group[] groups;

    public Account() {
    }

    public Account(int accountId, String mail, String userName, String fullName) {
        this.accountId = accountId;
        this.mail = mail;
        this.userName = userName;
        this.fullName = fullName;
    }

    public Account(int accountId, String mail, String userName, String fullName, Position position) {
        this.accountId = accountId;
        this.mail = mail;
        this.userName = userName;
        this.fullName = fullName;
        this.position = position;
        this.createDate = LocalDate.now();
    }

    public Account(int accountId, String mail, String userName, String fullName, Position
            position, LocalDate createDate) {

        super();
        this.accountId = accountId;
        this.mail = mail;
        this.userName = userName;
        this.fullName = fullName;
        this.position = position;
        this.createDate = createDate;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public LocalDate getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDate createDate) {
        this.createDate = createDate;
    }

    public Group[] getGroups() {
        return groups;
    }

    public void setGroups(Group[] groups) {
        this.groups = groups;
    }

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
