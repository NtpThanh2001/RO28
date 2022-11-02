import java.time.LocalDate;
import java.lang.String;

public class Excercise1 {
    public static void main(String[] args) {
        // Tạo Department
        Department dep1 = new Department(); // init object
        dep1.departmentId = 1;
        dep1.departmentName = "Marketing";

        Department dep2 = new Department();
        dep2.departmentId = 2;
        dep2.departmentName = "Sale";

        Department dep3 = new Department();
        dep3.departmentId = 3;
        dep3.departmentName = "BOD";

        System.out.println("Thông tin các phòng ban: ");
        System.out.println(dep1);
        System.out.println(dep2);
        System.out.println(dep3);

        // Tạo Position
        Position pos1 = new Position();
        pos1.positionId = 1;
        pos1.positionName = Position.positionName.DEV;

        Position pos2 = new Position();
        pos2.positionId = 2;
        pos2.positionName = Position.positionName.TEST;

        Position pos3 = new Position();
        pos3.positionId = 3;
        pos3.positionName = Position.positionName.SCRUM_MASTER;

        Position pos4 = new Position();
        pos4.positionId = 4;
        pos4.positionName = Position.positionName.PM;

        System.out.println("\n Thông tin vị trí công việc: ");
        System.out.println(pos1);
        System.out.println(pos2);
        System.out.println(pos3);
        System.out.println(pos4);

        // Tạo Group
        Group grp1 = new Group();
        grp1.groupId = 1;
        grp1.groupName = "VTI Sale 01";
        grp1.createDate = LocalDate.now();

        Group grp2 = new Group();
        grp2.groupId = 2;
        grp2.groupName = "VTI Sale 02";
        grp2.createDate = LocalDate.now();

        Group grp3 = new Group();
        grp3.groupId = 3;
        grp3.groupName = "VTI Sale 03";
        grp3.createDate = LocalDate.now();

        System.out.println("\n Thông tin group: ");
        System.out.println(grp1);
        System.out.println(grp2);
        System.out.println(grp3);

        // Tạo Account
        Account acc1 = new Account();
        acc1.accountId = 1;
        acc1.mail = "Email1@gmail.com";
        acc1.userName = "username1";
        acc1.fullName = "fullname1";
        acc1.department = dep1;
        acc1.position = pos1;
        acc1.createDate = LocalDate.now();
        acc1.groups = new Group[]{grp1, grp2};

        Account acc2 = new Account();
        acc2.accountId = 2;
        acc2.mail = "Email2@gmail.com";
        acc2.userName = "username2";
        acc2.fullName = "fullname2";
        acc2.department = dep2;
        acc2.position = pos2;
        acc2.createDate = LocalDate.now();
        acc2.groups = new Group[]{grp2, grp3};

        Account acc3 = new Account();
        acc3.accountId = 3;
        acc3.mail = "Email3@gmail.com";
        acc3.userName = "username3";
        acc3.fullName = "fullname3";
        acc3.department = dep3;
        acc3.position = pos3;
        acc3.createDate = LocalDate.now();
        acc3.groups = new Group[]{grp3,grp1};

        System.out.println("\n Thông tin các tài khoản: ");
        System.out.println(acc1);
        System.out.println(acc2);
        System.out.println(acc3);

        question1(acc2);
        question2(acc2);
        question3(acc2);
        question4(acc1);
        grp1.accounts = new Account[]{acc1,acc2};
        question5(grp1);
        question6(acc2);
        question7(acc1);

    }

    /*
            Question 1:
            Kiểm tra account thứ 2
            Nếu không có phòng ban (tức là department == null) thì sẽ in ra text
            "Nhân viên này chưa có phòng ban"
            Nếu không thì sẽ in ra text "Phòng ban của nhân viên này là ..."
         */
    public static void question1(Account acc2){
        if(acc2.department == null) {
            System.out.println("\n Nhân viên này chưa có phòng ban");
        }
        else {
            System.out.println("\n Phòng ban của nhân viên này là " + acc2.department.departmentName);
        }
    }

     /*
            Question 2:
            Kiểm tra account thứ 2
            Nếu không có group thì sẽ in ra text "Nhân viên này chưa có group"
            Nếu có mặt trong 1 hoặc 2 group thì sẽ in ra text "Group của nhân viên
            này là Java Fresher, C# Fresher"
            Nếu có mặt trong 3 Group thì sẽ in ra text "Nhân viên này là người
            quan trọng, tham gia nhiều group"
            Nếu có mặt trong 4 group trở lên thì sẽ in ra text "Nhân viên này là
            người hóng chuyện, tham gia tất cả các group"
         */
    public static void question2(Account acc2){
        if (acc2.groups == null){
            System.out.println("\n Nhân viên này chưa có group");
        }
        else if (acc2.groups.length == 1 || acc2.groups.length == 2) {
            System.out.println("\nGroup của nhân viên này là Java Fresher, C# Fresher");
        }
        else if (acc2.groups.length == 3){
            System.out.println("\nNhân viên này là người quan trọng, tham gia nhiều group");
        }
        else {
            System.out.println("\n viên này là người hóng chuyện, tham gia tất cả các group");
        }
    }

