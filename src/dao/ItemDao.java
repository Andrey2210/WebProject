package dao;

import connection.DbConnection;
import dao.sqlBuilder.DeleteBuilder;
import dao.sqlBuilder.InsertBuilder;
import dao.sqlBuilder.SqlBuilder;
import dao.sqlBuilder.UpdateBuilder;
import entity.Entity;
import entity.Item;
import sun.text.normalizer.UTF16;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Andrey on 11.01.2017.
 */
public class ItemDao extends GenericDao<Item> {

    private static final String TABLE_NAME = "products";

    @Override
    public List<Item> getAll() {
        List<Item> resultList = new LinkedList<>();
        ResultSet resultSet = getAllResults(TABLE_NAME);
        try {
            while (resultSet != null && resultSet.next()) {
                String description = new String(resultSet.getBlob("description").getBytes(1l,
                        (int) resultSet.getBlob("description").length()), "UTF-8");
                resultList.add(new Item(resultSet.getInt("id"), resultSet.getString("name"),
                        description, resultSet.getDouble("price"), resultSet.getInt("remaining_product"),
                         resultSet.getString("image") != null ? resultSet.getString("image") : null));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return resultList;
    }

    @Override
    public Item getById(int id) {
        Item result = null;
        ResultSet resultSet = getResultsById(TABLE_NAME, id);
        try {
            if (resultSet != null && resultSet.next()) {
                String description = new String(resultSet.getBlob("description").getBytes(1l,
                        (int)  resultSet.getBlob("description").length()));
                result = new Item(resultSet.getInt("id"), resultSet.getString("name"),
                        description, resultSet.getDouble("price"), resultSet.getInt("remaining_product"),
                        resultSet.getString("image") != null ? resultSet.getString("image") : null);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public void insert(Item item) {
        Connection connection = DbConnection.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            SqlBuilder sqlBuilder = new InsertBuilder().insertInto("products",
                    "name, description, price, remaining_product, image")
                    .values("\"" + item.getName() + "\", \"" + item.getDescription() + "\", " + item.getPrice()
                            + ", " + item.getRemainingAmount() + ", " + item.getImage());
            statement.executeUpdate(sqlBuilder.build());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Item item) {
        Connection connection = DbConnection.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            SqlBuilder sqlBuilder = new UpdateBuilder().update("products")
                    .set("price=" + item.getPrice() + ", remaining_product=" + item.getRemainingAmount())
                    .where("id=" + item.getId());
            statement.executeUpdate(sqlBuilder.build());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Item item) {
        Connection connection = DbConnection.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            SqlBuilder sqlBuilder = new DeleteBuilder().delete("products").where("id=" + item.getId());
            statement.executeUpdate(sqlBuilder.build());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
