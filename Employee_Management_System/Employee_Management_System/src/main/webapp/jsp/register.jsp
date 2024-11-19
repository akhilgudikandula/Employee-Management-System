
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP Example</title>
    <!-- You can add external CSS or JS links here -->
	
	<script type="text/javascript">
		function validateForm(event) {
			var userName=document.getElementById("userName").value;
			var email = document.getElementById("email").value;
			var password = document.getElementById("password").value;
			var confirmPassword = document.getElementById("confirmPassword").value;
			var passwordPattern = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
			if(userName === "")
			{
				document.getElementById("p1").innerText = "* user name cannot be empty";
				event.preventDefault();
			}else {
				document.getElementById("p1").innerText = "";
			}
			if(email === "")
			{
				document.getElementById("p2").innerText="* user name cannot be empty";
				event.preventDefault();
			}else {
							document.getElementById("p2").innerText = "";
						}
			if(!passwordPattern.test(password))
			{
				document.getElementById("p3").innerText = "* Password must be at least 8 characters, contain uppercase, lowercase, a digit, and a special character.";
				event.preventDefault();
			}else {
							document.getElementById("p3").innerText = "";
						}
			if(password != confirmPassword){
				
				document.getElementById("p4").innerText="* must be same as Password";
				event.preventDefault();
			}
			
		}
	</script>
	
</head>
<body>
	<h3>Registration Form</h3>

	<form method="post" action ="/registeremp" onsubmit = "validateForm(event)">
		<input type="text" name="userName" id="userName" placeholder="enter username"><br><br>
		<p id = "p1" style="color:red;" ></p>
		<% 
		           String userNameErrorMessage = (String) request.getAttribute("userNameErrorMessage");
		           if (userNameErrorMessage != null && !userNameErrorMessage.isEmpty()) { 
		       %>
		           <p style="color:red;"><%= userNameErrorMessage %></p>
		       <% 
		           }
		       %>
		<input type="email" name="email" id="email" placeholder="enter email"><br><br>
		<p id="p2" style="color:red;"></p>
		<%
		     String emailErrorMessage = (String) request.getAttribute("emailErrorMessage");
			 if(emailErrorMessage != null && !emailErrorMessage.isEmpty()) {
		%>
		    <p style = "color:red;"><%=emailErrorMessage %></p>
		<%
			 }
		%>
		<input type="password" name="password" id="password" placeholder="enter password"><br><br>
		<P id="p3" style="color:red;"></p>
		<input type="password" name="confirmPassword" id="confirmPassword" placeholder="confirm password">
		<P id="p4" style="color:red;"></p>
		<button type="reset">reset</button>
		<button type="submit">Submit</button>
		
	</form>
</body>
</html>
