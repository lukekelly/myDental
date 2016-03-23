
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
@WebServlet(name = "createNewStory", urlPatterns = {"/CreateNewStory"})
public class createNewStory extends HttpServlet {

    private void error(String fault, HttpServletResponse response) throws ServletException, IOException
    {
    	 PrintWriter out = new PrintWriter(response.getOutputStream());
    	 out.println("<h1>You have made a mistake, please try again</h1>");
    	 out.close();
    }

}