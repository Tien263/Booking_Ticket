
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
</head>
<body>
    <h2>Change your password</h2>
    
    <form action="changepassword" method="post">
        <div>
            <label for="email">Email</label>
            <input type="email" name="email" value="${customer.getEmail()}" readonly required>
        </div>
        
        <label for="currentPassword">Current password:</label>
        <input type="password" id="currentPassword" name="currentPassword" required /><br/><br/>
        
        <label for="newPassword">New password:</label>
        <input type="password" id="newPassword" name="newPassword" required /><br/><br/>
        
        <label for="retypeNewPassword">Re-type new password:</label>
        <input type="password" id="retypeNewPassword" name="retypeNewPassword" required /><br/><br/>

        <button type="submit">Change password</button>
    </form>

    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>

    <c:if test="${not empty success}">
        <p style="color: green;">${success}</p>
    </c:if>
</body>
</html>
