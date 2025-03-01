<%@ page import="model.Blog" %>
<%@ page import="dal.BlogDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Blog Detail</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <%
        String blogId = request.getParameter("id");
        BlogDao blogDao = new BlogDao();
        Blog blog = blogDao.get(Integer.parseInt(blogId));
    %>
    
    <h1><%= blog.getTitle() %></h1>
    <img src="<%= blog.getImage() %>" alt="Blog Image" class="blog-image">
    <p><%= blog.getContent() %></p>
    <p><%= blog.getCreatedby().getName() %></p>
    <p><%= blog.getUpdatedby().getName() %></p>
    <p><%= blog.getUpdatedtime() %></p>
    <a href="cuslistblog">Back to Blog List</a>
</body>
</html>
