/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lib.CassandraHosts;
import models.PatientModel;

import com.datastax.driver.core.Cluster;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpSession;
import stores.LoggedIn;

/**
 *
 * @author Luke
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    Error e = null;

    public Register() {
        super();
        e = new Error();
    }

    private static final long serialVersionUID = 1L;
    Cluster cluster = null;

    public void init(ServletConfig config) throws ServletException {
        cluster = CassandraHosts.getCluster();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/Register.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        
         HttpSession session = request.getSession();
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");

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

        PatientModel st = new PatientModel();
        st.setCluster(cluster);

        boolean patientExists = st.existingPatient(username);

        if (patientExists == true) {
            e.setErrorMessage(" A patient with that username already exists! ");
                session.setAttribute("ErrorMessages", e);
            // get back to the referer page using redirect
            response.sendRedirect(request.getHeader("Referer"));

        } else {
            boolean success = st.RegisterPatient(username, password, name, surname);

            if (success) {
              
                e.setErrorMessage(" You have just registered a new Patient! ");
                session.setAttribute("ErrorMessages", e);
                // Success messgage
                  // get back to the referer page using redirect
                response.sendRedirect(request.getHeader("Referer"));
            }

        }
    }

    private void error(String fault, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = new PrintWriter(response.getOutputStream());
        out.println("<h1>You have made a mistake, please try again</h1>");
        out.close();
    }

}
