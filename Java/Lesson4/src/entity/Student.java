package entity;

public class Student {

    private int id;

    private String name;

    private String hometown;

    private float score;

    public Student() {
    }

    public Student(String name, String hometown) {
        this.name = name;
        this.hometown = hometown;
        this.score = (float) 0;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHometown() {
        return hometown;
    }

    public void setHometown(String hometown) {
        this.hometown = hometown;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public void plusScore(Float score) {
        this.score = this.score + score;
    }

    @Override
    public String toString() {
        String rank = null;
        if (this.score < 4.0) {
            rank = "Yếu";
        } else if (this.score < 6.0) {
            rank = "Trung Bình";
        } else if (this.score < 8.0) {
            rank = "Khá";
        }else {
            rank = "Giỏi";
        }
        return "Student [id=" + id + ", name=" + name + ", hometown=" +

                hometown + ", score=" + score + ", Xếp loại=" + rank + "]";
    }
}
