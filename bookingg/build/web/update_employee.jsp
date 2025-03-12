<%-- 
    Document   : update_employee
    Created on : Jan 30, 2025, 12:41:12 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Update Employee Information</h2>
        <form action="employee_update" method="POST">
            <label for="e_name">Name:</label>
            <input type="text" id="e_name" name="e_name" value="${user.emp[0].name}" required><br><br>

            <label for="e_phone">Phone:</label>
            <input type="text" id="e_phone" name="e_phone" value="${user.emp[0].phone}" required><br><br>

            <label for="e_address">Address:</label>
            <input type="text" id="e_address" name="e_address" value="${user.emp[0].address}" required><br><br>

            <label for="e_gender">Gender:</label>
            <select id="e_gender" name="e_gender" required>
                <option value="true" ${user.emp[0].gender ? "selected" : ""}>Male</option>
                <option value="false" ${!user.emp[0].gender ? "selected" : ""}>Female</option>
            </select><br><br>

            <button type="submit">Update</button>
        </form>
    </body>
</html>
