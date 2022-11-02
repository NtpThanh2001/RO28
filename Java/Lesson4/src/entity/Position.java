package entity;

public class Position {

    private int positionId;

    private static positionName positionName;

    public enum positionName {
        DEV, TEST, SCRUM_MASTER, PM;
    }

    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public static Position.positionName getPositionName() {
        return positionName;
    }

    public static void setPositionName(Position.positionName positionName) {
        Position.positionName = positionName;
    }

    @Override
    public String toString() {
        return "Position{" +
                "positionId=" + positionId +
                ", positionName" + positionName +
                '}';
    }
}
