package backend;

import entity.Employee5;
import entity.Engineer;
import entity.Staff;
import entity.Worker;

import java.util.ArrayList;
import java.util.Scanner;

public class Excercise5 {
    private ArrayList<Staff> staffList;
    private Scanner sc;

    public void Exercise5() {
        staffList = new ArrayList<Staff>();
        sc = new Scanner(System.in);
    }
    public void question1() {
    }
    public void question2() {
        menu();
    }
    public void menu() {
        while (true) {
            System.out.println("----------------------------------------");
            System.out.println("Chọn chức năng bạn muốn sử dụng");
            System.out.println("1. Thêm mới cán bộ");
            System.out.println("2. Tiìm kiếm theo họ tên");
            System.out.println("3. Hiển thị thông tin");
            System.out.println("4. Nhập vào tên cán bộ và delete cán bộ đó");
            System.out.println("5. Thoát khỏi chương trình");
            System.out.println("-----------------------------------------");

            int menuChoose = sc.nextInt();
            switch (menuChoose) {
                case 1:
                    addStaff();
                    break;

                case 2:
                    findByName();
                    break;
                case 3:
                    printListStaff();
                    break;
                case 4:
                    deleteByName();
                    break;
                case 5:
                    return;
                default:
                    System.out.println("Lựa chọn đúng số trên menu");
                    break;
            }
        }
    }
    private void deleteByName() {
        System.out.println("Nhập tên cần xóa thông tin: ");
        String delName = sc.next();
        staffList.removeIf(staff -> staff.getName().equals(delName));
        printListStaff();
        }

    private void findByName() {
        System.out.println("Nhập vào tên muốn tìm kiếm: ");
        String findName = sc.next();
        for (Staff staff : staffList) {
            if (staff.getName().equals(findName)) {
                System.out.println(staff);
            }
        }
    }
    private void printListStaff() {
        for (Staff staff : staffList) {
            System.out.println(staff);
        }
    }

    private void addStaff() {
        while (true) {
            System.out.println("----------------------------------------");
            System.out.println("Chọn chức năng bạn muốn sử dụng");
            System.out.println("1. Thêm Engineer");
            System.out.println("2. Thêm worker");
            System.out.println("3. Thêm Employee");
            System.out.println("-----------------------------------------");
            int choose1 = sc.nextInt();
            switch (choose1) {
                case 1:
                    System.out.println("Nhập vào tên Engineer: ");
                    String nameEngineer = sc.next();
                    System.out.println("Nhập vào tuổi Engineer: ");
                    int ageEngineer = sc.nextInt();
                    System.out.println("Nhập vào giới tính Engineer 1.Male, 2.Female, 3.Unknown: ");

                    int flagEngineer = sc.nextInt();
                    Staff.Gender genderName1 = null;

                    switch (flagEngineer) {
                        case 1:
                            genderName1 = Staff.Gender.MALE;
                            break;
                        case 2:
                            genderName1 = Staff.Gender.FEMALE;
                            break;
                        case 3:
                            genderName1 = Staff.Gender.UNKNOWN;
                            break;
                    }

                    System.out.println("Nhập vào địa chỉ Engineer: ");
                    String addEngineer = sc.next();
                    System.out.println("Nhập vào chuyên ngành Engineer: ");
                    String specializedEngineer = sc.next();
                    Staff engineer = new Engineer(nameEngineer, ageEngineer, genderName1, addEngineer, specializedEngineer);
                    staffList.add(engineer);
                    break;

                case 2:
                    System.out.println("Nhập vào tên Worker: ");
                    String nameWorker = sc.next();
                    System.out.println("Nhập vào tuổi Worker: ");
                    int ageWorker = sc.nextInt();
                    System.out.println("Nhập vào giới tính Worker 1.Male, 2.Female, 3.Unknown: ");

                    int flagGender = sc.nextInt();
                    Staff.Gender genderName = null;

                    switch (flagGender) {
                        case 1:
                            genderName = Staff.Gender.MALE;
                            break;
                        case 2:
                            genderName = Staff.Gender.FEMALE;
                            break;
                        case 3:
                            genderName = Staff.Gender.UNKNOWN;
                            break;
                    }

                    System.out.println("Nhập vào địa chỉ Worker: ");
                    String addWorker = sc.next();
                    System.out.println("Nhập vào bậc Worker: ");

                    int rankWorker = sc.nextInt();
                    Staff worker1 = new Worker(nameWorker, ageWorker, genderName, addWorker, rankWorker);
                    staffList.add(worker1);
                    break;

                case 3:
                    System.out.println("Nhập vào tên Employee: ");
                    String nameEmployee = sc.next();
                    System.out.println("Nhập vào tuổi Employee: ");
                    int ageEmployee = sc.nextInt();
                    System.out.println("Nhập vào giới tính Employee 1.Male, 2.Female, 3.Unknown: ");

                    int flagEmployee = sc.nextInt();
                    Staff.Gender genderEmployee = null;

                    switch (flagEmployee) {
                        case 1:
                            genderEmployee = Staff.Gender.MALE;
                            break;
                        case 2:
                            genderEmployee = Staff.Gender.FEMALE;
                            break;
                        case 3:
                            genderEmployee = Staff.Gender.UNKNOWN;
                            break;
                    }
                    System.out.println("Nhập vào địa chỉ Employee: ");
                    String addEmployee = sc.next();
                    System.out.println("Nhập vào nhiệm vụ Employee: ");
                    String taskEmployee = sc.next();
                    Staff Employee5 = new Employee5(nameEmployee, ageEmployee, genderEmployee, addEmployee, taskEmployee);
                    staffList.add(Employee5);
                    break;
                default:
                    break;
            }
        }
    }
}
