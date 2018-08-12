<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

<style type="text/css">
.error{
	color:red
}
</style>

</head>
 
<body class="align">

  <div class="grid">

    <div id="login">
    

      <h2><span class="fontawesome-lock"></span>Sign In</h2>

      <form action="profile" method="post" model="user" accept-charset="utf-8">

        <fieldset>

          <p><label for="username">Username</label></p>
          <p><input type="username" id="username" name="username" placeholder="username"></p>
          <h5 class="error"> ${loginError} </h5>

          <p><label for="password">Password</label></p>
          <p><input type="password" id="password" name="password" placeholder="password"></p>

          <p><input type="submit" value="Sign In"></p>

        </fieldset>

      </form>

    </div> <!-- end login -->

  </div>
  
 

</body>	
</html>