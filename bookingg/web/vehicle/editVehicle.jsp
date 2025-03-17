<%-- 
    Document   : editVehicle
    Created on : Mar 6, 2025, 11:26:28 PM
    Author     : Quang Anh
--%>

<%@ page import="dal.VehicleDAO, model.Vehicle" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    VehicleDAO dao = new VehicleDAO();
    Vehicle vehicle = dao.getVehicleById(id);
%>
<html>
    <head>
        <title>Edit Vehicle</title>
    </head>
    <body>
        <h2>Edit Vehicle</h2>
        <form action="vehicle" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= vehicle.getId() %>">
            Type: <input type="text" name="type" value="<%= vehicle.getType() %>" required><br>
            Capacity: <input type="number" name="capacity" value="<%= vehicle.getCapacity() %>" required><br>
            License Plate: <input type="text" name="licensePlate" value="<%= vehicle.getLicensePlate() %>" required><br>
            
            <label for="status">Status:</label>
            <select name="status" id="status">
                <option value="available" <%= vehicle.getStatus().equals("available") ? "selected" : "" %>>Available</option>
                <option value="unavailable" <%= vehicle.getStatus().equals("unavailable") ? "selected" : "" %>>Unavailable</option>
            </select>

            <input type="submit" value="Update Vehicle">
        </form>
        <a href="vehicle">Back to List</a>
    </body>
</html>
