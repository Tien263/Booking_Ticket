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
        <h2>Search Vehicles</h2>

        <!-- Form tìm kiếm theo biển số -->
        <form action="vehicle" method="GET">
            <label for="licensePlate">Search by License Plate:</label>
            <input type="text" name="licensePlate" id="licensePlate">
            <button type="submit">Search</button>
        </form>

        <!-- Form tìm kiếm theo loại xe -->
        <form action="vehicle" method="GET">
            <label for="type">Search by Type:</label>
            <input type="text" name="type" id="type">
            <button type="submit">Search</button>
        </form>

        <h2>List of Vehicles</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Type</th>
                <th>Capacity</th>
                <th>License Plate</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <% 
                List<Vehicle> vehicles = (List<Vehicle>) request.getAttribute("vehicles");
                if (vehicles != null) {
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

                </td>
            </tr>
            <% 
                    }
                } else { 
            %>
            <tr>
                <td colspan="6">No vehicles found.</td>
            </tr>
            <% } %>
        </table>

        <button onclick="window.location.href = 'addVehicle.jsp'">Add</button>

        <%-- Hiển thị thông báo thành công hoặc lỗi --%>
        <% 
            String errorMessage = (String) session.getAttribute("errorMessage");
            String successMessage = (String) session.getAttribute("successMessage");
            if (errorMessage != null) { 
        %>
        <p style="color: red;"><%= errorMessage %></p>
        <% 
                session.removeAttribute("errorMessage");
            } else if (successMessage != null) { 
        %>
        <p style="color: green;"><%= successMessage %></p>
        <% 
                session.removeAttribute("successMessage");
            } 
        %>

    </body>
</html>


