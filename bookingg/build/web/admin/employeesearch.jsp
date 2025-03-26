<%-- 
    Document   : employeesearch
    Created on : Mar 26, 2025, 6:52:11 AM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="employeesearch" method="GET">
            Id: <input type="text" name="id" value="${param.id}"/> <br/> <!-- name="id" : tu dat -->
            Name: <input type="text" name="name" value="${param.name}"/> <br/>
            Gender: <input type="radio" name="gender"
                           ${param.gender ne null && param.gender eq "male"?"checked=\"checked\"":""}
                           value="male"/> Male
            <input type="radio" name="gender"
                   ${param.gender ne null && param.gender eq "female"?"checked=\"checked\"":""}
                   value="female"/> Female
            <input type="radio" name="gender" 
                   ${param.gender eq null or param.gender eq "both"?"checked=\"checked\"":""}
                   value="both"/> Both
            <br/>
            Address <input type="text" name="address" value="${param.address}"/> <br/>
            Phone <input type="text" name="phone" value="${param.phone}"/> <br/>


            Role: <select name="roleId">
                <option value="-1">----------ALL------------</option>
                <c:forEach items="${requestScope.roles}" var="r"> <!-- requestScope.roles : servlet list role -->
                    <option ${param.roleId ne null && param.roleId eq r.id?"selected=\"selected\"":""} 
                        value="${r.getId()}">${r.getName()}</option>
                </c:forEach>
            </select>
            <br/>

            <br/>
            <input type="submit" value="Search"/>
        </form>
        <table border="1px">
            <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Phone</td>
                <td>Gender</td>
                <td>Address</td>
                <td>Role Name</td>
            </tr>
            <c:forEach items="${requestScope.emps}" var="e">
                <tr>
                    <td>${e.getId()}</td>
                    <td>${e.getName()}</td>
                    <td>${e.getPhone()}</td>
                    <td>${e.gender?"Male":"Female"}</td>
                    <td>${e.getAddress()}</td>
                    <td>${e.role.name}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
