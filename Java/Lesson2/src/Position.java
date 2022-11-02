public class Position {
    int             positionId;

    static positionName    positionName;

    public enum positionName {
        DEV, TEST, SCRUM_MASTER, PM;
    }

    @Override
    public String toString() {
        return "Position{" +
                "positionId=" + positionId +
                ", positionName" + positionName +
                '}';
    }
}
