<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Connexion</title>
    </head>

    <body>

        <header>
            <h1>Page de connexion</h1>
        </header>

        <form action="/tpjeesite/connexion" method="post">
            Login:<br>
            <input type="text" name="username" REQUIRED><br>
            Password:<br>
            <input type="text" name="password">
            <input type="submit" value="Connexion">
        </form>

    </body>
</html>
