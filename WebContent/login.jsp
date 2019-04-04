<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String wpError = (String)request.getAttribute("wpError");
	String nuError = (String)request.getAttribute("nuError");
	if(wpError == null || wpError.trim().length()==0) {
		wpError = " ";
	}
	if(nuError == null || nuError.trim().length()==0) {
		nuError = " ";
	}
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	if(username == null || username.trim().length()==0)
	{
		username = " ";
	}
	if(password == null || password.trim().length()==0)
	{
		password = " ";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!-- linking CSS -->
<link rel="stylesheet" type="text/css" href="login.css" />
</head>
<body>
<!-- background image -->
	<div class="background-img"></div>
	<div class = nav>
			<h1 class = center_p>Schedule Builder</h1>
			<form method="POST" action="Login">
            <center>
            <table class = table>
                <tbody>
                    <tr>
                        <td style="color: white; font-size: 30px">Username:</td>
                        <td ><input type="text" name="username" style="width:200px;" required/></td>
                    </tr>
                    	
                    <tr>
                        <td style="color: white; font-size: 30px;">Password:</td>
                        <td><input type="password" name="password" style="width:200px;" required/></td>
                    </tr>
                    	<div><%= wpError  %></div>
                    	<div><%= nuError %></div>
                    <tr>
                        <td colspan="2" align="center">
                        	<a href="registration.jsp" style="font-size: 20px">Don't have an account? Click here to register!</a>
                        </td>                        
                    </tr>  
                    <tr>
                        <td colspan="2" align="center"><input id="button1" type="submit" name="submit" value="Login" />
                            &nbsp;&nbsp;
                            <input id="button2" type="reset" value="Clear" />
                        </td>                        
                    </tr>  
                    <tr>
                        <td colspan="2" align="center">
                        	<a href="main.jsp" style="font-size: 20px">Or click here to continue anonymously!</a>
                        </td>                        
                    </tr>                   
                </tbody>
            </table>
            </center>
        </form>
	</div>
</body>
</html>