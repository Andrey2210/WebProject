package dao;

import connection.DbConnection;
import dao.sqlBuilder.*;
import entity.Customer;
import entity.Item;
import entity.Order;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Formatter;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Andrey on 10.01.2017.
 */
public class OrderDao extends GenericDao<Order> {

    private static final String TABLE_NAME = "orders";
    private static DateTimeFormatter DATE_TME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    @Override
    public List<Order> getAll() {
        List<Order> resultList = new LinkedList<>();
        ResultSet resultSet = getAllResults(TABLE_NAME);
        try {
            while (resultSet.next()) {
                resultList.add(new Order(resultSet.getInt("id"), resultSet.getInt("customer_id"),
                        resultSet.getTimestamp("checkout_date").toLocalDateTime(),
                        resultSet.getObject("closed_date") != null ? resultSet.getTimestamp("closed_date").toLocalDateTime() : null,
                        resultSet.getString("order_status")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultList;
    }

    @Override
    public Order getById(int id) {
        Order result = null;
        ResultSet resultSet = getResultsById(TABLE_NAME, id);
        try {
            if (resultSet != null && resultSet.next()) {
                result = new Order(resultSet.getInt("id"), resultSet.getInt("customer_id"),
                        resultSet.getTimestamp("checkout_date").toLocalDateTime(),
                        resultSet.getObject("closed_date") != null ? resultSet.getTimestamp("closed_date").toLocalDateTime() : null,
                        resultSet.getString("order_status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public void insert(Order order) {
        Connection connection = DbConnection.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();

            SqlBuilder sqlBuilder = new InsertBuilder().insertInto("orders",
                    "customer_id, checkout_date, order_status")
                    .values(order.getCustomerID() + ", \"" + order.getCheckoutDate().format(DATE_TME_FORMATTER).toString() + "\", \""
                            + order.getOrderStatus() + "\"");
            statement.executeUpdate(sqlBuilder.build());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Order order) {
        Connection connection = DbConnection.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            SqlBuilder sqlBuilder = new UpdateBuilder().update("orders")
                    .set("closed_date=\"" + order.getClosedDate().format(DATE_TME_FORMATTER).toString() + "\"," +
                            " order_status=\"" + order.getOrderStatus() +"\"")
                    .where("id=" + order.getId());
            statement.executeUpdate(sqlBuilder.build());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Order order) {
        Connection connection = DbConnection.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            SqlBuilder sqlBuilder = new DeleteBuilder().delete("orders").where("id=" + order.getId());
            statement.executeUpdate(sqlBuilder.build());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Order> getCustomersOrders(Customer customer) {
        List<Order> resultList = new LinkedList<>();
        Connection connection = DbConnection.getConnection();
        try {
            Statement statement = connection.createStatement();
            SqlBuilder builder = new SelectBuilder().select("*").from("orders").where("customer_id=" + customer.getId());
            ResultSet resultSet = statement.executeQuery(builder.build());
            while (resultSet.next()) {
                resultList.add(new Order(resultSet.getInt("id"), resultSet.getInt("customer_id"),
                        resultSet.getTimestamp("checkout_date").toLocalDateTime(),
                        resultSet.getObject("closed_date") != null ? resultSet.getTimestamp("closed_date").toLocalDateTime() : null,
                        resultSet.getString("order_status")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultList;
    }

    public List<Order> getOrdersWithItem(Item item) {
        List<Order> resultList = new LinkedList<>();
        Connection connection = DbConnection.getConnection();
        try {
            Statement statement = connection.createStatement();
            SqlBuilder builder = new SelectBuilder().select("orders.id, orders.customer_id, orders.checkout_date," +
                    "orders.closed_date, orders.order_status").from("orders").join("shopping_bag")
                    .on("orders.id=shopping_bag.order_id").where("shopping_bag.product_id=" + item.getId());
            ResultSet resultSet = statement.executeQuery(builder.build());
            while (resultSet.next()) {
                resultList.add(new Order(resultSet.getInt("id"), resultSet.getInt("customer_id"),
                        resultSet.getTimestamp("checkout_date").toLocalDateTime(),
                        resultSet.getObject("closed_date") != null ? resultSet.getTimestamp("closed_date").toLocalDateTime() : null,
                        resultSet.getString("order_status")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultList;
    }

    public void deleteOrdersBefore(LocalDate localDate) {
        List<Order> resultList = new LinkedList<>();
        Connection connection = DbConnection.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            SqlBuilder sqlBuilder = new SelectBuilder().select("*").from("orders").where("checkout_date<\""
                    + localDate.toString() +" 00:00:00\"");
            ResultSet resultSet = statement.executeQuery(sqlBuilder.build());
            while (resultSet.next()) {
                resultList.add(new Order(resultSet.getInt("id"), resultSet.getInt("customer_id"),
                        resultSet.getTimestamp("checkout_date").toLocalDateTime(),
                        resultSet.getObject("closed_date") != null ? resultSet.getTimestamp("closed_date").toLocalDateTime() : null,
                        resultSet.getString("order_status")));
            }
            for (Order order: resultList) {
                sqlBuilder = new DeleteBuilder().delete("shopping_bag").where("order_id=" + order.getId());
                statement.executeUpdate(sqlBuilder.build());
                delete(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
   // select * from orders where checkout_date < "2017-01-15 00:00:00";
}