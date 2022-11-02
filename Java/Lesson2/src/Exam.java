import java.sql.Date;
import java.time.LocalDate;
import java.util.Arrays;

public class Exam {
    int         examId;

    String      code;

    String      title;

    CategoryQuestion[] category;

    int         duration;

    Account creator;

    LocalDate   createDate;

    Question[] questions;

    @Override
    public String toString() {
        return "Exam{" +
                "examId=" + examId +
                ", code='" + code + '\'' +
                ", title='" + title + '\'' +
                ", category=" + Arrays.toString(category) +
                ", duration=" + duration +
                ", creator=" + creator +
                ", createDate=" + createDate +
                ", questions=" + Arrays.toString(questions) +
                '}';
    }
}
