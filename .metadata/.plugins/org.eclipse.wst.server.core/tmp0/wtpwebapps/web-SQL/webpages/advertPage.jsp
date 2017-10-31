<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java_classes.Post_advert" %>
<%@ page import="java_classes.sign_up_backend" %>
<%@ page import="edu.cmu.sphinx.api.Configuration" %>
<%@ page import="edu.cmu.sphinx.api.LiveSpeechRecognizer"%>
<%@ page import="edu.cmu.sphinx.api.SpeechResult" %>
<%@ page import="edu.cmu.sphinx.result.WordResult" %>

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
<form method="post" action="" name="form2" id="my_sign-up_form">
<ol>
<li>
  <input class="submit" type="image" src="Sample_photos/buttons/microphone.jpg" name="speech_nav" value="speech_nav" width="30" height="30"alt="Speech_navigation">
</li>
</ol>
</div>
</div>

<div class= login>
<div id= heading>
<h2>Post an advert</h2>
<p>Please enter the item details below to post an item</p>
 
<div id="gp_converted"></div>
        <form method="post" action="" name="form2" id="my_sign-up_form">
          <ol>
            <li>
              <label for="itemName">Item name</label>
              <input type="text" name="itemName">
            </li>
            <li>
            <label for="catergory">Condition</label>
             <select name="searchOption3">
             <option value="select">please select</option>
             <option value="new">new</option>
             <option value="used">used</option>
             <option value="worn">worn</option>
             <option value="repair">needs repair</option>
             </select>
            </li>
            <li>
              <label for="description">Description</label>
              <input type="text" name="description">
            </li>
            <li>
              <label for="location">location</label>
              <select name="search_option2">
              <option value="select">please select</option>
              <option value="Ulster">Ulster</option>
              <option value="Munster">Munster</option>
              <option value="Leinster">Leinster</option>
              <option value="Connacht">Connacht</option>
              </select>
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
            <label for="catergory">Category</label>
             <select name="searchOption1">
             <option value="select">please select</option>
             <option value="House_Hold">House Hold</option>
             <option value="Motor">Motor</option>
             <option value="technology">technology</option>
             <option value="Animals">Animals</option>
             </select>
            </li>
            <li>
              <label for="cost">price</label>
              <input type="text" name="price">
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
<div class="converter">
<h2>Currency converter</h2>
<p> in order to convert the currency please enter the amount in the box below<br>
then choose the currency options and click convert</p>
<script src="http://www.google.com/jsapi"></script>
<script src="http://www.geoplugin.net/javascript.gp" type="text/javascript"></script>
<script src="http://www.geoplugin.net/ajax_currency_converter.gp"></script>

<input type='text' id='gp_amount' size='4' /> 
<select id="gp_from"></select> 

<select id="gp_to"></select>
<p><input type='button' onClick='gp_convertIt()' value = 'Convert It' /></p>
<script>gp_currencySymbols()</script>
</div>
   <%
   
   if (request.getParameter("Submit") != null) {
	    sign_up_backend signin = new sign_up_backend();
	    Post_advert pa = new Post_advert();
		String itemName = request.getParameter("itemName");  
		String condition = request.getParameter("search_option3");
        String description = request.getParameter("description");
        String location = request.getParameter("search_option2" );
        String email = request.getParameter("email");
		String phone = request.getParameter("phoneNumber");
		String cate = request.getParameter("searchOption1" );
		String price = request.getParameter("price");
		double value = Double.parseDouble(price);
		int idin = signin.getid();
		pa.setSellerid(idin);
		System.out.println(idin);
		int sellid = pa.getSellerid();
		
	
		Post_advert addadvert = new Post_advert(itemName, condition, description, location, email, phone, sellid, cate, value);
		int addStatus1 = Post_advert.add(addadvert);
		if(addStatus1==1) 
		{
			response.sendRedirect("userpage.jsp");
		}
   }
   else if(request.getParameter("speech_nav")!=null)
   {
 		System.out.println("speek into the microphone");
 	    Configuration configer = new Configuration();


     	configer.setAcousticModelPath("resource:/edu/cmu/sphinx/models/en-us/en-us");
     	configer.setDictionaryPath("resource:/edu/cmu/sphinx/models/en-us/cmudict-en-us.dict");
     	configer.setLanguageModelPath("resource:/edu/cmu/sphinx/models/en-us/en-us.lm.bin");
    
     	LiveSpeechRecognizer reco = new LiveSpeechRecognizer(configer);
     	reco.startRecognition(true);
     	SpeechResult results = reco.getResult();
     
     	reco.stopRecognition();
     	String result = results.getHypothesis();
         System.out.println("results are "+result);
         
         if(result.contains("index") || result.contains("home")|| result.contains("home page"))
         {
         	response.sendRedirect("index.jsp");
         }
         else if(result.contains("for sale") || result.contains("buying page")|| result.contains("for sale page"))
         {
         	response.sendRedirect("to_buy.jsp");
         }
         else if(result.contains("contact") || result.contains("contact details")|| result.contains("inquiry page"))
         {
         	response.sendRedirect("contact.jsp");
         }
         else if(result.contains("sign up") || result.contains("sign up page")|| result.contains("join site"))
         {
         	response.sendRedirect("sign-up.jsp");
         }
         else if(result.contains("login") || result.contains("logon")|| result.contains("login page") || result.contains("logon page"))
         {
         	response.sendRedirect("login.jsp");
         }
         else
         {
         	out.println("Sorry i did not understand, please click the button to try again");
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