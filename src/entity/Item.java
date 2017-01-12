package entity;

/**
 * Created by Andrey on 02.01.2017.
 */
public class Item implements Entity {
    private int id;
    private String name;
    private String description;
    private double price;
    private int remainingAmount;

    public Item(int id, String name, String description, double price, int remainingAmount) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.remainingAmount = remainingAmount;
    }

    public Item(String name, String description, double price, int remainingAmount) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.remainingAmount = remainingAmount;
    }


    @Override
    public String toString() {
        return getId() + " " + getName() + " " + getDescription() + " " + getPrice()
                + " " + getRemainingAmount();
    }

    public void setId(int id) {
        id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getRemainingAmount() {
        return remainingAmount;
    }

    public void setRemainingAmount(int remainingAmount) {
        this.remainingAmount = remainingAmount;
    }

    @Override
    public int getId() {
        return id;
    }
}
