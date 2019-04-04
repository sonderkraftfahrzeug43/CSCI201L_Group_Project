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
	<div class = nav>
			<h1 class = center_p>Schedule Builder</h1>
			<form method="POST" action="Login">
            <center>
            <table border="1" cellpadding="5" cellspacing="2" >
                <tbody>
                    <tr>
                        <td style="color: black;">Username:</td>
                        <td ><input type="text" name="username" required/></td>
                    </tr>
                    	
                    <tr>
                        <td style="color: black;">Password:</td>
                        <td><input type="password" name="password" required/></td>
                    </tr>
                    	<div><%= wpError  %></div>
                    	<div><%= nuError %></div>
                    <tr>
                        <td colspan="2" align="center">
                        	<a href="registration.jsp"">Don't have an account? Click here to register!</a>
                        </td>                        
                    </tr>  
                    <tr>
                        <td colspan="2" align="center"><input type="submit" name="submit" value="Login" />
                            &nbsp;&nbsp;
                            <input type="reset" value="Reset" />
                        </td>                        
                    </tr>  
                    <tr>
                        <td colspan="2" align="center">
                        	<a href="main.jsp"">Or click here to continue anonymously!</a>
                        </td>                        
                    </tr>                   
                </tbody>
            </table>
            </center>
        </form>
	</div>
</body>
</html>