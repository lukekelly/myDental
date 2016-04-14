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

import lib.CassandraHosts;
import models.*;
import stores.LoggedIn;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "UpdateInfo", urlPatterns = { "/UpdateInfo" })
public class UpdateInfo extends HttpServlet {
	Cluster cluster = null;

	public void init(ServletConfig config) throws ServletException {
		cluster = CassandraHosts.getCluster();
	}

	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String firstName = request.getParameter("firstName");
		String secondName = request.getParameter("secondName");
		//String email = request.getParameter("email");
		
		PatientModel us = new PatientModel();
                us.setCluster(cluster);
		
		us.UpdateUserDetails(username, firstName, secondName);
		response.sendRedirect("/myDental");
		
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

	// OBSOLETE UNLESS CHANGED ABOVE TO USE IT
	// username and password cannot be less than 2 symbols each
	public boolean registrationError(String user, String pass) {
		if (user.length() < 2 || pass.length() < 2) {
			return true; // there is an error while registering
		} else
			return false; // registration details are fine
	}

}