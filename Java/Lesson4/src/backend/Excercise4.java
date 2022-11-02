package backend;

import entity.Account4;
import entity.Circle;
import entity.Date4;
import entity.Student;

import java.util.Scanner;

public class Excercise4 {
    /*
    Question 1:
        Tạo Object Student có các property id, name, hometown, điểm học lực
        a) Tất cả các property sẽ để là private để các class khác không
        chỉnh sửa hay nhìn thấy
        b) Tạo constructor cho phép khi khởi tạo mỗi student thì người
        dùng sẽ nhập vào tên, hometown và có điểm học lực = 0
        c) Tạo 1 method cho phép set điểm vào
        d) Tạo 1 method cho phép cộng thêm điểm
        e) Tạo 1 method để in ra thông tin của sinh viên bao gồm có tên,
        điểm học lực ( nếu điểm <4.0 thì sẽ in ra là Yếu, nếu điểm >
        4.0 và < 6.0 thì sẽ in ra là trung bình, nếu điểm > 6.0 và < 8.0
        thì sẽ in ra là khá, nếu > 8.0 thì in ra là Giỏi)
        Demo các chức năng trên bằng class ở front-end.
    */

    public static void question1(){
        Student st1 = new Student("name1", "H1");
        st1.plusScore(1f);

        Student st2 = new Student("name2", "H2");
        st2.plusScore(5f);

        Student st3 = new Student("name3", "H3");
        st3.plusScore(9f);

        System.out.println(st1);
        System.out.println(st2);
        System.out.println(st3);
    }

    public static void question2() {
        System.out.println("---Demo Circle ----");
        Circle circle = new Circle(2.0, "red");
        System.out.println("Diện tích hình tròn là: " + circle.getArea());
        System.out.println("---- Demo AccountQues2 -----");
        Account4 accQues1 = new Account4(1, "accQues1", 10);
        Account4 accQues2 = new Account4(2, "accQues2", 20);

        System.out.println(
                "Số tiền ban đầu của: accQues1: " + accQues1.getBalance() + " accQues2: " + accQues2.getBalance());

        accQues1.credit(50);
        System.out.println("Balace của accQues1 sau khi Credit 50: " + accQues1.getBalance());

        accQues1.debit(20);
        System.out.println("Balace của accQues1 sau khi debit 20: " + accQues1.getBalance());

        System.out.println("accQues1 chuyển 20 cho accQues2: ");

        accQues1.tranfer(accQues2, 20);
        System.out.println("Sau khi chuyển số tiền của accQues1: " + accQues1.getBalance() + " accQues2: " + accQues2.getBalance());

        System.out.println("---- Demo Date -----");
        Date4 date1 = new Date4(25, 04, 1988);
        System.out.println("Bạn vừa tạo ngày: " + date1);
        System.out.println("Check năm nhuận: ");
        if (date1.isLeapYear()) {
            System.out.println("Đây là năm nhuận");
        } else {
            System.out.println("Đây không phải là năm nhuận");
        }
    }
}
