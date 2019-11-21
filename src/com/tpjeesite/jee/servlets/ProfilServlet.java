package com.tpjeesite.jee.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tpjeesite.jee.entities.User;

/**
 * Servlet implementation class ProfilServlet
 */
@WebServlet("/profil")
public class ProfilServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfilServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext servletcontext = this.getServletContext();
        HashMap<Integer,User> tempmap = (HashMap<Integer, User>) servletcontext.getAttribute("users");

        String strid = request.getParameter("id");
        Integer id = Integer.parseInt(strid);

        User usrCourant = tempmap.get(id);

        request.setAttribute("user", usrCourant);

        RequestDispatcher rd;

        rd = this.getServletContext().getNamedDispatcher("ProfilJSP");
        rd.forward(request, response);
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String strid = request.getParameter("id");
        Integer id = Integer.parseInt(strid);
        response.sendRedirect("http://localhost:8080/tpjeesite/profil?id="+id);

    }
}


