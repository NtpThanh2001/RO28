import java.lang.String;

public class TypeQuestion {
    int         typeId;
    static typeName      typeName;

    public enum typeName {
        ESSAY, MULTIPLE_CHOICE;
    }

    @Override
    public String toString() {
        return "TypeQuestion{" +
                "typeId=" + typeId +
                ", typeName" + typeName +
                '}';
    }
}
