
import dao.CustomerDao;
import dao.GenericDao;
import entity.Customer;

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
        resp.setContentType("text/html");

            CustomerDao customerDao = new CustomerDao();
            List<Customer> result = customerDao.getAll();
            PrintWriter printWriter = resp.getWriter();
            for(Customer customer : result) {
                printWriter.write("<h1>" + customer.toString() + "</h1>");
            }
    }
}
