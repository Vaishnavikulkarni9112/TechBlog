<%-- 
    Document   : index
    Created on : 25-Aug-2023, 10:07:57 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        /* Custom CSS for this page */
        .jumbotron.custom-bg-color {
            background-color: #ff69b4; /* Pink color */
            color: white;
        }

        .jumbotron.custom-bg-color h3 {
            font-size: 3rem;
        }

        .jumbotron.custom-bg-color p {
            font-size: 1.2rem;
        }

        .btn-custom {
            background-color: #ff1493; /* Darker pink */
            border-color: #ff1493;
        }

        .btn-custom:hover {
            background-color: #c71585; /* Lighter pink on hover */
            border-color: #c71585;
        }

        /* Custom background color for the sections */
        .section-bg-color {
            background-color: #ea80fc; /* Pink color */
        }
    </style>
</head>
<body>
    <%@include file="normal_navbar.jsp" %>
    <div class ="container-fluid p-0 m-0">
        <div class="jumbotron custom-bg-color text-white">
            <div class="container">
                <h3 class="display-3">Welcome to TechBlog</h3>
                <p>Welcome to the technical blog, the world of technology. Programming languages are formal languages that allow humans to communicate instructions to computers. They serve as a bridge between human understanding and computer processing.</p>
                <button class="btn btn-custom btn-lg"><span class="fa fa-external-link"></span> Start! It's Free</button>
                <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o fa-spin"></span> Login</a>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>




