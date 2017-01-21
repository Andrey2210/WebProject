package service;

import dao.OrderDao;
import entity.Order;

import java.util.List;

/**
 * Created by Andrey on 19.01.2017.
 */
public class OrderService {
    private static OrderService INSTANCE = null;

    private OrderService() {}

    public static OrderService getInstance() {
        if (INSTANCE == null) {
            synchronized (OrderService.class) {
                if (INSTANCE == null) {
                    INSTANCE = new OrderService();
                }
            }
        }
        return INSTANCE;
    }

    public List<Order> getAllOrders() {
        return new OrderDao().getAll();
    }
}