    /*
        Question 3: Sử dụng toán tử ternary để làm Question 1
     */
    public static void question3(Account acc2){
        System.out.println(acc2.department == null? "\nNhân viên này chưa có phòng ban": "Phòng ban của nhân viên này là " + acc2.department.departmentName);
    }

    /*
        Question 4:
        Sử dụng toán tử ternary để làm yêu cầu sau:
        Kiểm tra Position của account thứ 1
        Nếu Position = Dev thì in ra text "Đây là Developer"
        Nếu không phải thì in ra text "Người này không phải là Developer"
     */
    public static void question4(Account acc1){
            System.out.println(acc1.position.positionName == Position.positionName.DEV? "\nĐây là Developer" : "\nNgười này không phải là Developer");
    }

    /*
    SWITCH CASE
        Question 5:
        Lấy ra số lượng account trong nhóm thứ 1 và in ra theo format sau:
        Nếu số lượng account = 1 thì in ra "Nhóm có một thành viên"
        Nếu số lượng account = 2 thì in ra "Nhóm có hai thành viên"
        Nếu số lượng account = 3 thì in ra "Nhóm có ba thành viên"
        Còn lại in ra "Nhóm có nhiều thành viên"
     */
    public static void question5(Group grp1){
        switch (grp1.accounts.length){
            case 1:
                System.out.println("\nNhóm có 1 thành viên");
                break;
            case 2:
                System.out.println("\nNhóm có 2 thành viên");
                break;
            case 3:
                System.out.println("\nNhóm có 3 thành viên");
                break;
            default:
                System.out.println("\nNhóm có nhiều thành viên");
        }
    }
    /*
        Question 6:
        Sử dụng switch case để làm lại Question 2
    */
    public static void question6(Account acc2){
        switch (acc2.groups.length){
            case 1:
                System.out.println("\nGroup của nhân viên này là Java Fresher, C# Fresher");
                break;
            case 2:
                System.out.println("\nGroup của nhân viên này là Java Fresher, C# Fresher");
                break;
            case 3:
                System.out.println("\nNhân viên này là người quan trọng, tham gia nhiều group");
                break;
            case 4:
                System.out.println("\nNhân viên này là người hóng chuyện, tham gia tất cả các group");
                break;
            default:
                System.out.println("\nNhân viên này chưa có group");
                break;
        }
    }

    /*
        Question 7:
        Sử dụng switch case để làm lại Question 4
     */
    public static void question7(Account acc1){
        switch (acc1.position.positionName){
            case DEV:
                System.out.println("\nĐây là Developer");
                break;
            default:
                System.out.println("\nNgười này không phải là Developer");
                break;
        }
    }

    /*
    FOREACH
        Question 8:
        In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của
        họ
     */
//    public static void question8(Account account){
//        String[] accounts = {account.mail, account.fullName, account.department.departmentName};
//        for (String Account : accounts){
//            System.out.println(accounts);
//        }
//    }

    /*
        Question 9:
        In ra thông tin các phòng ban bao gồm: id và name
     */
//    public static void question9(Department department){
//        int[] id = {department.departmentId};
//        String[] name = {department.departmentName};
//        for (int Department : id) {
//            System.out.println(id);
//        }
//        for (String Department : name) {
//            System.out.println(name);
//        }
//    }

    /*
    FOR
        Question 10:
        In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của
        họ theo định dạng như sau:
            Thông tin account thứ 1 là:
            Email: NguyenVanA@gmail.com
            Full name: Nguyễn Văn A
            Phòng ban: Sale

            Thông tin account thứ 2 là:
            Email: NguyenVanB@gmail.com
            Full name: Nguyễn Văn B
            Phòng ban: Marketting
     */
//    public static void question10(Account[] accounts){
//        for (int i = 0; i <= accounts.length; i++){
//            int number = i+1;
//            System.out.println("Thông tin account thứ " + number + "là:");
//            System.out.println("Email: " + accounts.mail);
//            System.out.println("Fullname: " + accounts.fullname);
//            System.out.println("Phòng ban: " + accounts.department.departmentName);
//        }
//    }

}