<%@ page import="com.project.employee.model.Employee" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<script>
    function back() {
        window.location.href = "/employee/adminemployeelist";
    }
</script>

<%
    Employee employee = (Employee) request.getAttribute("employee");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String formattedHireDate = (employee.getEmpHireDate() != null) ? sdf.format(employee.getEmpHireDate()) : "";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee</title>

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
            padding: 20px 40px; 
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 500px; 
            max-width: 100%; 
            box-sizing: border-box;
            transition: transform 0.3s ease;
        }

        h2 {
            color: #00bfff; 
            text-align: center;
            margin-bottom: 20px;
            font-size: 26px;
        }

        .form-group {
            margin-bottom: 10px; 
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .form-group span {
            font-size: 16px;
            color: #fff;
            margin-bottom: 5px; 
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 2px solid #00bfff; 
            border-radius: 8px;
            font-size: 14px;
            background-color: #1a1a1a; 
            color: #fff;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-group input:focus {
            border-color: #00d4ff;
        }

        .form-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 15px; 
        }

        .form-actions input[type="submit"],
        .form-actions button {
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

        .form-actions input[type="submit"]:hover,
        .form-actions button:hover {
            background-color: #00d4ff;
            transform: translateY(-2px);
        }

        .form-actions button {
            background-color: #ff6347;
        }

        .form-actions button:hover {
            background-color: #ff4500;
        }

        @media screen and (max-width: 768px) {
            .container {
                width: 90%; 
                padding: 20px; 
            }
            .form-actions {
                flex-direction: column;
                align-items: center;
            }
            .form-actions input[type="submit"],
            .form-actions button {
                width: 100%;
                margin: 5px 0;
            }
        }
    </style>
</head>

<body>

    <div class="container">
        <h2>Edit Employee</h2>
        <form method="post" action="/employee/editemployee">
            
            <div class="form-group">
                <span>Employee Id:</span>
                <input type="number" readonly name="empId" value="<%= employee.getEmpId() %>">
            </div>

            <div class="form-group">
                <span>Employee Name:</span>
                <input type="text" name="empName" value="<%= employee.getEmpName() %>">
            </div>

            <div class="form-group">
                <span>Employee Job:</span>
                <input type="text" name="empJob" value="<%= employee.getEmpJob() %>">
            </div>

            <div class="form-group">
                <span>Employee Location:</span>
                <input type="text" name="empLocation" value="<%= employee.getEmpLocation() %>">
            </div>

            <div class="form-group">
                <span>Employee Hire Date:</span>
                <input type="date" name="empHireDate" value="<%= formattedHireDate %>">
            </div>

            
            <div class="form-group">
                <span>Employee Salary:</span>
                <input type="number" name="empSalary" value="<%= employee.getEmpSalary() %>">
            </div>

            
            <div class="form-actions">
                <input type="submit" value="Edit">
                <button type="button" onclick="back()">Back</button>
            </div>
        </form>
    </div>

</body>
</html>
