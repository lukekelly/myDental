/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;


import com.datastax.driver.core.Cluster;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lib.CassandraHosts;
import models.PicModel;
import models.*;
import stores.LoggedIn;

/**
 *
 * @author Luke
 */



@WebServlet(name = "Search", urlPatterns = { "/Search" })
public class Search extends HttpServlet {
	Cluster cluster = null;

	public void init(ServletConfig config) throws ServletException {
		cluster = CassandraHosts.getCluster();
	}

	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String searchText = request.getParameter("searchText");
		
		PicModel pm = new PicModel();
		pm.setCluster(cluster);
				
		pm.returnSearchResults(searchText);

			// set up a parameter to be passed to the jsp page the servlet is redirecting to
		HttpSession session = request.getSession();
		session.setAttribute("searchedFor", searchText);
		response.sendRedirect("/myDental/sendStory.jsp");
	}


	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

	

}