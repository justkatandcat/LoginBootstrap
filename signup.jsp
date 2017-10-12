<%-- 
    Document   : altas
    Created on : 29/03/2017, 09:09:19 PM
    Author     : Kaat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ALTA USUARIO</title>
    </head>
    <body>
        <%@page import="java.sql.*, java.io.*"%>
        <%
            Connection con=null;
            Statement sta=null;
            String email=request.getParameter("email");
            String pass=request.getParameter("key");
           
        try{
          Class.forName("com.mysql.jdbc.Driver").newInstance();
          con=DriverManager.getConnection("jdbc:mysql://localhost/login", "root", "n0m3l0" );
          sta=con.createStatement();
        }
        catch(SQLException error){
            out.print(error.toString());
        }
        
        try{
            sta.executeUpdate("INSERT INTO usuarios VALUES('"+email+"', '"+pass+"');");
            out.println("<script> alert('Registro dado de alta exitosamente.')</script>");
            con.close();
            
        }         
        catch (SQLException error){
             out.print(error.toString());
        }
         con.close();
        %>
    </body>
</html>
