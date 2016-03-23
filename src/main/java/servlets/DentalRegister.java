package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lib.CassandraHosts;
import models.DentistModel;

import com.datastax.driver.core.Cluster;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpSession;
import stores.LoggedIn;

/**
 * Servlet for registering a new Dental Practitioner
 * @author Luke
 */
@WebServlet(name = "DentalRegister", urlPatterns = {"/DentalRegister"})
public class DentalRegister extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Cluster cluster = null;

    public void init(ServletConfig config) throws ServletException {
        cluster = CassandraHosts.getCluster();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/DentalRegister.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");

        if (username.equals("")) {
            error("Please enter a username", response);
            return;
        } else if (password.equals("")) {
            error("Please enter your password", response);
            return;
        } else if (name.equals("")) {
            error("Please enter your first name", response);
            return;
        } else if (surname.equals("")) {
            error("Please enter your second name", response);
            return;
        }

        DentistModel st = new DentistModel();
        st.setCluster(cluster);

        boolean dentistExists = st.existingDentist(username);

        if (dentistExists == true) {
            // get back to the referer page using redirect
            response.sendRedirect(request.getHeader("Referer"));
            
        } else {
            boolean success = st.RegisterDentist(username, password, name, surname);

            if (success) {
                  // get back to the referer page using redirect
            response.sendRedirect(request.getHeader("Referer"));
            // Success messgage
            }
        }
    }

    private void error(String fault, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = new PrintWriter(response.getOutputStream());
        out.println("<h1>You have made a mistake, please try again</h1>");
        out.close();
    }

}
