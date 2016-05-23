
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
import java.io.InputStream;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.PicModel;
import stores.LoggedIn;

/**
 *
 * @author Luke
 */
@WebServlet(name = "createNewStory", urlPatterns = {"/CreateNewStory"})
public class createNewStory extends HttpServlet {
     private static final long serialVersionUID = 1L;
    private Cluster cluster;
    private HashMap CommandsMap = new HashMap();

    Error e = null;
    
    
       public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }

      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        for (Part part : request.getParts()) {
            
            e.setErrorMessage("");
            
            System.out.println("Part Name " + part.getName());

            String caption = request.getParameter("caption");
            if (caption.isEmpty()) {
                caption = "";
            }
            String sendto = request.getParameter("sendto");
            if (sendto.isEmpty()) {
                sendto = "";
            }
            String treatment = request.getParameter("treatment");
            if (treatment.isEmpty()) {
                treatment = "";
            }
            
            String type = part.getContentType();
            String filename = part.getSubmittedFileName();
            int flags = 0;

            InputStream is = request.getPart(part.getName()).getInputStream();
            int i = is.available();
            HttpSession session = request.getSession();
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            String username = "";
            if (lg.getloggedin()) {
                username = lg.getUsername();
            }
            if (i > 0) {
                byte[] b = new byte[i + 1];
                is.read(b);
                System.out.println("Length : " + b.length);
                PicModel tm = new PicModel();
                tm.setCluster(cluster);

                tm.insertPic(b, type, filename, username, caption, flags, sendto, treatment);

                is.close();
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("/createNewStory.jsp");
            //response.sendRedirect(request.getHeader("Referer"));
            e.setErrorMessage(" Your image has been saved to your library! ");
            session.setAttribute("ErrorMessages", e);
            rd.forward(request, response);
            
        }

    }
    
    
    
    
    private void error(String fault, HttpServletResponse response) throws ServletException, IOException
    {
    	 PrintWriter out = new PrintWriter(response.getOutputStream());
    	 out.println("<h1>You have made a mistake, please try again</h1>");
    	 out.close();
    }

}