<%-- 
    Document   : login
    Created on : 11/10/2017, 11:47:34 PM
    Author     : Kaat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accediendo...</title>
    </head>
    <body>
        <%@page import="java.sql.*, java.io.*"%>
        <%
            Connection con = null;
            PreparedStatement p = null;
            ResultSet r = null;
            Statement sta = null;
            String usu = request.getParameter("email");
            String pass = request.getParameter("key");

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/cine", "root", "n0m3l0");
                sta = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                String call = "call sp_log(?,?);";

                String msj = null;
                p = con.prepareStatement(call);
                p.setString(1, usu);
                p.setString(2, pass);
                r = p.executeQuery();
                while (r.next()) {
                    msj = r.getString(1);
                }
                if (msj.equals("!=existe")) {
                    out.println("<script>alert('No existe el usuario');</script>");
                   
                } else if (msj.equals("!=contra")) {
                    out.println("<script>alert('Contraseña incorrecta');</script>");
                    
                } else if (msj.equals("true")) {
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("idUsuario", usu);
                    
                    out.println("<input type='text' name='idd' id='idd' value='"+usu+"'>");
                    out.println("</form>");
                    
                }
            } catch (SQLException error) {
                out.println(error);
            }
        %>

    </body>
</html>

