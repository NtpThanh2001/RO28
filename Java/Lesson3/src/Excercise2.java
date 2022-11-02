import java.time.LocalDate;

public class Excercise2 {
    public static void main(String[] args) {
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
        acc3.groups = new Group[]{grp3, grp1};

        System.out.println("\n Thông tin các tài khoản: ");
        System.out.println(acc1);
        System.out.println(acc2);
        System.out.println(acc3);

    }
    public static void question1(){
        System.out.println("Khỏi tạo mảng Account gồm 5 phần tử sử dụng For");
        // Khởi tạo mảng gồm 5 phần tử
        Account[] accounts = new Account[5];
        for (int i =0; i< accounts.length; i++){
            int number = i +1;
            Account account = new Account();
            account.mail = "Email" + number;
            account.userName = "Username" + number;
            account.fullName = "Fullname" + number;
            account.createDate = LocalDate.now();
            accounts[i] = account;
            System.out.println("Thong tin Account "+ number + "Email: " + accounts[i].mail
                    + "Fullname: " + accounts[i].fullName + "CreateDate: " + accounts[i].createDate);
        }
    }
}

