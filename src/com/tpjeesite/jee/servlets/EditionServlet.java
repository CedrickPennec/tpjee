package com.tpjeesite.jee.servlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpjeesite.jee.entities.User;

/**
 * Servlet implementation class EditionServlet
 */
@WebServlet("/edition")
public class EditionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext servletcontext = this.getServletContext();
        HashMap<Integer,User> tempmap = (HashMap<Integer, User>) servletcontext.getAttribute("users");

        String strid = request.getParameter("id");
        Integer id = Integer.parseInt(strid);

        User usrCourant = tempmap.get(id);

        request.setAttribute("user", usrCourant);

        RequestDispatcher rd;

        rd = this.getServletContext().getNamedDispatcher("EditionJSP");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String strid = request.getParameter("id");
        Integer id = Integer.parseInt(strid);
        response.sendRedirect("http://localhost:8080/tpjeesite/edition?id="+id);

    }

}
