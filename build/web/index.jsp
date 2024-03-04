<%-- 
    Document   : index
    Created on : 13-Dec-2023, 5:33:41 pm
    Author     : Solv-IT
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css--> 
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!--font awesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">   
    <style>
        .banner-background{
           clip-path:polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 76% 91%, 50% 100%, 20% 90%, 0 99%, 0% 35%, 0 0);
        }
    </style>   
</head>

<body>
    <!--navbar-->
    <%@include file="normal_navbar.jsp" %>

    <%
        Connection con = ConnectionProvider.getConnection();
    %>
    

    <div class="container-fluid p-0 m-0">
        <div class="jumbotron bg-primary text-white banner-background">
            <div class="container">
                <h3 class="display-3">Welcome To TechBlog</h3>
                <div>
                    <p>A programming language is a formal language that specifies a set of instructions for a computer to perform specific tasks </p>
                    <p>There are many different programming languages, each with its own syntax, structure, and set of commands</p>
                </div>
                <div style="padding-bottom: 100px"> 
                    <button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Start ! Its Free</button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-o"></span>Login</a>
                </div>
            </div>
        </div>
    </div>


    <!--cards-->

    <div class="container">
        <div class="row mb-2 mt-2">
            <div class="col-md-4">
                <div class="card" ">           
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn bg-primary text-white">Read more..</a>
                    </div>
                </div>
            </div> 
            
             <div class="col-md-4">
                <div class="card" ">           
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn bg-primary text-white">Read more..</a>
                    </div>
                </div>
            </div> 
            
             <div class="col-md-4">
                <div class="card" ">           
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn bg-primary text-white">Read more..</a>
                    </div>
                </div>
            </div> 
            
            
        </div>      
    </div>
    
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="card" ">           
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn bg-primary text-white">Read more..</a>
                    </div>
                </div>
            </div> 
            
             <div class="col-md-4">
                <div class="card" ">           
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn bg-primary text-white">Read more..</a>
                    </div>
                </div>
            </div> 
            
             <div class="col-md-4">
                <div class="card" ">           
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn bg-primary text-white">Read more..</a>
                    </div>
                </div>
            </div> 
            
            
        </div>      
    </div>
    


    <!--javascript-->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script src="js/myjs.js type=text/javascript"></script>
</body>
</html>
