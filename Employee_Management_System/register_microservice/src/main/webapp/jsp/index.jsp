<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>

    
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

        .container:hover {
            transform: scale(1.05); 
        }

        h2 {
            color: #00bfff; 
            text-align: center;
            margin-bottom: 30px;
            font-size: 26px;
        }

        input[type="text"],
        input[type="email"],
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

        
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #00d4ff; 
            box-shadow: 0 0 8px rgba(0, 212, 255, 0.6);
            outline: none;
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

        .error-message i {
            margin-right: 5px;
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

       
        @media screen and (max-width: 480px) {
            .container {
                width: 90%;
            }
        }
    </style>

    <script>
        function validateForm(event) {
            document.getElementById("userNameError").innerText = "";
            document.getElementById("emailError").innerText = "";
            document.getElementById("passwordError").innerText = "";
            document.getElementById("confirmPasswordError").innerText = "";

            var userName = document.getElementById("userName").value;
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            var passwordPattern = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

            var isValid = true;

           
            if (userName === "") {
                document.getElementById("userNameError").innerHTML = "<i class='fas fa-exclamation-triangle'></i> * Username cannot be empty";
                isValid = false;
            }

            if (email === "") {
                document.getElementById("emailError").innerHTML = "<i class='fas fa-exclamation-triangle'></i> * Email cannot be empty";
                isValid = false;
            }

            if (!passwordPattern.test(password)) {
                document.getElementById("passwordError").innerHTML = "<i class='fas fa-exclamation-triangle'></i> * Password must be at least 8 characters, include an uppercase letter, a number, and a special character.";
                isValid = false;
            }

            if (password !== confirmPassword) {
                document.getElementById("confirmPasswordError").innerHTML = "<i class='fas fa-exclamation-triangle'></i> * Passwords must match";
                isValid = false;
            }

            if (!isValid) {
                event.preventDefault();
            }
        }

        function clearErrorMessage(inputId, errorId) {
            document.getElementById(errorId).innerText = "";
        }
    </script>

</head>
<body>
	

    <div class="container">
        <h2>Registration Form</h2>
        <form method="post" action="/registeremp" onsubmit="validateForm(event)">
            
            <div>
                <label for="userName">Username:</label>
                <input type="text" name="userName" id="userName" placeholder="Enter username" 
                       oninput="clearErrorMessage('userName', 'userNameError')">
                <p id="userNameError" class="error-message"></p>
                <% 
                    String userNameErrorMessage = (String) request.getAttribute("userNameErrorMessage");
                    if (userNameErrorMessage != null && !userNameErrorMessage.isEmpty()) {
                %>
                    <p style="color:red;"><%= userNameErrorMessage %></p>
                <% } %>
            </div>

            <div>
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" placeholder="Enter email" 
                       oninput="clearErrorMessage('email', 'emailError')">
                <p id="emailError" class="error-message"></p>
                <% 
                    String emailErrorMessage = (String) request.getAttribute("emailErrorMessage");
                    if (emailErrorMessage != null && !emailErrorMessage.isEmpty()) {
                %>
                    <p style="color:red;"><%= emailErrorMessage %></p>
                <% } %>
            </div>

            <div>
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" placeholder="Enter password"
                       oninput="clearErrorMessage('password', 'passwordError')">
                <p id="passwordError" class="error-message"></p>
            </div>

            <div>
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm password"
                       oninput="clearErrorMessage('confirmPassword', 'confirmPasswordError')">
                <p id="confirmPasswordError" class="error-message"></p>
            </div>

            <input type="submit" value="Register"><br><br>

            <a href="http://localhost:9292/log/login">Already have an account? Login</a>
        </form>
    </div>

</body>
</html>
