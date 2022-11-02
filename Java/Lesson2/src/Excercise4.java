import java.time.LocalDate;
import java.util.Random;

public class Excercise4 {
    public static void main(String[] args) {
        Random random = new Random();
        /*
        Question 1:
        In ngẫu nhiên ra 1 số nguyên
         */
        int x = random.nextInt();
        System.out.println(x);

        /*
        Question 2:
        In ngẫu nhiên ra 1 số thực
        */
        float y = random.nextFloat();
        System.out.println(y);

        /*
        Question 3:
        Khai báo 1 array bao gồm các tên của các bạn trong lớp, sau đó in ngẫu nhiên
        ra tên của 1 bạn
         */
        String[] name = {"Hân", "Huyền", "Hòa", "Hạnh", "Tú", "Đạt", "Long", "Dũng"};
        System.out.println(name[random.nextInt(name.length)]);

        /*
        Question 4:
        Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 24-07-1995 tới ngày 20-12-1995
         */
        int minday = (int) LocalDate.of(1995,07,24).toEpochDay();
        int maxday = (int) LocalDate.of(1995,12,20).toEpochDay();

        long randomInt = minday + random.nextInt(maxday - minday);

        LocalDate randomDay = LocalDate.ofEpochDay(randomInt);

        System.out.println(randomDay);

        /*
        Question 5:
        Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 1 năm trở lại đây
         */


        /*
        Question 6:
        Lấy ngẫu nhiên 1 ngày trong quá khứ
        */


        /*
        Question 7:
        Lấy ngẫu nhiên 1 số có 3 chữ số
        */
        int min = 100;
        int max = 999;
        long rand = min + random.nextInt(max-min);
        System.out.println(rand);
    }
}
