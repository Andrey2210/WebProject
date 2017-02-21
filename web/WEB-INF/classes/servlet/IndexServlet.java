package servlet;

import dao.CustomerDao;
import dao.GenericDao;
import dao.ItemDao;
import dao.OrderDao;
import entity.Customer;
import entity.Item;
import entity.Order;
import service.ItemsService;

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
@WebServlet(urlPatterns = "/andrey-shop")
public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String order = req.getParameter("order");
        if(order != null) {
            switch (order) {
                case "name":
                    req.setAttribute("list", ItemsService.getInstance().getAllItemsOrderBy(order));
                    break;
                case "price":
                    req.setAttribute("list", ItemsService.getInstance().getAllItemsOrderBy(order));
                    break;
                default:
                    req.setAttribute("list", ItemsService.getInstance().getAllItems());
            }
        } else {
                req.setAttribute("list", ItemsService.getInstance().getAllItems());
        }
        getServletContext().getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(req, resp);

    }

@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String like = req.getParameter("like");
        if(like != null) {
           req.setAttribute("list", ItemsService.getInstance().searchItems(like));
        } else {
            req.setAttribute("list", ItemsService.getInstance().getAllItems());
        }
        getServletContext().getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(req, resp);

    }
}
