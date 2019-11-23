
<%@page import="javax.ws.rs.core.Response"%>
<%@page import="com.tpjeesite.jee.entities.User"%>
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
            <h1>Edition de <%= user.getFirstname() %></h1>
            <h2><%= session.getAttribute("username") %></h2>
        </header>


        <div class="ancien">
            <p>Pseudo : <%= user.getUsername() %></p>
            <p>Prenom : <%= user.getFirstname() %></p>
            <p>Nom : <%= user.getLastname() %></p>
            <p>Address : <%= user.getAddress() %></p>
            <p>N° : <%= user.getPhone() %></p>
            <p>Photo : <%= user.getPhoto() %></p>
            <p>Mail : <%= user.getEmail() %></p>
            <p>Mot de passe : <%= user.getPassword() %></p>
        </div>

        <form class="edit" action="/tpjeesite/site/user/<%= user.getId() %>" method="Post" onSubmit="putCookie()">
            <label for="username">Username</label>
            <input type="text" name="username" value="<%= user.getUsername() %>"><br>
            <label for="password">Mot de passe</label>
            <input type="text" name="password" value="<%= user.getPassword() %>"><br>
            <label for="firstname">Prenom</label>
            <input type="text" name="firstname" value="<%= user.getFirstname() %>"><br>
            <label for="lastname">lastname</label>
            <input type="text" name="lastname" value="<%= user.getLastname() %>"><br>
            <label for="address">address</label>
            <input type="text" name="address" value="<%= user.getAddress() %>"><br>
            <label for="phone">Telephone</label>
            <input type="text" name="phone" value="<%= user.getPhone() %>"><br>
            <label for="photo">Photo</label>
            <input type="text" name="photo" value="<%= user.getPhoto() %>"><br>
            <label for="email">Email</label>
            <input type="text" name="email" value="<%= user.getEmail() %>"><br>
            <input type="submit" value="Editer">
        </form>

        <%  String profilurl = ("/tpjeesite/profil?id=" +  user.getId());%>

        <form class="retour" action="<%= profilurl %>"  method="Post">
            <input type="submit" value="Retour">
        </form>

        <script type="text/javascript">
        function putCookie(){
            <%
                Cookie cookieEdition = new Cookie("Edit","Modification%20effectuee");
                cookieEdition.setMaxAge(10);
                response.addCookie( cookieEdition );
            %>

            return true;
        }
        </script>
    </body>
</html>
