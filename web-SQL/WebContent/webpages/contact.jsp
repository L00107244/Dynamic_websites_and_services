<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java_classes.AdminContact" %>
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
<h2>Contact Us</h2>
<p>Please fill out the details in regards to your inquiry</p>
        <form method="post" action="" name="form2" id="my_sign-up_form">
          <ol>
             <li>
              <select name="DepartmentOption1">
                <option value="select">Department</option>
                <option value="Sales">Sales</option>
                <option value="Customer Service">Customer Service</option>
                <option value="Tech Support">Tech support</option>
               </select>
            </li>
             <li>
              <label for="message">Message</label>
              <input type="text" name="message">
            </li>
            <li>
              <input class="submit" type="submit" name="send" value="submit">
            </li>
          </ol>   
          <%
          if(request.getParameter("send")!= null)
          {
        	  String Department = request.getParameter("DepartmentOption1");
        	  String message = request.getParameter("message");
        	  
        	  AdminContact adminC = new AdminContact(Department, message);
        	  int status = AdminContact.add(adminC);
        	  if(status == 1)
        	  {
        		  System.out.println("Message Sent");
        	  }
        	  else
        		  System.out.println("eror");
        	  
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