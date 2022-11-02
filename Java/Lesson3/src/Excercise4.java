import java.util.Scanner;
import java.lang.String;

public class Excercise4 {
    public static void main(String[] args) {
        /*
        Question 1:
        Nhập một xâu kí tự, đếm số lượng các từ trong xâu kí tự đó (các từ có
        thể cách nhau bằng nhiều khoảng trắng );
         */
        question1();

        /*
        Question 2:
        Nhập hai xâu kí tự s1, s2 nối xâu kí tự s2 vào sau xâu s1;
         */
        question2();

        /*
        Question 3:
        Viết chương trình để người dùng nhập vào tên và kiểm tra, nếu tên chư
        viết hoa chữ cái đầu thì viết hoa lên
         */
        //question3(); -- sai

        /*
        Question 4:
        Viết chương trình để người dùng nhập vào tên in từng ký tự trong tên
        của người dùng ra
        VD:
        Người dùng nhập vào "Nam", hệ thống sẽ in ra
        "Ký tự thứ 1 là: N"
        "Ký tự thứ 1 là: A"
        "Ký tự thứ 1 là: M"
         */
        question4();
    }
    public static void question1(){
        Scanner scanner = new Scanner(System.in);
        String x;
        System.out.println("Nhập vào 1 xâu kí tự có thể cách nhau bằng nhiều khoảng trắng: ");
        x = scanner.nextLine();
    }

    public static void question2(){
        Scanner scanner = new Scanner(System.in);
        String s1, s2;
        System.out.println("Nhập vào 2 xâu kí tự: ");
        s1 = scanner.next();
        s2 = scanner.next();
        System.out.printf("Kết quả sau khi nối: %s %s",s2,s1);
    }

    public static String question3(){
        Scanner scanner = new Scanner(System.in);
        String result = "";
        String x;
        System.out.println("\nNhập vào tên của bạn: ");
        x = scanner.nextLine();
        String[] name = x.split(" ");
        for (String s : name) {
            result += String.valueOf(s.charAt(0)).toUpperCase() + s.substring(1) + " ";
        }
        return result.substring(0, result.length()-1);
    }
    public static void question4(){
        Scanner scanner = new Scanner(System.in);
        String name;
        System.out.println("\nNhập vào tên của bạn: ");
        name = scanner.nextLine();
        name = name.toUpperCase();
        name = name.trim();
        for (int i = 0; i< name.length(); i++){
            System.out.println("Ký tự thứ " + (i+1) + "là: " +name.charAt(i));
        }
        scanner.close();
    }

}
