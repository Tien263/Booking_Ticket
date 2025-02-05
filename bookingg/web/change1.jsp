<%-- 
    Document   : change1
    Created on : Jan 26, 2025, 8:29:19 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <form action="change1" method="post" >
        <div>
            <label for="fullname">Full Name</label>
            <input type="text" name="fullname" value="${customer.getFullname()}" required>
        </div>

        <div>
            <label for="email">Email</label>
            <input type="email" name="email" value="${customer.getEmail()}" readonly required>
        </div>

        <div>
            <label for="username">Username</label>
            <input type="text" name="username" value="${customer.getUsername()}" required>
        </div>

        

        <div>
            <label for="phone">Phone</label>
            <input type="tel" name="phone" value="${customer.getPhone()}" required>
        </div>


        <div>
            <label for="gender">Gender</label>
            <select name="gender" id="gender" required>
                <option value="true" ${customer.isGender() ? 'selected' : ''}>Male</option>
                <option value="false" ${!customer.isGender() ? 'selected' : ''}>Female</option>
            </select>
        </div>


        <div>
            <label for="address">Address</label>
            <input type="text"  name="address" value="${customer.getAddress()}" required>
        </div>
        <p style="color: red; text-align: center;">${error}</p>
        <!--<a><a href="change1?email=${customer.getEmail()}">Save Change</a>-->
        <button type="submit">Save Changes</button>
    </form>
</body>
</html>
