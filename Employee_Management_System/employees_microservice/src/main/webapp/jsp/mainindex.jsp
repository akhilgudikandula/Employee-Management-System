<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Action Page</title>

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

       
        .center-container {
            background-color: #000; 
            padding: 40px;
            border-radius: 12px; 
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 380px;
            box-sizing: border-box;
        }

        h2 {
            color: #00bfff;
            font-size: 26px;
            margin-bottom: 30px;
        }

        
        button {
            padding: 12px 24px;
            margin: 10px;
            font-size: 16px;
            background-color: #00bfff; 
            border: none;
            border-radius: 8px;
            color: #000;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            width: 200px; 
        }

        button:hover {
            background-color: #00d4ff; 
            transform: translateY(-2px);
        }

        @media screen and (max-width: 480px) {
            .center-container {
                width: 90%; 
            }
            button {
                width: 90%; 
            }
        }
    </style>
</head>
<body>

    <div class="center-container">
        <h2>Choose an Action</h2>
        
        <button id="employeelist">Employee List</button> <br><br>
        <button id="login">Login</button>

        <script>
            document.getElementById("employeelist").addEventListener("click", function() {
                window.location.href = "/employee/employeelist";
            });

            document.getElementById("login").addEventListener("click", function() {
                window.location.href = "http://localhost:9292/log/login"; 
            });
        </script>
    </div>

</body>
</html>
