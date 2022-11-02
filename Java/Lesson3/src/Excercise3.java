public class Excercise3 {
    public static void main(String[] args) {
        /*
        Question 1:
        Khởi tạo lương có datatype là Integer có giá trị bằng 5000.
        Sau đó convert lương ra float và hiển thị lương lên màn hình (với số
        float có 2 số sau dấu thập phân)
         */
        question1();

        /*
        Question 2:
        Khai báo 1 String có value = "1234567"
        Hãy convert String đó ra số int
         */
        question2();
        /*
        Question 3:
        Khởi tạo 1 số Integer có value là chữ "1234567"
        Sau đó convert số trên thành datatype int
         */
        question3();
    }
    public static void question1(){
        int luong = 5000;
        float x = (float) luong;
        System.out.printf("%.2f",x);
    }
    public  static void question2(){
        String val = "1234567";
        int x = Integer.parseInt(val);
        System.out.println("\nChuyển đổi chuỗi thành số nguyên: "+x);
    }
    public static void question3(){
        Integer i = 1234567;
        int y = i.intValue();
        System.out.println(y);
    }
}
