package entity;

public class Waiter extends User{

    public Waiter(String name, Double salaryRatio) {
        super(name, salaryRatio);
    }

    @Override
    public Double calculatePay() {
        return getSalaryRatio() * 220;
    }
}
