<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<div id= microphone_op>
<form action="/action_page.php">
  <input type="image" src="Sample_photos/buttons/microphone.jpg" width="30" height="30"alt="Speech_navigation">
</form>
</div>
</div>

</div>

<div class= search>
<div id= searhBar>
<p><b>Refine<b></b></p>
</div>
<div id= searchBoxes>
<form action="/action_page.php">
<input type="text" name="search1" value="enter_name">
<select>
  <option value="select">please select</option>
  <option value="house">House Hold</option>
  <option value="cars">Motor</option>
  <option value="tech">technology</option>
  <option value="animals">Animals</option>
</select>
<select>
  <option value="select">please select</option>
  <option value="house">Ulster</option>
  <option value="cars">Munster</option>
  <option value="tech">Leinster</option>
  <option value="animals">Connacht</option>
</select><br>
<input type="submit" value="Submit">
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