<%-- 
    Document   : index
    Created on : 22-Jun-2024, 10:50:42 am
    Author     : LENOVO
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!<!-- css -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background{
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 80% 96%, 45% 94%, 0 99%, 0 0);
        }
        </style>
    </head>
    <body>
        
        <%@include file="normal_navbar.jsp" %>
        
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron background-dark text-black">
                <div class="container">
                
                <h5 class="display-3">WELCOME TO TECH BLOG</h5>
                <p>Welcome to technical blog,world of technology
                A programming language is a type of written language that tells computers what to do. Examples are: Python, Ruby, Java, JavaScript, C, C++, and C#. Programming languages are used to write computer programs and computer software. A programming language is like a set of commands that tell the computer how to do things.</p>
                <p> Usually, the programming language uses real words for some of the commands (e.g. "if... then... else...", "and", "or"), so that the language is easier for a human to understand. Like any normal language, many programming languages use punctuation. To make a program, a programmer writes commands in their chosen programming language and saves the commands to a text file. This text file is called source code. Some programming languages, such as Python and JavaScript, can be read by the computer right away. If not, the source code has to be compiled, which means that the computer translates the source code into another language (such as assembly language[1][2] or machine language) that a computer can read, but which is much harder for a person to read.</p>
                <button class="btn btn-outline dark" btn-lg> <span class="fa fa-user-plus"></span>Start ! Its Free</button>
                <a href="login_page.jsp" class="btn btn-outline dark" btn-lg><span class="fa fa-user-circle-o fa-spin"></span>Login</a>
                </div>
            </div>          
        </div>
        <br>
        <div class="conatiner">
            <div class="row">
                <div class="col-md-4">
                    <div class="card" >
 
  <div class="card-body">
    <h5 class="card-title">Java Programming Language</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-background-black text-black">Read More</a>
  </div>
</div>
                </div>
                <div class="col-md-4">
                    <div class="card" >
 
  <div class="card-body">
    <h5 class="card-title">Java Programming Language</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-background-black text-black">Read More</a>
  </div>
</div>
                </div>
                <div class="col-md-4">
                    <div class="card" >
 
  <div class="card-body">
    <h5 class="card-title">Java Programming Language</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-background-black text-black">Read More</a>
  </div>
</div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card" >
 
  <div class="card-body">
    <h5 class="card-title">Java Programming Language</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-background-black text-black">Read More</a>
  </div>
</div>
                </div>
                <div class="col-md-4">
                    <div class="card" >
 
  <div class="card-body">
    <h5 class="card-title">Java Programming Language</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-background-black text-black">Read More</a>
  </div>
</div>
                </div>
                <div class="col-md-4">
                    <div class="card" >
 
  <div class="card-body">
    <h5 class="card-title">Java Programming Language</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-background-black text-black">Read More</a>
  </div>
</div>
                </div>
            </div>
        </div>   
        
        <!<!-- java script -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

    </body>
</html>
