<%-- 
    Document   : vehicle-list
    Created on : Mar 6, 2025, 5:47:16 PM
    Author     : Quang Anh
--%>
<%@ page import="java.util.List" %>
<%@ page import="model.Vehicle" %>
<%@ page import="dal.VehicleDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Vehicle Management</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0fff0; /* Xanh lá nhạt */
                text-align: center;
            }
            h2 {
                color: #228B22; /* Xanh lá cây đậm */
            }
            table {
                width: 80%;
                margin: auto;
                border-collapse: collapse;
                background-color: white;
                box-shadow: 0 0 10px rgba(0, 128, 0, 0.2);
            }
            th, td {
                padding: 10px;
                border: 1px solid #228B22;
                text-align: center;
            }
            th {
                background-color: #32CD32;
                color: white;
            }
            a {
                text-decoration: none;
                color: #228B22;
                font-weight: bold;
            }
            a:hover {
                color: red;
            }
            button {
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #32CD32;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 16px;
                border-radius: 5px;
            }
            button:hover {
                background-color: #228B22;
            }
        </style>
    </head>
    <body>
        

        <h2>List of Vehicles</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Type</th>
                <th>Capacity</th>
                <th>License Plate</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <%-- Dữ liệu phương tiện sẽ được hiển thị tại đây --%>
            <% 
                VehicleDAO dao = new VehicleDAO();
                List<Vehicle> vehicles = dao.getAllVehicles();
                for (Vehicle v : vehicles) {
            %>
            <tr>
                <td><%= v.getId() %></td>
                <td><%= v.getType() %></td>
                <td><%= v.getCapacity() %></td>
                <td><%= v.getLicensePlate() %></td>
                <td><%= v.getStatus() %></td>
                <td>
                    <a href="editVehicle.jsp?id=<%= v.getId() %>">Edit</a> 
                    <!--                <a href="vehicle?action=delete&id=?" onclick="return confirm('Are you sure?');">Delete</a>-->
                </td>
            </tr>
            <% } %>
        </table>
        <button onclick="window.location.href = 'addVehicle.jsp'">Add</button>
        <% if (request.getAttribute("errorMessage") != null) { %>
    <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
<% } %>

    </body>
</html>


