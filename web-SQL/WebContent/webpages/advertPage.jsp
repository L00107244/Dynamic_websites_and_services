<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java_classes.Post_advert" %>
<%@ page import="java_classes.sign_up_backend" %>
<%@ page import="com.mysql.jdbc.Blob;" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buy Sell Repeat</title>
<link href="bbr.css" rel="stylesheet" type="text/css" media="screen"></head>
<body>

<div class = wrapper>

<div id = header>

<div id= logo>
<a href="http://localhost:8080/web-noSQL/webpages/index.jsp"><img src=Sample_photos/logo/main_logo.jpg></a>
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
  <input type="image" src="C:/Users/Lenovo/Desktop/web-site-mongo/web-noSQL/WebContent/webpages/Sample_photos/buttons/microphone.jpg" width="30" height="30"alt="Speech_navigation">
</form>
</div>
</div>

<div class= login>
<div id= heading>
<h2>Post an advert</h2>
<p>Please enter the item details below to post an item</p>
        <form method="post" action="" name="form2" id="my_sign-up_form">
          <ol>
            <li>
              <label for="itemName">Item name</label>
              <input type="text" name="itemName">
            </li>
            <li>
              <label for="condition">Condition</label>
              <input type="text" name="condition">
            </li>
            <li>
              <label for="description">Description</label>
              <input type="text" name="description">
            </li>
            <li>
              <label for="location">Location</label>
              <input type="text" name="locat">
            </li>
            <li>
              <label for="email">E-mail</label>
              <input type="text" name="email">
            </li>
            <li>
              <label for="phone">Phone Number</label>
              <input type="text" name="phoneNumber">
            </li>
            <li>
              <input class="submit" type="submit" name="Submit" value="Post">
            </li>
          </ol>
          <p>Already have an account? Login <a href='login.jsp'>here</a>.</p>          
       <script>
   function chooseFile() {
      $("#fileInput").click();
   }
</script>
   <%
   
   if (request.getParameter("Submit") != null) {
	    sign_up_backend signin = new sign_up_backend();
	    Post_advert pa = new Post_advert();
		String itemName = request.getParameter("itemName");  
		String condition = request.getParameter("condition");
        String description = request.getParameter("description");
        String location = request.getParameter("locat");
		String email = request.getParameter("email");
		String phone = request.getParameter("phoneNumber");
		int idin = signin.getid();
		pa.setSellerid(idin);
		System.out.println(idin);
		int sellid = pa.getSellerid();
		
	
		Post_advert addadvert = new Post_advert(itemName, condition, description, location, email, phone, sellid);
		int addStatus1 = Post_advert.add(addadvert);
		if(addStatus1==1) 
		{
			response.sendRedirect("userpage.jsp");
		}
   }

			
		%> 
		 </form>
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
<a href="http://www.facebook.com"><img src=Sample_photos/facebook.jpg width="50" height="50"></a>
<a href="http://www.twitter.com"><img src=Sample_photos/twitter.jpg width="50" height="50"></a>
</div>
</body>
</html>