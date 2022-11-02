package entity;

public class Employee5 extends Staff{

    private String task;

    public Employee5(String name, int age, Gender gender, String address, String task) {
        super(name, age, gender, address);
        this.task = task;
    }
    @Override
    public String toString() {
        return super.toString() + "Position: Employee [task=" + task + "]";
    }
}
