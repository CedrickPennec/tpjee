package com.tpjeesite.jee.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ConnexionServlet
 */
@WebServlet("/connexion")
public class ConnexionServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    RequestDispatcher rd;

    rd = this.getServletContext().getNamedDispatcher("ConnexionJSP");
    rd.forward(request, response);
  }


  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


      HttpSession session = request.getSession();
      String login = (String) request.getParameter("username");

      if(login != null && login.trim().length()>0) {
          session.setAttribute("username", request.getParameter("username"));
          session.setAttribute("password", request.getParameter("password"));
          response.sendRedirect("http://localhost:8080/tpjeesite/liste");
      } else {
          response.sendRedirect("http://localhost:8080/tpjeesite/connexion");
      }




  }
}
