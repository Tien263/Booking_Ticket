<%-- 
    Document   : addVehicle
    Created on : Mar 6, 2025, 11:25:38 PM
    Author     : Quang Anh
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Add Vehicle</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f8f0;
                text-align: center;
                padding: 20px;
            }
            h2 {
                color: #2e7d32;
            }
            form {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                display: inline-block;
                text-align: left;
            }
            input[type="text"],
            input[type="number"] {
                width: 100%;
                padding: 8px;
                margin: 5px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            input[type="submit"] {
                background-color: #4caf50;
                color: white;
                border: none;
                padding: 10px 15px;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
            }
            input[type="submit"]:hover {
                background-color: #388e3c;
            }
            a {
                display: block;
                margin-top: 15px;
                color: #2e7d32;
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <h2>Add New Vehicle</h2>
        <form action="vehicle" method="post">
            <input type="hidden" name="action" value="add">
            <label>Type:</label>
            <input type="text" name="type" required>
            <label>Capacity:</label>
            <input type="number" name="capacity" required>
            <label>License Plate:</label>
            <input type="text" name="licensePlate" required>
            <label for="status">Status:</label>
            <select name="status" id="status">
                <option value="available">Available</option>
                <option value="unavailable">Unavailable</option>
            </select>

            <input type="submit" value="Add Vehicle">
        </form>
        <a href="vehicle">Back to List</a>
    </body>
</html>
