
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>

<%

    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><span class="	fa fa-code"> </span>Tech Blog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-code-fork"></span>Learn To Code</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="fa fa-check-square-o"></span>Categories
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Project Implementation</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Data Structures</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ">Contact<span class="fa fa-address-book-o"></span></a>
                        </li>



                        <li class="nav-item">
                            <a class="nav-link" href="register_page.jsp">Logout<span class="fa fa-user-out"></span></a>
                        </li>

                    </ul>

                    <ul class="navbar-nav mr-right">

                        <li class="nav-item">
                            <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user-circle"> <%= user.getName()%></span></a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet">Logout<span class="fa fa-user-out"></span></a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>




        <!--end of navbar-->

        <!--profile details-->

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white" >
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Tech Blog</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px" >
                            <br> 
                            <h1 class="modal-title fs-3" id="exampleModalLabel"><%= user.getName()%></h1>
                            <!--details table-->
                            <div id="profile-details">
                                <table class="table">    
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID : </th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender : </th>
                                            <td colspan="2"><%= user.getGender()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Registered Date : </th>
                                            <td colspan="2"><%= user.getDate().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->
                            <div id="profile-edit" style="display: none">
                                <h4 class="mt-3">Please Edit Carefully</h4>
                                
                                <form action="EditServlet" method="post" enctype="multipart/form-data" >
                                    <table class="table">
                                        <tr>
                                            
                                            <td>ID : </td>
                                            <td><%= user.getId() %></td>
                                        </tr>    
                                        
                                        <tr> 
                                            <td>Name : </td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>" style="text-align: center"></td>
                                        </tr>
                                        
                                        
                                        <tr> 
                                            <td>Email : </td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>" style="text-align: center"></td>
                                        </tr>
                                        <tr>
                                            <td>Password : </td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>" ></td>
                                        </tr>
                                        
                                        <tr>
                                            <td>Gender : </td>
                                            <td name="usergender"><%= user.getGender().toUpperCase() %></td>
                                        </tr>
                                        
                                        <tr>
                                            <td>New Profile: </td>
                                            <td>
                                                <input type="file" name="image" class="form-control">
                                                
                                            </td>
                                        </tr>
                                        
                                        
                                    </table>
                                    
                                        <div class="container">
                                            <button type="submit" class="btn btn-outline-primary"  >Save</button>
                                            
                                        </div>
                                        
                                </form>
                            </div>


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end of profile details-->



        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <script src="js/myjs.js type=text/javascript"></script>

        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-button').click(function () {

                    if (editStatus == false)
                    {

                        $("#profile-details").hide();

                        $("#profile-edit").show();
                        
                        editStatus = true;
                        $(this).text("Back")
                    }else
                    {
                        $("#profile-details").show();

                        $("#profile-edit").hide();
                        
                        editStatus = false;
                        
                         $(this).text("Edit")
                    }


                });


            });



        </script>


    </body>
</html>
