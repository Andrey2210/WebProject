package entity;


import java.sql.Timestamp;
import java.time.LocalDateTime;


/**
 * Created by Andrey on 02.01.2017.
 */

public class Order implements Entity {
    private int orderNumber;
    private int customerID;
    private LocalDateTime checkoutDate;
    private LocalDateTime closedDate;
    private String orderStatus;

    public Order(int orderNumber, int customerID, LocalDateTime checkoutDate, LocalDateTime closedDate, String orderStatus) {
        this.orderNumber = orderNumber;
        this.customerID = customerID;
        this.checkoutDate = checkoutDate;
        this.closedDate = closedDate;
        this.orderStatus = orderStatus;
    }

    public Order(int orderNumber, int customerID, LocalDateTime checkoutDate, String orderStatus) {
        this.orderNumber = orderNumber;
        this.customerID = customerID;
        this.checkoutDate = checkoutDate;
        this.orderStatus = orderStatus;
    }

    @Override
    public String toString() {
        return getOrderNumber() + " " + getCustomerID() + " " + getCheckoutDate() + " " + getClosedDate()
                + " " + getOrderStatus();
    }

    public int getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(int orderNumber) {
        this.orderNumber = orderNumber;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public LocalDateTime getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(LocalDateTime checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public LocalDateTime getClosedDate() {
        return closedDate;
    }

    public void setClosedDate(LocalDateTime closedDate) {
        this.closedDate = closedDate;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    @Override
    public int getId() {
        return orderNumber;
    }
}
