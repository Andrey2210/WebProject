package service;

import dao.GenericDao;
import dao.ItemDao;
import entity.Item;

import java.util.List;

/**
 * Created by Andrey on 18.01.2017.
 */
public class ItemsService {
    private static ItemsService INSTANCE = null;

    private ItemsService() {}

    public static ItemsService getInstance() {
        if (INSTANCE == null) {
            synchronized (ItemsService.class) {
                if (INSTANCE == null) {
                    INSTANCE = new ItemsService();
                }
            }
        }
        return INSTANCE;
    }

    public List<Item> getAllItems() {
        return new ItemDao().getAll();
    }

    public void insertItem(Item item) {
        ItemDao itemDao = new ItemDao();
        itemDao.insert(item);
    }
}
