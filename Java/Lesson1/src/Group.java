import java.time.LocalDate;
import java.util.Arrays;
import java.lang.String;

public class Group {
    int         groupId;

    String groupName;

    Account     creator;

    LocalDate    createDate;

    Account[]   accounts;

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
