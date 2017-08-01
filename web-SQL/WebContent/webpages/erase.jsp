<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java_classes.Post_advert" %>
<%@ page import="java_classes.sign_up_backend" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buy Sell Repeat</title>
<link href="bbr.css" rel="stylesheet" type="text/css" media="screen"></head>
<body>

<div class = wrapper>

<div id = header>

<div id= logo>
<a href="http://localhost:8080/web-SQL/webpages/index.jsp"><img src= "Sample_photos/logo/main_logo.JPG"></a>
<div id = Quote>
<link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
<p>Buy or sell anything at a price that suits you</p>
</div>
</div>

<div id= links>
<li class="active"><a href='index.jsp'><span>Home</span></a></li>
<li class="active"><a href='to_buy.jsp'><span>For sale</span></a></li>
<li class="active"><a href='login.jsp'><span>Login</span></a></li>
<li class="active"><a href='contact.jsp'><span>Contact</span></a></li>
</div>

</div>
<div id= microphone_op>
<form action="/action_page.php">
  <input type="image" src="Sample_photos/buttons/microphone.jpg" width="30" height="30"alt="Speech_navigation">
</form>
</div>
</div>
<div class= login>
<div id= heading>
<h2>Erase a record</h2>
<p>Please enter the ID of the item you wish to remove</p>
        <form method="post" action="" name="form2" id="my_sign-up_form">
          <ol>
            <li>
              <label for="id">ID: </label>
              <input type="text" name="idin">
            </li>
            <li>
              <input class="submit" type="submit" name="delete" value="delete">
            </li>
          </ol>
          <p>Go back to the main menu by clicking <a href='userpage.jsp'>here</a>.</p> 
             <%

     	    sign_up_backend signin = new sign_up_backend();
     	    Post_advert pa = new Post_advert();
     	    int idin = signin.getid();
     	    pa.setSellerid(idin);
     	    int sellid = pa.getSellerid();
   			Post_advert SearchRec = Post_advert.getAdvertsByID(sellid);
  
   			out.println("item id: "+SearchRec.getID() + " \t" +
   					"Name: "+SearchRec.getName()+ " \t" +
   					"Condition: "+SearchRec.getCondition() + " \t" +
   					"Description: "+SearchRec.getDescription());
       
   			if (request.getParameter("delete") != null)
   			{
   		
   			String number = request.getParameter("idin"); 
   			int result = Integer.parseInt(number);
   			int delete = pa.delete(result);
   			
   		
   			}
          
            
		%> 

</div>
</div>

<div class = footer>
<div id= contact>
<h5> Contact</h5>
<p>Email: info@buildbuyrepeat.com</p>
<p>Phone: 1234567891</P>
</p>
</div>

<div id= web_links>
<a href="http://www.facebook.com"><img src=Sample_photos/icons/facebook.jpg width="50" height="50"></a>
<a href="http://www.twitter.com"><img src=Sample_photos/icons/twitter.jpg width="50" height="50"></a>
</div>
</body>
</html>