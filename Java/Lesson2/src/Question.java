import java.sql.Date;
import java.time.LocalDate;
import java.util.Arrays;
import java.lang.String;

public class Question {
    int         questionId;

    String      content;

    CategoryQuestion categoryQuestion;

    TypeQuestion typeQuestion;

    int         creatorId;

    LocalDate    createDate;

    Exam[] exams;

    @Override
    public String toString() {
        return "Question{" +
                "questionId=" + questionId +
                ", content='" + content + '\'' +
                ", categoryQuestion=" + categoryQuestion +
                ", typeQuestion=" + typeQuestion +
                ", creatorId=" + creatorId +
                ", createDate=" + createDate +
                ", exams=" + Arrays.toString(exams) +
                '}';
    }
}
