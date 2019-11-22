<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Insert title here</title>
    </head>

    <body>
        <header>
            <h1>Ajouter un utilisateur</h1>
            <h2><%= session.getAttribute("username") %></h2>
        </header>

        <%
            Cookie cookieCreation = new Cookie("Create","Utilisateur%20ajoute");
            cookieCreation.setMaxAge(1);
            response.addCookie( cookieCreation );
        %>

        <div>
            <form action="/tpjeesite/site/user" method="Post">
                <label for="username">Username</label>
                <input type="text" name="username"><br>
                <label for="password">Mot de passe</label>
                <input type="text" name="password"><br>
                <label for="firstname">Prenom</label>
                <input type="text" name="firstname"><br>
                <label for="lastname">lastname</label>
                <input type="text" name="lastname"><br>
                <label for="address">address</label>
                <input type="text" name="address"><br>
                <label for="phone">Telephone</label>
                <input type="text" name="phone"><br>
                <label for="photo">Photo</label>
                <input type="text" name="photo"><br>
                <label for="email">Email</label>
                <input type="text" name="email"><br>
                <input type="submit" value="Ajouter">
            </form>
        </div>

    </body>
</html>
