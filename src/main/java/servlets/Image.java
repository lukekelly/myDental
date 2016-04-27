package servlets;

import com.datastax.driver.core.Cluster;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import lib.CassandraHosts;
import lib.Convertors;
import models.PicModel;
import stores.LoggedIn;
import stores.Pic;

/**
 * Servlet implementation class Image
 */
@WebServlet(urlPatterns = {
    "/Image",
    "/Image/*",
    "/Thumb/*",
    "/Images",
    "/Images/*",
    "/inbox/",
    "/inbox/*",
    "/DentalPics/*",
    "/viewStories2",
    "/DisplayAllImages",
    "/HygienistVisit",
    "/DentistHygienistVisit"
})
@MultipartConfig

public class Image extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Cluster cluster;
    private HashMap CommandsMap = new HashMap();

    Error e = null;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Image() {
        super();
        // TODO Auto-generated constructor stub
        CommandsMap.put("Image", 1);
        CommandsMap.put("Images", 2);
        CommandsMap.put("Thumb", 3);
        CommandsMap.put("inbox", 4);
        CommandsMap.put("viewStories2", 5);
        CommandsMap.put("DisplayAllImages", 6);
        CommandsMap.put("HygienistVisit", 7);
        CommandsMap.put("DentistHygienistVisit", 8);
        e = new Error();
    }

    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String args[] = Convertors.SplitRequestPath(request);
        HttpSession session = request.getSession();
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        int command;
        try {
            command = (Integer) CommandsMap.get(args[1]);
        } catch (Exception et) {
            error("Bad Operator", response);
            return;
        }
        switch (command) {
            case 1:
                DisplayImage(Convertors.DISPLAY_PROCESSED, args[2], response);
                break;
            case 2:
                //DisplayImageList(args[2], request, response);
                DisplayImageList(lg.getUsername(), request, response);
                break;
            case 3:
                DisplayImage(Convertors.DISPLAY_THUMB, args[2], response);
                break;
            case 4:
                DisplayInbox(lg.getUsername(), request, response);
                break;
            case 5:
                DisplayStories(lg.getUsername(), request, response);
                break;
            case 6:
                DisplayAllImages(lg.getUsername(), request, response);
                break;
            case 7:
                DisplayHygienistVisit(lg.getUsername(), request, response);
                break;
            case 8:
                DisplayDentistHygienistVisit(lg.getUsername(), request, response);
                break;
            default:
                error("Bad Operator", response);
        }
    }

    private void DisplayImageList(String User, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PicModel tm = new PicModel();
        tm.setCluster(cluster);
        java.util.LinkedList<Pic> lsPics = tm.getPicsForUser(User);
        RequestDispatcher rd = request.getRequestDispatcher("/DentalPics.jsp");

        request.setAttribute("Pics", lsPics);
        rd.forward(request, response);
    }

    private void DisplayInbox(String User, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PicModel tm = new PicModel();
        tm.setCluster(cluster);
        java.util.LinkedList<Pic> lsPics = tm.getPicsForUser(User);
        RequestDispatcher rd = request.getRequestDispatcher("/inbox.jsp");

        request.setAttribute("Pics", lsPics);
        rd.forward(request, response);
    }

    private void DisplayStories(String User, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           PicModel tm = new PicModel();
        tm.setCluster(cluster);

        HttpSession session = request.getSession();
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        //String username="";
        if (lg.getloggedin()) {
            User = lg.getUsername();
        }

        java.util.LinkedList<Pic> lsPics = tm.getPicsForUser(User);
        RequestDispatcher rd = request.getRequestDispatcher("/ViewStories2.jsp");

        request.setAttribute("Pics", lsPics);
        rd.forward(request, response);
    }

    private void DisplayAllImages(String username, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PicModel tm = new PicModel();
        tm.setCluster(cluster);

        HttpSession session = request.getSession();
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        //String username="";
        if (lg.getloggedin()) {
            username = lg.getUsername();
        }

        java.util.LinkedList<Pic> lsPics = tm.getAllPics(username);
        RequestDispatcher rd = request.getRequestDispatcher("/ShowAllPics.jsp");

        request.setAttribute("allPics", lsPics);
        rd.forward(request, response);
    }

    private void DisplayHygienistVisit(String username, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PicModel tm = new PicModel();
        tm.setCluster(cluster);

        HttpSession session = request.getSession();
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");

        //This is a quick and dirty way of retrieving images as part of a story. Replacing what would be the username with the name of the story
        if (lg.getloggedin()) {
            username = "HygienistVisitStory";
        }

        java.util.LinkedList<Pic> lsPics = tm.getAllPics(username);
        RequestDispatcher rd = request.getRequestDispatcher("/hygienist.jsp");

        request.setAttribute("allPics", lsPics);
        rd.forward(request, response);
    }

        private void DisplayDentistHygienistVisit(String username, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PicModel tm = new PicModel();
        tm.setCluster(cluster);

        HttpSession session = request.getSession();
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");

        //This is a quick and dirty way of retrieving images as part of a story. Replacing what would be the username with the name of the story
        if (lg.getloggedin()) {
            username = "HygienistVisitStory";
        }

        java.util.LinkedList<Pic> lsPics = tm.getAllPics(username);
        RequestDispatcher rd = request.getRequestDispatcher("/dentistHygienist.jsp");

        request.setAttribute("allPics", lsPics);
        rd.forward(request, response);
    }
    
    private void DisplayImage(int type, String Image, HttpServletResponse response) throws ServletException, IOException {
        PicModel tm = new PicModel();
        tm.setCluster(cluster);

        Pic p = tm.getPic(type, java.util.UUID.fromString(Image));

        OutputStream out = response.getOutputStream();

        response.setContentType(p.getType());
        response.setContentLength(p.getLength());
        InputStream is = new ByteArrayInputStream(p.getBytes());
        BufferedInputStream input = new BufferedInputStream(is);
        byte[] buffer = new byte[8192];
        for (int length = 0; (length = input.read(buffer)) > 0;) {
            out.write(buffer, 0, length);
        }
        out.close();
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

                tm.insertPic(b, type, filename, username, caption, flags, sendto);

                is.close();
            }
            RequestDispatcher rd = request.getRequestDispatcher("/createNewStory.jsp");
            //response.sendRedirect(request.getHeader("Referer"));
            e.setErrorMessage(" Your story has been saved and sent to the patient! ");
            session.setAttribute("ErrorMessages", e);
            rd.forward(request, response);

        }

    }

    private void error(String mess, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = null;
        out = new PrintWriter(response.getOutputStream());
        out.println("<h1>Error</h1>");
        out.close();
        return;
    }
}
