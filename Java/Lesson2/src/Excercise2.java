import java.text.SimpleDateFormat;
import java.util.Date;

public class Excercise2 {
    public static void main(String[] args) {
        /*
        Question 1:
        Khai báo 1 số nguyên = 5 và sử dụng lệnh System out printf để in ra số nguyên đó
        */
        System.out.printf("%d %n",5);

        /*
        Question 2:
        Khai báo 1 số nguyên = 100 000 000 và sử dụng lệnh System out printf để in
        ra số nguyên đó thành định dạng như sau: 100,000,000
        */
        System.out.printf("%,d %n",100000000);

        /*
        Question 3:
        Khai báo 1 số thực = 5,567098 và sử dụng lệnh System out printf để in ra số
        thực đó chỉ bao gồm 4 số đằng sau
         */
        System.out.printf("%5.4f %n",5.567098);

        /*
        Question 4:
        Khai báo Họ và tên của 1 học sinh và in ra họ và tên học sinh đó theo định
        dạng như sau:
        Họ và tên: "Nguyễn Văn A" thì sẽ in ra trên console như sau:
        Tên tôi là "Nguyễn Văn A" và tôi đang độc thân.
         */
        System.out.printf("Tên tôi là %s %s %s và tôi đang độc thân %n", "Nguyễn", "Văn", "A");

        /*
        Question 5:
        Lấy thời gian bây giờ và in ra theo định dạng sau:
        24/04/2020 11h:16p:20s
         */
        String datenow = "dd/MM/yyyy HH:mm:ss";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(datenow);
        String date = simpleDateFormat.format(new Date());
        System.out.println(date);

        /*
        Question 6:
        In ra thông tin account (như Question 8 phần FOREACH) theo định dạng
        table (giống trong Database)
         */
    }
}
