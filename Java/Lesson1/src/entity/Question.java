package entity;

import java.time.LocalDate;
import java.util.Arrays;

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
