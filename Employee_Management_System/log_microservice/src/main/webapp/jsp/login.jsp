<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #fff;
            overflow: hidden;
        }

        .container {
            background-color: #000;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 380px;
            box-sizing: border-box;
            position: relative;
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        h2 {
            color: #00bfff;
            text-align: center;
            margin-bottom: 30px;
            font-size: 26px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 2px solid #00bfff;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
            background-color: #1a1a1a;
            color: #fff;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            border: none;
            background-color: #00bfff;
            color: #000;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #00d4ff;
            transform: translateY(-2px);
        }

        .error-message {
            color: #e74c3c;
            font-size: 12px;
            margin: 5px 0 0 0;
            padding: 0;
            font-weight: bold;
        }

        a {
            color: #00bfff;
            text-decoration: none;
            font-size: 14px;
            display: block;
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #00d4ff;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .button-container button {
            width: 48%;
            padding: 12px;
            background-color: #00bfff;
            border-radius: 8px;
            color: #000;
            font-size: 16px;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .button-container button:hover {
            background-color: #00d4ff;
            transform: translateY(-2px);
        }

        .button-container button.back-button {
            background-color: #ff6347;
        }

        .button-container button.back-button:hover {
            background-color: #ff4500;
        }
    </style>
<%
String userNameErrorMessage = (String) request.getAttribute("userNameErrorMessage");
String passwordErrorMessage = (String) request.getAttribute("passwordErrorMessage");
%>
<script>
    function action(event) {
        event.preventDefault();
        window.location.href = "http://localhost:9393/employee/main";
    }

    function validateForm(event) {
        document.getElementById("userNameError").innerText = "";
        document.getElementById("passwordError").innerText = "";

        var userName = document.getElementById("userName").value;
        var password = document.getElementById("password").value;

        var isValid = true;

        if (userName === "") {
            document.getElementById("userNameError").innerHTML = "<i class='fas fa-exclamation-triangle'></i> * Username cannot be empty";
            isValid = false;
        }

        if (password === "") {
            document.getElementById("passwordError").innerHTML = "<i class='fas fa-exclamation-triangle'></i> * Password cannot be empty";
            isValid = false;
        }

        if (!isValid) {
            event.preventDefault();
        }
    }

    function clearErrorMessage(inputId, errorId) {
        document.getElementById(errorId).innerText = "";
    }

    function clearAllErrorMessages() {
        document.getElementById("userNameError").innerText = "";
        document.getElementById("passwordError").innerText = "";
    }
</script>

</head>
<body>

    <div class="container">
        <h2>Login Form</h2>
		<form method="post" action="/log/loginuser" onsubmit="validateForm(event)">
		    <div>
		        <label for="userName">Username:</label>
		        <input type="text" name="userName" id="userName" placeholder="Enter username" 
		               oninput="clearAllErrorMessages()">
		        <p id="userNameError" class="error-message"></p>
		        <%
		            if(userNameErrorMessage != null && !userNameErrorMessage.isEmpty()){
		        %>
		            <p id="userNameError" class="error-message"><%= userNameErrorMessage %></p>
		        <%
		            }
		        %>
		    </div>

		    <div>
		        <label for="password">Password:</label>
		        <input type="password" name="password" id="password" placeholder="Enter password" 
		               oninput="clearAllErrorMessages()">
		        <p id="passwordError" class="error-message"></p>
		        <%
		            if(passwordErrorMessage != null && !passwordErrorMessage.isEmpty()){
		        %>
		            <p id="passwordError" class="error-message"><%= passwordErrorMessage %></p>
		        <%
		            }
		        %>
		    </div>

		    <input type="submit" value="Login">
		</form>


        <div class="button-container">
            <button type="button" onclick="action(event)" class="back-button">Back</button>
        </div>
        <a href="http://localhost:9191/index">Don't have an account?</a>
    </div>

</body>
</html>
