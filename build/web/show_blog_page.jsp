<%-- 
    Document   : show_blog_page
    Created on : 26-Jun-2024, 1:25:20 pm
    Author     : LENOVO
--%>
<%@page import="com.tech.blog.daoo.Likedao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.daoo.Userdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities1.Category"%>
<%@page import="com.tech.blog.entities1.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.daoo.Postdao"%>
<%@page import="com.tech.blog.entities1.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user=(User)session.getAttribute("currentUser");
    if(user==null){
    response.sendRedirect("login_page.jsp");
    }
%>
<%
    int postId=Integer.parseInt(request.getParameter("post_id"));
    Postdao d=new Postdao(ConnectionProvider.getConnection());
    Post p=d.getPostByPostId(postId);

    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpTitle() %> || TechBlog by Learn with Kopal</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background{
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 80% 96%, 45% 94%, 0 99%, 0 0);
            
        }
        .post-title{
            font-weight:100;
            font-size: 30px;
        }
        .post-content{
            font-weight: 100;
            font-size: 25px;
        }
        .post-date{
            font-style:italic;
            font-weight:bold;
        }
        .post-user-info{
            font-size:20px;
            font-weight:100;
        }
        .row-user{
            border:1px solid #e2e2e2;
            padding-top: 15px;
        }
        body{
            background: url(img/back.png);
            background-size: cover;
            background-attachment: fix;
                
        }
        </style>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v20.0" nonce="9eEF3Naa"></script>
    </head>
    <body>
        
        <nav class="navbar navbar-expand-lg navbar-light primary-background">
    <a class="navbar-brand" href="index.jsp">   <span class="fa fa-asterisk"></span>Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="profile.jsp"><span class="fa fa-address-card"></span>Learn Code With Kopal <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-check-square-o"></span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#"><span class="fa fa-phone-square"></span>Contact</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span>Do Post</a>
      </li>
      
    </ul>
      <ul class="navbar-nav mr-right">
          <li class="nav-item">
          <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%= user.getName()%></a>
      </li>
          <li class="nav-item">
          <a class="nav-link" href="LogoutServlet2"><span class="fa fa-user-plus"></span>Logout</a>
      </li>
      </ul>
  </div>
</nav>
      <!-- main content of the body -->
      
      
      <div class="container">
          <div class="row my-4">
              <div class="col-md-8 offset-md-2">
                  <div class="card">
                      <div class="card-header bg-primary text-white">
                          <h4 class="post-title"><%=p.getpTitle()%></h4>
                      </div>
                      <div class="card-body">
                          
                          <img class="card-img-top my-2" src="blog_pics/<%=p.getpPic()%>" alt="card image cap">
                          <div class="row my-3 row-user">
                              <div class="col-md-8">
                                  
                             <% Userdao ud=new Userdao(ConnectionProvider.getConnection());%>  
    <p class="post-user-info"> <a href="#!"><%=ud.getUserByUserId(p.getUserId()).getName()%></a> has posted: </p> 
                              </div>
                              <div class="col-md-4">
                                  <p class="post-date"><%=DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
                               
                              </div>
                          </div>
                          
                          
                          
                          <p class="post-content"><%=p.getpContent()%></p>
                          <br>
                          <br>
                          <div class="post-code">
                          <pre><%=p.getpCode()%></pre>
                          </div>
                      </div>
                          <%
                              Likedao ld=new Likedao(ConnectionProvider.getConnection());
                              
                          %>
                      <div class="card-footer  bg-primary">
    <a href="#!" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>
               
                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
                      </div>
    <div class="card-footer">
        <div class="fb-comments" data-href="http://localhost:9494/TechBlog/show_blog_page.jsp?post_id=<%=p.getPid()%>" data-width="" data-numposts="5"></div>
    </div> 
    
    
                  </div>
              </div>
          </div>
      </div>
      
      
      <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel">Techblog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              
              <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:20%;max-width:150px;">
              <br>
              <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
              <!<!-- details -->
              <div id="profile-detail">
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
      <td><%=user.getGender()%></td>
      
    </tr>
    <tr>
      <th scope="row">About : </th>
      <td><%=user.getAbout()%></td>
      
    </tr>
    <tr>
      <th scope="row">Registered on : </th>
      <td><%=user.getDateTime().toString()%></td>
      
    </tr>
  </tbody>
