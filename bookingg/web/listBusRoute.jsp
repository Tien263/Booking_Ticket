<%-- 
    Document   : listBusRoute
    Created on : Mar 6, 2025, 1:18:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, model.BusRoute" %>
<%
    ArrayList<BusRoute> list = (ArrayList<BusRoute>) request.getAttribute("listBusRoute");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border = "1">
        <tr>
            <Th>Id</Th>
            <Th>Distance</Th>
            <Th>From</Th>
            <Th>To</Th>
            <Th>Price</Th>
            <Th>Description</Th>
            <Th>Update</Th>
            <Th>Delete</Th>
        </tr>
        <% for(BusRoute busRoute: list) {%>
        <tr>
            <td><%=busRoute.getBr_id()%></td>
            <td><%=busRoute.getBr_distance()%></td>
            <td><%=busRoute.getBr_from()%></td>
            <td><%=busRoute.getBr_to()%></td>
            <td><%=busRoute.getBr_price()%></td>
            <td><%=busRoute.getBr_description()%></td>
            <td><a href="BusRouteURL?service=update&br_id=<%=busRoute.getBr_id()%>">update</a></td>
            <td><a href="BusRouteURL?service=delete&br_id=<%=busRoute.getBr_id()%>">delete</a></td>
        </tr>
        <%}%>
    </body>
</html>
