/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

import lib.CassandraHosts;
import models.PicModel;
import models.DentistModel;

/**
 *
 * @author Luke
 */


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

@WebServlet(name = "Flag", urlPatterns = { "/Flag" })
public class Flag extends HttpServlet {
	Cluster cluster = null;

	public void init(ServletConfig config) throws ServletException {
		cluster = CassandraHosts.getCluster();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PicModel pm = new PicModel();
		pm.setCluster(cluster);
		
		String login = request.getParameter("login");
		String picid = request.getParameter("picid");
		String flags = request.getParameter("flags");
		String currentPage = request.getParameter("page");
		
		int flagsInt = Integer.parseInt(flags);
		
		flagsInt = flagsInt + 1;
			
        pm.writeFlags(login, picid, flagsInt);
        
        if (currentPage.equals("/myDental/Images")) {
			response.sendRedirect("/myDental/");
		}
		else 
			response.sendRedirect("/myDental/Images");
	}

	
	@Override
	public String getServletInfo() {
		return "Short description";
	}

}