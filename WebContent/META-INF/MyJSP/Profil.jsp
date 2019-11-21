<%@page import="java.util.ArrayList"%>
<%@page import="com.tpjeesite.jee.entities.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%! private User user = new User();%>
    <%
  try {
    user = (User) request.getAttribute("user");
  } catch (Exception e) {
    out.append(e.getMessage());
  }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Insert title here</title>
    </head>
    <body>

        <header>
            <h1>Profil </h1>
            <h2><%= session.getAttribute("username") %></h2>
        </header>

        <%
             Cookie cookie = null;
             Cookie[] cookies = null;

             cookies = request.getCookies();

             if( cookies != null ) {
                for (int i = 0; i < cookies.length; i++) {
                   cookie = cookies[i];
                   if(cookie.getName().equals("Create")){
                       String ok = cookie.getValue();
                       ok = ok.replace("%20", " ");
                       %><div class="cookie"><p><%=ok%></p></div><%
                   }
                }
             }
        %>

        <div class="profil">
            <img src = "images/<%= user.getPhoto() %>" alt="photo_profil" style='height:250px; width:250px'></img>
            <p><%= user.getUsername() %></p>
            <p><%= user.getFirstname() %></p>
            <p><%= user.getLastname() %></p>
            <p><%= user.getAddress() %></p>
            <p><%= user.getPhone() %></p>
            <p><%= user.getEmail() %></p>
            <p><%= user.getPassword() %></p>
        </div>

        <% String editurl = ("/tpjeesite/edition?id=" +  user.getId()); %>

        <form action="<%= editurl %>"  method="Post">
            <input type="submit" value="Editer">
        </form>

        <form action="/tpjeesite/liste"  method="Get">
            <input type="submit" value="Retour">
        </form>


    </body>
</html>
