<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.user"%>
<%@page errorPage="error_page.jsp" %>
<%
 user user =(user)session.getAttribute("currentUser");
 if(user==null)
 {
 response.sendRedirect("login.jsp");
}
   
%>

<%
  int postId = Integer.parseInt(request.getParameter("post_id"));
  PostDao d =new PostDao(ConnectionProvider.getConnection());
  Post p =d.getPostByPostId(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .post-title{
                font-weight: 100;
                font-size: 30px;
            } 
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }
            body{
                background:url(img/tech1.jpeg);
                background-size: cover;
                background-attachment: fixed
            }
        </style>
        
        
        
        
    </head>
    <body>
        
        
        <!-- start of navbar -->
        
        <nav class="navbar navbar-expand-lg navbar-dark custom-bg-color">
  <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>  Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="profile.jsp"> <span class="fa fa-bell-o"></span>  Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class=" fa fa-check-square-o"></span>  Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"> <span class="fa fa-address-card-o"> </span>  Contact</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="#"data-toggle="modal" data-target="#add-post-modal" > <span class="fa fa-asterisk"> </span> Do Post</a>
      </li>
      
    </ul>
      <u1 class="navbar-nav mr-right">
          <li class="nav-item">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class=" fa fa-user-circle"> </span> <%= user.getName() %> </a>
      </li> 
          
         <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"> <span class=" fa fa-address-book"> </span> Logout </a>
      </li> 
          
      </u1>
  </div>
</nav>
      <!-- end of navbar -->
      <!-- main content of body-->
      
      <div class="container">
          
          <div class ="row my-4">
              
              <div class="col-md-8 offset-md-2">
                  
                  <div class ="card">
                      
                      
                      <div class="card-header">
                          <h4 class="post-title"><%= p.getpTitle() %></h4>
                          
                          
                          
                      </div>
                          
                          <div class="card-body">
                              
                              <img class="card-img-top my-2" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">
                              
                              
                              <div class="row my-3 row-user">
                                  
                                  <div class="col-md-8">
                                       <% UserDao ud = new UserDao(ConnectionProvider.getConnection()); %>
                                      <p class="post-user-info"> <a href="#!"> <%=ud.getUserByUserId(p.getUserId()).getName()%>  </a> has posted : </p>
                                      
                                  </div>
                                  
                                  <div class="col-md-4">
                                      <p class="post-date"> <%=  DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
                                      
                                      
                                  </div>
                              </div>
                              <p class="post-content"><%= p.getpContent()%></p>
                              
                              <br>
                              <br>
                              <div class="post-code">
                              <pre><%= p.getpCode()%></pre>
                              </div>
                              
                          </div>
                              
                              <div class="card-footer custom-bg-color">
                                  
                                  
                                  
                              </div>
                  </div>
              </div>
          </div>
      </div>
      
      <!-- End of main content of body-->
       
        
        <!-- start of modal -->
      
      <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg-color text-white ">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
             <img src="pics/<%= user.getProfile()%>">
                  <br>
             <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%> </h5> 
             
             <!-- table start -->
             <div id="profile-details">
             <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">ID :</th>
      <td><%= user.getId() %></td>
      
    </tr>
    <tr>
      <th scope="row">Email :</th>
      <td><%= user.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender :</th>
      <td><%= user.getGender() %></td>
      
    </tr>
    
    <tr>
      <th scope="row">Status :</th>
      <td><%= user.getAbout() %></td>
      
    </tr>
     
    <tr>
      <th scope="row">Registered on :</th>
      <td><%= user.getDateTime().toString() %></td>
      
    </tr>
  </tbody>
