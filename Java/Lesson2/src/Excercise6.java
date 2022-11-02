public class Excercise6 {
    public static void main(String[] args) {
        /*
        Question 1:
        Tạo method để in ra các số chẵn nguyên dương nhỏ hơn 10
        */
        soChanNguyenDuong();
    }
    public static int soChanNguyenDuong(){
        for (int i = 1; i< 10; i++){
            if(i % 2 == 0){
                System.out.println("Số chẵn nguyên dương nhỏ hơn 10 là: " +i);
            }
        }
        return 0;
    }

}
