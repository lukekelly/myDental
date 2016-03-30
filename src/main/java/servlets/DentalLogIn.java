package servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lib.CassandraHosts;
import models.DentistModel;
import stores.LoggedIn;


/**
 * @author Luke 
 */

@WebServlet(name = "DentalLogin", urlPatterns = {"/DentalLogin"})
public class DentalLogIn extends HttpServlet {

        Cluster cluster=null;
        Error e = null;
        
        
        public DentalLogIn() {
         super();
        e = new Error();
         // TODO Auto-generated constructor stub
    }
        
    
    
    @Override    
    public void init(ServletConfig config) throws ServletException {
    // TODO Auto-generated method stub
    cluster = CassandraHosts.getCluster();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {}

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        e.setErrorMessage("");
        response.sendRedirect("DentalLogin.jsp");
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
        e.setErrorMessage("");
         String username=request.getParameter("username");
        String password=request.getParameter("password");
        String firstName = request.getParameter("firstname");
        
		            if (username.equals(""))
		              {
		        	            error("You must enter a username",response);
		        	            return;
		        	        }
		        	        else if (password.equals(""))
		        	        {
		        	            error("You must enter a password", response);
		        	            return;
		        	        }
		            
        
        DentistModel us = new DentistModel();
        us.setCluster(cluster);
        boolean isValid=us.IsValidDentist(username, password);
        HttpSession session=request.getSession();
        System.out.println("Session in servlet "+session);
        if (isValid){
            LoggedIn lg= new LoggedIn();
            lg.setLoggedin();
            lg.setUsername(username);
            lg.setFirstName(us.getFirstName(username));
            
            
            session.setAttribute("LoggedIn", lg);
            System.out.println("Session in servlet "+session);
            RequestDispatcher rd=request.getRequestDispatcher("/dentistPortal.jsp");
	    rd.forward(request,response);
            
        }else{
            
             e.setErrorMessage("  The details you entered may have been incorrect or invalid, please try again...");
             session.setAttribute("ErrorMessages", e);
             response.sendRedirect(request.getHeader("Referer"));
        }
    }
    
    
    private void error(String string, HttpServletResponse response)throws ServletException, IOException {
    	        PrintWriter out = null;
    	        out = new PrintWriter(response.getOutputStream());
    	        System.out.println("Incorrect username or password, please try again...");
    	        out.close();
    	        return;	
	}

    /**
     * 
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
