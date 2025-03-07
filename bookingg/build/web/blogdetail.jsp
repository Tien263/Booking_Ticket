<%@ page import="model.Blog" %>
<%@ page import="dal.BlogDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Blog Detail</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background-color: #f0f4f8;
            color: #333;
        }

        .blog-detail {
            width: 60%;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 3px 8px rgba(0,0,0,0.1);
        }

        .blog-detail h1 {
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #2d3748;
        }

        .blog-detail h3 {
            font-size: 18px;
            font-style: italic;
            color: #4a5568;
            margin-bottom: 20px;
        }

        .blog-detail img {
            width: 100%;
            height: auto;
            border-radius: 6px;
            margin-bottom: 20px;
        }

        .blog-detail .content {
            white-space: pre-line; /* giữ nguyên định dạng xuống dòng */
            font-size: 16px;
            line-height: 1.8;
            margin-bottom: 20px;
        }

        .blog-meta {
            font-size: 14px;
            color: #718096;
            display: flex;
            justify-content: space-between;
            border-top: 1px solid #e2e8f0;
            padding-top: 15px;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #7da47f;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <%
        String blogId = request.getParameter("id");
        BlogDao blogDao = new BlogDao();
        Blog blog = blogDao.get(Integer.parseInt(blogId));
    %>

    <div class="blog-detail">
        <h1><%= blog.getTitle() %></h1>
        <h3><%= blog.getBrief() %></h3>
        <img src="<%= blog.getImage() %>" alt="Blog Image">

        <div class="content"><%= blog.getContent() %></div>

        <div class="blog-meta">
            <span>Updated by: <%= blog.getUpdatedby() != null ? blog.getUpdatedby().getName() : "N/A" %></span>
            <span>Date: <%= blog.getUpdatedtime() %></span>
        </div>

        <a href="cuslistblog" class="back-link">← Back to Blog List</a>
    </div>
</body>
</html>
