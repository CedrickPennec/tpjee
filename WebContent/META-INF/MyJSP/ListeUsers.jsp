<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.tpjeesite.jee.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%! private List<User> users = new ArrayList<User>();%>
    <%
  try {
    users = (ArrayList<User>) request.getAttribute("users");
  } catch (Exception e) {
    out.append(e.getMessage());
  }

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>

        <header>
            <h1>Liste Utilisateurs</h1>
            <h2><%= session.getAttribute("username") %></h2>
        </header>

        <%
             Cookie cookie = null;
             Cookie[] cookies = null;

             cookies = request.getCookies();

             if( cookies != null ) {
                for (int i = 0; i < cookies.length; i++) {
                   cookie = cookies[i];
                   if(cookie.getName().equals("Edit")){
                       String ok = cookie.getValue();
                       ok = ok.replace("%20", " ");
                       %><div class="cookie"><p><%=ok%></p><%
                   }
                }
             }
        %></div>

        <table id="example">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">username</th>
                    <th scope="col">firstname</th>
                    <th scope="col">Lastname</th>
                    <th scope="col">address</th>
                    <th scope="col">phone</th>
                    <th scope="col">photo</th>
                    <th scope="col">email</th>
                    <th scope="col">password</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
            </thead>

            <tbody>
                <%
                if(users != null){
                for (User user : users) {
                %>

                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getUsername() %></td>
                    <td><%= user.getFirstname() %></td>
                    <td><%= user.getLastname() %></td>
                    <td><%= user.getAddress() %></td>
                    <td><%= user.getPhone() %></td>
                    <td><img src = "images/<%= user.getPhoto() %>" alt="photo_profil" style='height:100px; width:100px'></img></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getPassword() %></td>

                    <% String profilurl = ("/tpjeesite/profil?id=" +  user.getId()); %>

                    <td>
                        <form action="<%= profilurl %>"  method="Post">
                            <input type="submit" value="Profil">
                        </form>
                    </td>

                    <td>
                        <form action="/tpjeesite/site/user/delete/<%= user.getId() %>?Action=DELETE" method="Post" onsubmit="return validation(this);">
                            <input type="submit" value="delete">
                        </form>
                    </td>
                </tr>
                <%
                }
                }
                %>

            </tbody>
        </table>
                <form action="/tpjeesite/creation">
                    <input type="submit" value="Ajouter">
                </form>
        <script>
            function validation() {
                return confirm('Voulez vous vraiment supprimer ?');
                location.href = "";
            }
        </script>
        <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
        <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
        <script>
            $(function(){
                $("#example").dataTable();
            })
        </script>
    </body>
</html>
