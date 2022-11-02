import java.util.Scanner;

public class Excercise5 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        /*
        Question 1:
        Viết lệnh cho phép người dùng nhập 3 số nguyên vào chương trình
         */
        System.out.println("Mời bạn nhập vào 3 số nguyên bất kì:");
        int a = scanner.nextInt();
        int b = scanner.nextInt();
        int c = scanner.nextInt();
        System.out.println("3 số bạn vừa nhập là: " +a+", " +b+", " +c);

        /*
        Question 2:
        Viết lệnh cho phép người dùng nhập 2 số thực vào chương trình
         */
        System.out.println("Mời bạn nhập vào 2 số thực bất kì:");
        float d = scanner.nextFloat();
        float e = scanner.nextFloat();
        System.out.println("2 số bạn vừa nhập là: " +d+", " +e);

        /*
        Question 3:
        Viết lệnh cho phép người dùng nhập họ và tên
         */
        System.out.println("Mời bạn nhập vào họ và tên:");
        String ho = scanner.next();
        String ten = scanner.next();
        System.out.println("Họ và tên của bạn là: " + ho + " " + ten);

        /*
        Question 4:
        Viết lệnh cho phép người dùng nhập vào ngày sinh nhật của họ
         */
        System.out.println("Mời bạn nhập vào ngày sinh nhật: ");
        String dateBirtday = scanner.next();
    }
}
