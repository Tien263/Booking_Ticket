<%@ page import="java.util.List" %>
<%@ page import="model.Blog" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Customer Blog View</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            background-color: #7da47f;
            color: white;
            font-family: Arial, sans-serif;
        }
        .blog-container {
            width: 60%;
            margin: 20px auto;
            padding: 20px;
        }
        .blog-item {
            background: white;
            color: black;
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 5px;
        }
        .blog-item img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .blog-meta {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            color: gray;
            margin-top: 10px;
        }
        .blog-title {
            font-size: 24px;
            font-weight: bold;
            margin: 10px 0;
        }
        .blog-brief {
            font-size: 16px;
            line-height: 1.5;
        }
        .read-more {
            display: inline-block;
            margin-top: 10px;
            color: #a8dadc;
            font-weight: bold;
            text-decoration: none;
        }
        .read-more::after {
            content: " →";
        }
    </style>
</head>
<body>
    <div class="blog-container">
        <%
            List<Blog> blogList = (List<Blog>) request.getAttribute("blogList");
            if (blogList != null && !blogList.isEmpty()) {
                for (Blog blog : blogList) {
        %>
        <div class="blog-item">
            <img src="<%= blog.getImage() %>" alt="Blog Image">
            <div class="blog-meta">
                <span>by <%= blog.getUpdatedby() != null ? blog.getUpdatedby().getName() : "N/A" %></span>
                <span><%= blog.getUpdatedtime() %></span>
            </div>
            <h2 class="blog-title"><%= blog.getTitle() %></h2>
            <p class="blog-brief"><%= blog.getBrief() %></p>
            <a href="blogdetail.jsp?id=<%= blog.getId() %>" class="read-more">READ MORE</a>
        </div>
        <%
                }
            } else {
        %>
        <p>Không có blog nào được tìm thấy.</p>
        <%
            }
        %>
    </div>
</body>
</html>