package com.tpjeesite.jee.api.controllers;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.tpjeesite.jee.entities.User;

@Path("/user")
public class ControllerUser {

    Map<Integer,User> users;

    private ServletContext servletContext;

    public ControllerUser(@Context final ServletContext servletContext) {
        this.servletContext = servletContext;

        if(this.servletContext.getAttribute("users") == null) {
            this.servletContext.setAttribute("users", new HashMap<Integer,User>());
        }

        this.users = (HashMap<Integer,User>) this.servletContext.getAttribute("users");
    }

    @GET
    public Response testGetAll() {
          return Response.ok(users).build();
    }

    @GET  @Path("/{id}")
    public Response testGetOne(@PathParam("id") Integer id){
        if(users.size()>id) {
            return Response.ok(users.get(id)).build();
        }
        else {
            return Response.noContent().build();
        }
    }

    @POST
    @Consumes (MediaType.APPLICATION_FORM_URLENCODED)
    public Response testPost(@FormParam("username") String username,@FormParam("password") String password,
            @FormParam("firstname") String firstname,@FormParam("lastname") String lastname,@FormParam("address") String address,
            @FormParam("phone") String phone,@FormParam("photo") String photo,@FormParam("email") String email) throws URISyntaxException {

        User user = new User();
        if (user.getId() == 0) {
            user.setId(++User.sequence);
        }
        user.setUsername(username);
        user.setPassword(password);
        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setAddress(address);
        user.setPhone(phone);
        user.setPhoto(photo);
        user.setEmail(email);
        this.users.put(user.getId(), user);
        this.servletContext.setAttribute("users", users);

        URI profilpath = new URI("http://localhost:8080/tpjeesite/profil?id=" + user.getId());
        return Response.temporaryRedirect(profilpath).build();
    }

    @POST  @Path("/{id}")
    @Consumes (MediaType.APPLICATION_FORM_URLENCODED)
    public Response testPut(@PathParam("id") Integer id,@FormParam("username") String username,@FormParam("password") String password,
            @FormParam("firstname") String firstname,@FormParam("lastname") String lastname,@FormParam("address") String address,
            @FormParam("phone") String phone,@FormParam("photo") String photo,@FormParam("email") String email) throws URISyntaxException{

        User user = new User();
        user.setId(id);
        user.setUsername(username);
        user.setPassword(password);
        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setAddress(address);
        user.setPhone(phone);
        user.setPhoto(photo);
        user.setEmail(email);

        this.users.replace(user.getId(), user);

        this.servletContext.setAttribute("users", users);

        URI profilpath = new URI("http://localhost:8080/tpjeesite/liste");
        return Response.temporaryRedirect(profilpath).build();
    }

    @POST  @Path("/delete/{id}")
    public Response testDelete(@PathParam("id") Integer id) throws URISyntaxException{
            this.users.remove(id);
            this.servletContext.setAttribute("users", users);
            URI profilpath = new URI("http://localhost:8080/tpjeesite/liste");
            return Response.temporaryRedirect(profilpath).build();
    }

}
