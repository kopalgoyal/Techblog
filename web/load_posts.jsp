


<%@page import="com.tech.blog.entities1.User"%>
<%@page import="com.tech.blog.daoo.Likedao"%>
<%@page import="com.tech.blog.entities1.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.daoo.Postdao"%>
<div class="row">
<%
    User uuu=(User)session.getAttribute("currentUser");
    Thread.sleep(1000);
    Postdao d=new Postdao(ConnectionProvider.getConnection());
    int cid=Integer.parseInt(request.getParameter("cid"));
    List<Post> posts=null;
    if(cid==0){
    posts=d.getAllPost();
    }else{
    posts=d.getPostByCatId(cid);
    }
    
    if(posts.size()==0){
    out.println("<h3 class='display-3 text-center'>no post in this category</h3>");
    return ;
    }
    for(Post p:posts)
    {
    %>
    
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%=p.getpTitle()%></b>
                <p><%=p.getpContent()%></p>
                <p><%=p.getpCode()%></p>
                
            </div>
                <div class="card-footer bg-primary text-center">
                 <%
                              Likedao ld=new Likedao(ConnectionProvider.getConnection());
                              
                          %>
                      
  <a href="#!" onclick="doLike(<%=p.getPid()%>,<%=uuu.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>  
                
                    
      
                    <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More</a>
                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
                </div>
        </div>
    </div>
    <%
    }
    
%>
</div>