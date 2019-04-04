<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String utError = (String)request.getAttribute("utError");
	if(utError == null || utError.trim().length()==0) {
		utError = " ";
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

<!-- head -->
<head>

<meta charset="UTF-8">

<!-- title -->
<title>Registration</title>


<!-- linking CSS -->
<link rel="stylesheet" type="text/css" href="registration.css" />
</head>

<!-- body -->
<body>

	<!-- background image -->
	<div class="background-img"></div>

	<!-- City search -->
	<div class = nav>
			<h1 class = center_p>Schedule Builder</h1>
			<form method="POST" action="Register">
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
                    <tr>
                        <td style="color: white; font-size: 30px;">Confirm:</td>
                        <td><input type="password" name="password" style="width:200px;" required/></td>
                    </tr>

                    <tr>
                        <td colspan="2" align="center"><input type="submit" name="submit" value="Register" />
                            &nbsp;&nbsp;
                            <input type="reset" value="Clear" />
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

	<!-- Display All -->
	<!-- <form action="MyServlet" method="GET">
		<button type="submit" class="displayAll" name="displayAll">Display All</button>
	</form>-->
	
</body>
</html>