package entity;

public class Account4 {

    private int id;

    private String name;

    private int balance;

    public Account4(int id, String name, int balance) {
        this.id = id;
        this.name = name;
        this.balance = balance;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getBalance() {
        return balance;
    }

    public int credit(int amount) {
        return this.balance += amount;
    }
    public int debit(int amount) {
        return this.balance -= amount;
    }
    public void tranfer(Account4 acc, int amount) {
        this.balance -= amount;
        acc.balance += amount;
    }
}
