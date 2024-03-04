<%-- 
    Document   : register_page
    Created on : 18-Dec-2023, 12:59:27 pm
    Author     : Solv-IT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration </title>

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

        <%@include file="normal_navbar.jsp" %>

        <main class="bg-primary p-5 banner-background">
            <div class="container">  
                <div class="col-md-5 offset-md-3">
                    <div class="card">
                        <div class="card_header text-center" >
                            <span class="fa fa-user-plus fa-3x" style="margin-top:5vh" ></span><p>
                                <br>Register Here</p> </div>
                        <div class="card_body">

                            <form   id="reg-form" action="RegisterServlet" method="POST" style="padding: 15px">
                                <div class="mb-3">
                                    <label for="user_name" class="form-label">User Name</label>
                                    <input name="user_name"  type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">

                                </div>


                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Mail">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>

                                <div class="mb-3">
                                    <label for="gender" >Select Gender</label><br>
                                    <input name="user_gender" type="radio" id="gender" name="gender" value="Male"> Male
                                    <input name="user_gender" type="radio" id="gender" name="gender" value="female"> Female
                                </div>


                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>


                                <div class="mb-3 form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label name="check" class="form-check-label" for="exampleCheck1">Agree To Terms And Agreement</label>
                                </div>
                                <div class="container text-center" id="loader" style="display : none;">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please Wait...</h4>

                                </div>

                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>




                        </div>
                    </div>



                </div>
            </div>
        </main>





        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded...")

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    $("#submit-btn").hide();
                    $("#loader").show();

                    let form = new FormData(this);

                    //send to register servlet

                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#submit-btn").show();
                            $("#loader").hide();

                            swal("Registered Sucessfully!...redirecting to login page")
                                    .then((value) => {
                                        window.location = "login_page.jsp";
                                    });
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    })

                });


            });



        </script>
    </body>
</html>
