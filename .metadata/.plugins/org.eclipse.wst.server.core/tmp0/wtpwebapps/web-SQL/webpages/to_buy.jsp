<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java_classes.Post_advert" %>
<%@ page import="java.util.ArrayList" %>
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
<div id= microphone_op>
<form method="post" action="" name="form2" id="my_sign-up_form">
<ol>
<li>
  <input class="submit" type="image" src="Sample_photos/buttons/microphone.jpg" name="speech_nav" value="speech_nav" width="30" height="30"alt="Speech_navigation">
</li>
</ol>
</div>
</div>

<div class= search>
<div id= searhBar>
<p><b>Refine<b></b></p>
</div>
<div id= searchBoxes>
 <form method="post" action="" name="form2" id="my_sign-up_form">
          <ol>
            <li>
              <label for="itemName"></label>
              <input type="text" name="itemName">
            </li>
            <li>
             <select name="searchOption1">
             <option value="select">please select</option>
             <option value="House_Hold">House Hold</option>
             <option value="Motor">Motor</option>
             <option value="technology">technology</option>
             <option value="Animals">Animals</option>
             </select>
            </li>
            <li>
              <select name="search_option2">
              <option value="select">please select</option>
              <option value="Ulster">Ulster</option>
              <option value="Munster">Munster</option>
              <option value="Leinster">Leinster</option>
              <option value="Connacht">Connacht</option>
              </select>
            </li>
            <li>
              <input class="submit" type="submit" name="Submit" value="Search">
            </li>
          </ol>
          <%
          if(request.getParameter("Submit")!= null)
          {
        	  String SearchName = request.getParameter("itemName");
        	  String cateSearch = request.getParameter("searchOption1" );
        	  String provenceSearch = request.getParameter("search_option2");
        	  ArrayList array = new ArrayList();
        	  Post_advert search = new Post_advert();
  			  array = search.SearchByWords(SearchName, cateSearch, provenceSearch);
              
  			for(final Object p:array){
				out.println(p.toString());
				%>
				<a href ="MessageSeller.jsp">Contact Seller</a><br>
				<%

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