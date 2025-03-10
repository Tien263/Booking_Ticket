<%@ page import="java.util.List" %>
<%@ page import="model.Blog" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Customer Blog View</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <h1>Danh sách Blog</h1>
        <div class="blog-container">
            <% List<Blog> blogList = (List<Blog>) request.getAttribute("blogList"); %>
            <% for (Blog blog : blogList) { %>
            <div class="blog-item">
                <p><%= blog.getCreatedby().getName() %></p>
                <p><%= blog.getUpdatedby().getName() %></p>
                <h2><%= blog.getTitle() %></h2>
                <p><%= blog.getBrief() %></p>
                <img src="<%= blog.getImage() %>" alt="Blog Image" class="blog-image">
                <a href="blogdetail.jsp?id=<%= blog.getId() %>" class="read-more">Read More</a>
            </div>
            <% } %>
        </div>
    </body>
</html>
