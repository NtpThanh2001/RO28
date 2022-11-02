package backend;

import entity.Employee;
import entity.Manager;
import entity.VietnamesePhone;
import entity.Waiter;

import java.util.Scanner;

public class Excercise6 {
    static Scanner sc;

    public void Exercise6() {
        sc = new Scanner(System.in);
    }

    public void question1(){
        VietnamesePhone vnPhone = new VietnamesePhone();
        while (true){
            System.out.println("-------------------------------------");
            System.out.println("Chọn chức năng bạn muốn sử dụng: ");
            System.out.println("1. InsertContact");
            System.out.println("2. RemoveContact");
            System.out.println("3. UpdateContact");
            System.out.println("4. SearchContact");
            System.out.println("5. ShowContact");
            System.out.println("6. Thoát ");
            System.out.println("-------------------------------------");

            int menu = sc.nextInt();
            switch (menu){
                case 1:
                    System.out.println("Nhập vào tên Contact: ");
                    String name = sc.next();
                    System.out.println("Nhập vào tên số Phone: ");
                    String phone = sc.next();
                    vnPhone.insertContact(name, phone);
                    break;
                case 2:
                    System.out.println("Nhập vào tên Contact cần remove: ");
                    String removeName = sc.next();
                    vnPhone.removeContact(removeName);
                    break;
                case 3:
                    System.out.println("Nhập tên cần Update: ");
                    String name1 = sc.next();
                    System.out.println("Nhập số Phone mới: ");
                    String newPhone = sc.next();
                    vnPhone.updateContact(name1, newPhone);
                    System.out.println("Kết quả: ");
                    vnPhone.searchContact(name1);
                    break;
                case 4:
                    System.out.println("Nhập vào tên Contact cần tìm kiếm: ");
                    String searchName = sc.next();
                    vnPhone.searchContact(searchName);
                    break;
                case 5:
                    vnPhone.printContact();
                    break;
                case 6:
                    return;
                default:
                    System.out.println("Alarm: Lựa chọn đúng số trên menu");
                    break;
            }
        }
    }

    public void question23(){
        while (true){
            System.out.println("-----------------------------------------------");
            System.out.println("1. Thêm Employee");
            System.out.println("2. Thêm Manager");
            System.out.println("3. Thêm Waiter");
            System.out.println("4. Thoát");
            System.out.println("-----------------------------------------------");

            int menu = sc.nextInt();
            switch (menu){
                case 1:
                    System.out.println("Nhập vào tên Employee: ");
                    String emName = sc.next();
                    System.out.println("Nhập vào SalaryRatio: ");
                    Double emSalaryRatio = sc.nextDouble();
                    Employee em = new Employee(emName, emSalaryRatio);

                    em.displayInfor();
                    break;
                case 2:
                    System.out.println("Nhập vào tên Manager: ");
                    String managerName = sc.next();
                    System.out.println("Nhập vào SalaryRatio: ");
                    Double managerSalaryRatio = sc.nextDouble();
                    Manager manager = new Manager(managerName, managerSalaryRatio);

                    manager.displayInfor();
                    break;
                case 3:
                    System.out.println("Nhập vào tên Waiter: ");
                    String waiterName = sc.next();
                    System.out.println("Nhập vào SalaryRatio: ");
                    Double waiterSalaryRatio = sc.nextDouble();
                    Waiter waiter = new Waiter(waiterName, waiterSalaryRatio);

                    waiter.displayInfor();
                    break;
                case 4:
                    return;

                default:
                    System.out.println("Alarm: Lựa chọn đúng số trên menu");
                    break;
            }
        }
    }
}