</table>
             
             <!-- table end -->
             
          </div>
      <!-- profile edit-->
      <div id="profile-edit" style="display: none;">
          
          <h3 class="mt-2">Please Edit Carefully </h3>
          <form action="EditServlet" method="post" enctype="multipart/form-data">
              
              <table class="table">
                  <tr>
                      <td> ID :</td>
                      <td> <%= user.getId() %></td>
                  </tr>
                  
                   <tr>
                      <td> Email :</td>
                      <td> <input type="email" class="form-control" name="user_email"  value="<%= user.getEmail()%>" </td>
                  </tr>
                  
                   <tr>
                      <td> Name :</td>
                      <td> <input type="text" class="form-control" name="user_name"  value="<%= user.getName()%>" </td>
                  </tr>
                  
                  <tr>
                      <td> Password :</td>
                      <td> <input type="password" class="form-control" name="user_password"  value="<%= user.getPassword()%>" </td>
                  </tr>
                  
                  <tr>
                      <td>Gender :</td>
                      <td> <%= user.getGender().toUpperCase()%> </td>
                  </tr>
                  <tr>
                      <td>About :</td>
                      <td>
                          
                          <textarea rows="3" class="form-control" name="user_about"><%= user.getAbout()%>
                              

                          </textarea>
                      </td>
                  </tr>
                  
                   <tr>
                      <td>New Profile: </td>
                      <td>
                          
                          <input type="file" name="image" class="form-control">
                      </td>
                  </tr>
                  
              </table>
                          
                          <div class="container">
                              <button type="submit" class="btn-outline-custom-bg-color" style="background-color: #ea80fc">Save</button>
                          </div>
          </form>
      </div>
          </div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary" style="background-color: #ea80fc" >EDIT</button>
      </div>
    </div>
  </div>
</div>
      
      
      
      
      <!-- end of modal-->
      <!-- add post modal-->
      
      <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide The Post Details...</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          <form id="add-post-form" action="AddPostServlet" method="post">
              
              <div class="form-group">
                  
                  <select class="form-control" name="cid">
                      
                      <option selected disabled>---Select Category---</option>
                      
                      <%
                          PostDao postd= new PostDao(ConnectionProvider.getConnection());
                          ArrayList<Category> list=postd.getAllCategories();
                          for(Category c:list)
                          {
                          %>
                      
                      <option value="<%=c.getCid() %>"><%=c.getName() %></option>
                      
                      <%
                          }
                       %>
                  </select>
              </div>
              <div class="form-group">
                  <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control"/>   
                  
              </div>
              
              <div class="form-group">
                  
                  <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter Your Content "></textarea>
              </div>
              
              <div class="form-group">
                  
                  <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter Your Code (if any) "></textarea>
              </div>
              
              <div class="form-group">
                  <label>
                      Select Your Pic...
                  </label>
                  <br>
                      
                  <input type="file" name="pic">
              </div>
              
              <div class="container text-center">
                              <button type="submit" class="btn btn-outline-custom-bg-color" style="background-color: #ea80fc">Post</button>
                              
                          </div>
              
          </form>
      </div>
      
    </div>
  </div>
</div>
      
      <!-- END add post modal-->
      
      
      
      
      
      
      
      
      
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"> </script>
         <script src="js/myjs.js" type="text/javascript"></script>
         
         <script>
             
             $(document).ready(function(){
               let editStatus = false;
               $('#edit-profile-button').click(function (){
                   if(editStatus===false){
                       $("#profile-details").hide();
                       $("#profile-edit").show();
                       editStatus = true;
                       $(this).text("Back");
                   } else{
                       $("#profile-details").show();
                       $("#profile-edit").hide();
                       editStatus = false;
                       $(this).text("Edit");
                   }
                });
             });
             </script>
             <!-- now add post js -->
             <script>
                $(document).ready(function (e) {
    $("#add-post-form").on("submit", function (event) {
        // This code gets called when the form is submitted...
        event.preventDefault();
        console.log("you have clicked on submit..");
        let form = new FormData(this);
        // Now, send a request to the server using AJAX
        $.ajax({
            url: "AddPostServlet",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                // Handle success here...
                console.log(data);
                if (data.trim() === 'done') {
                  swal("Good Job!", "Saved Successfully", "success");
                  } else {
                    swal("Good Job!", "Saved Successfully", "success");
                    }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                // Handle error here...
                
            },
            processData: false,
            contentType: false
        });
    });
});

             </script>
    </body>
</html>
