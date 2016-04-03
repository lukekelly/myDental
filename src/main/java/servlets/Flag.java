package servlets;

import com.datastax.driver.core.Cluster;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lib.CassandraHosts;
import models.PicModel;
import models.DentistModel;
import stores.*;

/**
 *
 * @author Luke
 */
@WebServlet(name = "Flag", urlPatterns = {"/Flag"})
public class Flag extends HttpServlet {

    Cluster cluster = null;
    Error e = null;

    public Flag() {
        super();
        e = new Error();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config) throws ServletException {
        cluster = CassandraHosts.getCluster();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        e.setErrorMessage("");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PicModel pm = new PicModel();
        pm.setCluster(cluster);

        HttpSession session = request.getSession();
        System.out.println("Session in servlet " + session);
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");

        String picid = request.getParameter("picid");
        String flags = request.getParameter("flags");
        String currentPage = request.getParameter("page");
        String username = lg.getUsername();

        int flagsInt = Integer.parseInt(flags);

        flagsInt = flagsInt + 1;

        pm.writeFlags(username, picid, flagsInt);

        if (currentPage.equals("/myDental/DisplayAllImages/")) {
            response.sendRedirect("/myDental/");
        } else {
            response.sendRedirect("/myDental/DisplayAllImages/");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
