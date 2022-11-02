package backend;

import entity.Account;
import entity.Department;
import entity.Group;
import entity.Position;

import java.time.LocalDate;

public class Exercise1 {
    /*
    Question 1:
        Tạo constructor cho department:
        a) không có parameters
        b) Có 1 parameter là nameDepartment và default id của
        Department = 0
        Khởi tạo 1 Object với mỗi constructor ở trên
    */
    public static void question1(){
        Department department = new Department();

        Department dep0 = new Department("Sale");
    }

    /*
    Question 2:
        Tạo constructor cho Account:
        a) Không có parameters
        b) Có các parameter là id, Email, Username, FirstName,
        LastName (với FullName = FirstName + LastName)
        c) Có các parameter là id, Email, Username, FirstName,
        LastName (với FullName = FirstName + LastName) và
        Position của User, default createDate = now
        d) Có các parameter là id, Email, Username, FirstName,
        LastName (với FullName = FirstName + LastName) và
        Position của User, createDate
        Khởi tạo 1 Object với mỗi constructor ở trên
     */
    public static void question2(){
        Account account = new Account();

        Account accB = new Account(2, "email2", "username2", "fullname2");

        Position pos3 = new Position();
        Account accC = new Account(3, "email3", "username3", "fullname3", pos3);

        Position pos4 = new Position();
        Account accD = new Account(4, "email4", "username4", "fullname4", pos4, LocalDate.of(2022,10,31));
    }

    /*
    Question 3:
        Tạo constructor cho Group:
        a) không có parameters
        b) Có các parameter là GroupName, Creator, array Account[]
        accounts, CreateDate
        c) Có các parameter là GroupName, Creator, array String[]
        usernames , CreateDate
        Với mỗi username thì sẽ khởi tạo 1 Account (chỉ có thông tin
        username, các thông tin còn lại = null).
        Khởi tạo 1 Object với mỗi constructor ở trên
     */
    public static void question3(){
        Group group = new Group();

        Group group1 = new Group();
    }
}
