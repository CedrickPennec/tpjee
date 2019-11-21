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
 * Servlet implementation class ListeUsersServlet
 */
@WebServlet("/liste")
public class ListeUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListeUsersServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        ServletContext servletcontext = this.getServletContext();
        HashMap<Integer,User> tempmap = (HashMap<Integer, User>) servletcontext.getAttribute("users");
        if(tempmap != null) {
            List<User> listtemp = new ArrayList<>(tempmap.values());
            request.setAttribute("users", listtemp);
        }

        RequestDispatcher rd;

        rd = this.getServletContext().getNamedDispatcher("ListeJSP");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            response.sendRedirect("http://localhost:8080/tpjeesite/liste");
    }

}
