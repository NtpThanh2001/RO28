package entity;

import java.time.LocalDate;
import java.util.Arrays;
import java.lang.String;

public class Group {

    private int groupId;

    private String groupName;

    private Account creator;

    private LocalDate createDate;

    private Account[] accounts;

    public Group() {
    }

    public Group(String groupName, Account creator, LocalDate createDate, Account[] accounts) {
        this.groupName = groupName;
        this.creator = creator;
        this.createDate = createDate;
        this.accounts = accounts;
    }

//    public Group(String groupName, Account creator, String[] usernames, LocalDate createDate) {
//        this.groupName = groupName;
//        this.creator = creator;
//
//        // accounts
//        Account[] accounts = new Account[usernames.length];
//        for (int i = 0; i < usernames.length; i++) {
//            accounts[i] = new Account(usernames[i]);
//        }
//        this.createDate = createDate;
//    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public Account getCreator() {
        return creator;
    }

    public void setCreator(Account creator) {
        this.creator = creator;
    }

    public LocalDate getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDate createDate) {
        this.createDate = createDate;
    }

    public Account[] getAccounts() {
        return accounts;
    }

    public void setAccounts(Account[] accounts) {
        this.accounts = accounts;
    }

    @Override
    public String toString() {
        return "Group{" +
                "groupId=" + groupId +
                ", groupName='" + groupName + '\'' +
                ", creator=" + creator +
                ", createDate=" + createDate +
                ", accounts=" + Arrays.toString(accounts) +
                '}';
    }
}
