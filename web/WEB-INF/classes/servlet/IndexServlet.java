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
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        req.getSession().setAttribute("list", ItemsService.getInstance().getAllItems());
        getServletContext().getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(req, resp);

    }
}
