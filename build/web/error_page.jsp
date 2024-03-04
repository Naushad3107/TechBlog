

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
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
        <div class="container text-center" >
            <img src="img/server.png" class="img-fluid" style="padding-top: 3vh">
            <h3 class="display-3">Sorry ! Something went wrong...</h3>
            
            <a href="index.jsp" class="btn bg-primary text-white mt-3  btn-lg ">Home</a>
            
            
        </div>
        
    </body>
</html>