</table>
              </div>
          </div>
      
      <!-- profile edit -->
      <div id="profile-edit" style="display:none;">
                    <h3 class="mt-2">Please Edit Carefully</h3>
                    <form action="EditServlet1" method="post" enctype="multipart/form-data">
                        <table class="table">
                            <tr>
                                <td> Id:</td>
                                <td><%= user.getId()%></td>
                            </tr>
                        <tr>
                                <td> Email:</td>
                                <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                            </tr>
                           <tr>
                                <td>Name :</td>
           <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                            </tr> 
                          <tr>
                                <td>Password :</td>
                  <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                            </tr> 
                            <tr>
                                <td>Gender :</td>
                           <td><%=user.getGender().toUpperCase()%></td>
                       
                            </tr>
                            <tr>
                                <td>About :</td>
                                <td>
           <textarea row="3" class="form-control" name="user_about" ><%=user.getAbout()%>   
                                    </textarea>
                                </td>
                       <tr>
                                <td>New Profile Pic :</td>
                                <td>
                                    <input type="file" name="image" class="form-control>"
                                </td>
                       
                            </tr>         
                        </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                    </form>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button  id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
                                    <!-- addd post model -->  
                                    
                                    
                                    
                                    
         

<!-- Modal -->
                  <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide The Post Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form id="add-post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">
              <div class="form-group">
              <select class="form-control" name="cid">

                  <option selected disabled>----Select Category----</option>
                  <%
                      Postdao postd=new Postdao(ConnectionProvider.getConnection());
                    ArrayList<Category> list= postd.getAllCategories();
                    for(Category c:list)
                    {
                      
                  %>
                  <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                  <% 
                      }
                  %>
              </select>
              </div>
              
              <div class="form-group">
                  <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control"/>
              </div>
              <div class="form-group">
                  <textarea name="pContent" class="form-control"  style="height:200px" placeholder="Enter your content"></textarea>
              </div>
              <div class="form-group">
                  <textarea name="pCode" class="form-control"  style="height:200px" placeholder="Enter your program(if any)"></textarea>
              </div>
              <div class="form-group">
                  <label Select Your Pic..></label>
                  <br>
                  <input type="file" name="pic">
              </div>
              <div class="container text-center">
                  <button type="submit" class="btn-btn-outline-primary">Post</button>
                  
              </div>
          </form>
        
        
        
        
        
      </div>
      
    </div>
  </div>
</div>
        
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script>
    $(document).ready(function(){
        let editStatus=false;
        
        $('#edit-profile-btn').click(function(){
            if(editStatus===false)
            {
                $("#profile-detail").hide();
                $("#profile-edit").show();
               editStatus=true;
                $(this).text("back");
            }else{
                $("#profile-detail").show();
                $("#profile-edit").hide();
                editStatus=false;
                $(this).text("Edit");
            }
        });
    });
</script>
<!--NOW ADD POST JS -->
<script>
    


$(document).ready(function(){
        console.log("loaded....");
        $('#add-post-form').on('submit',function(event){
            event.preventDefault();
            console.log("you have click on submit");
            let form=new FormData(this);
            
            $.ajax({
                url:"AddPostServlet",
                type:'POST',
                data:form,
                success:function(data,textStatus,jqXHR){
                    console.log(data);
                    
                 if(data.trim()==='done'){
             
swal("Good job!", "savedsuccssfully", "success");
                 }
else{
   swal("error", "something went wrong", "error");
}  
                },
                error:function(jqXHR,textStatus,errorThrown){
                    
                   swal("error", "something went wrong", "error");
console.log(jqXHR);
                },
                processData:false,
                contentType:false
            });
        });
    });

   </script>
    </body>
</html>
