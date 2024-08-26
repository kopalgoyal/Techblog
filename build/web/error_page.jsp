<%-- 
    Document   : error_page
    Created on : 23-Jun-2024, 9:08:06 pm
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! Something went wrong...</title>
        
        
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
        <div class="container text-center mt-3" >
            <img src="img/browser.png" class="img-fluid" >
            <br>
            <h3 class="display-3"> Sorry! Something went wrong</h3>
            <br>
            <%= exception%>
            <a  href="index.jsp"class="btn primary-background btn-lg tex-white mt-3">Home</a>
            <br>
        </div>
    </body>
</html>
