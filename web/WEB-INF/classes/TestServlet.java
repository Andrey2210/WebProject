
import dao.CustomerDao;
import dao.GenericDao;
import dao.ItemDao;
import dao.OrderDao;
import entity.Customer;
import entity.Item;
import entity.Order;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Andrey on 11.01.2017.
 */
@WebServlet(urlPatterns = "/test")
public class TestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        ItemDao itemDao = new ItemDao();
        List<Item> itemList = itemDao.getAll();
        req.setAttribute("list", itemList);

        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);

    }
}
