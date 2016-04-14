/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import lib.CassandraHosts;
import models.*;
import stores.LoggedIn;
import stores.Pic;

/**
 *
 * @author Luke
 */
@WebServlet(name = "EditPic", urlPatterns = {"/EditPic"})
public class EditPic extends HttpServlet {

    Cluster cluster = null;

    public void init(ServletConfig config) throws ServletException {
        cluster = CassandraHosts.getCluster();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PicModel pm = new PicModel();
        pm.setCluster(cluster);

        HttpSession session = request.getSession();
        System.out.println("Session in servlet " + session);
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        
       
        String picid = request.getParameter("picid");
        String caption = request.getParameter("caption");
        String user = request.getParameter("user");

        pm.updatePic(user, picid, caption);
        response.sendRedirect(request.getHeader("Referer"));

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
