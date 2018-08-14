package rmg;

public class student {
    private String name;

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    @Override
    public String toString() {
        return "student{" +
                "name='" + name + '\'' +
                '}';
    }
}
