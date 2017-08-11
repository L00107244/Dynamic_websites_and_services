<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java_classes.adminSignUp" %>
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
  <input type="image" src= "Sample_photos/buttons/microphone.jpg"width="30" height="30"alt="Speech_navigation">
</form>
</div>
</div>
<div class= login>
<div id= heading>
<h2>Sign-up Admin</h2>
<p>Please enter the details of the new administrator below</p>
        <form method="post" action="" name="form2" id="my_sign-up_form">
          <ol>
            <li>
              <label for="username">username</label>
              <input type="text" name="un">
            </li>
            <li>
              <label for="aname">Name</label>
              <input type="text" name="name">
            </li>
             <li>
              <label for="department">Department</label>
              <input type="text" name="Depart">
            </li>
             <li>
              <label for="password">Password</label>
              <input type="password" name="pass">
            </li>
            <li>
              <input class="submit" type="submit" name="Submit" value="submit">
            </li>
          </ol>
          <p>Already have an account? Login <a href='login.jsp'>here</a>.</p>          
       
   <%
   
   if (request.getParameter("Submit") != null) {

		String username = request.getParameter("un");
		String name = request.getParameter("name");
		String department = request.getParameter("Depart");
        String password = request.getParameter("pass");
	
		adminSignUp addTest = new adminSignUp(username, name, department, password);
		int addStatus1 = adminSignUp.add(addTest);
		if(addStatus1==1) 
		{
			response.sendRedirect("login.jsp");
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
<a href="http://www.facebook.com"><img src=Sample_photos/icons/facebook.jpg width="50" height="50"></a>
<a href="http://www.twitter.com"><img src=Sample_photos/icons/twitter.jpg width="50" height="50"></a>
</div>
</body>
</html>