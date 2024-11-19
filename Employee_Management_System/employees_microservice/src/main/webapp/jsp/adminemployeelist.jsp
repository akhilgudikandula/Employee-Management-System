<%@ page import="java.util.List"%>
<%@ page import="com.project.employee.model.Employee"%>
<div class="center-container">
<center>

<h3 id="employeeListTitle">Employee List</h3>
<form method="post" action="/employee/add" id="addEmployeeForm">
    <div class="form-row">
        <span class="form-group">
            <input type="number" name="empId" required placeholder="id">
        </span>
        <span class="form-group">
            <input type="text" name="empName" required placeholder="name">
        </span>
        <span class="form-group">
            <input type="text" name="empJob" required placeholder="job">
        </span>
        <span class="form-group">
            <input type="text" name="empLocation" required placeholder="location">
        </span>
        <span class="form-group">
            <input type="date" name="empHireDate" required placeholder="hiredate">
        </span>
        <span class="">
            <input type="number" name="empSalary" required placeholder="salary">
        </span>
        <span class="">
            <button type="submit">Add</button>
        </span>
    </div>
</form>
<p id="error" style="color:red;"></p>

<%
long userId = (Long) session.getAttribute("userId");
String empIdErrorMessage = (String) request.getAttribute("empIdErrorMessage");
if (empIdErrorMessage != null && !empIdErrorMessage.isEmpty()) {
%>
<p id="p1" style="color:red;"><%= empIdErrorMessage %></p>
<%
}
%>

<button id="logOut">LogOut</button>

<script>
    document.getElementById("logOut").addEventListener("click",function() {
        window.location.href="/employee/logout";
    });
    
    function editEmployee(empId, adminId) {
        var userId = <%= userId %>;
        if (adminId === userId) {
            window.location.href = "/employee/edit/" + empId;
        } else {
            document.getElementById("error").innerText = "*you're not authorised to edit this user";
        }
    }
    
    function deleteEmployee(empId, adminId) {
        var userId = <%= userId %>;
        if (adminId === userId) {
			var confirmDelete = confirm("Are you sure you want to delete this employee?");
			if (confirmDelete) {
				 window.location.href = "/employee/delete/" + empId;
			   }
            
        } else {
            document.getElementById("error").innerText = "*you're not authorised to delete this user";
        }
    }
</script>

</center>

<%
    List<Employee> list = (List<Employee>) request.getAttribute("list");
    if (list == null || list.isEmpty()) {
%>
        <center>
            <h3 style="color:red;">No employees found</h3>
        </center>
<%
    } else {
%>
        <center>
            <table border="1" id="employeeTable">
                <tr>
                    <th>Id</th>
                    <th>AdminId</th>
                    <th>Name</th>
                    <th>Job</th>
                    <th>Location</th>
                    <th>Hire Date</th>
                    <th>Salary</th>
                    <th>Actions</th>
                </tr>
                
                <%
                for (Employee emp : list) {
                %>
                    <tr>
                        <td><%= emp.getEmpId() %></td>
                        <td><%= emp.getAdminId() %></td>
                        <td><%= emp.getEmpName() %></td>
                        <td><%= emp.getEmpJob() %></td>
                        <td><%= emp.getEmpLocation() %></td>
                        <td><%= emp.getEmpHireDate() %></td>
                        <td><%= emp.getEmpSalary() %></td>
                        <td class="action-buttons">
                            <input type="button" value="Edit" class="actionButton" onclick="editEmployee(<%= emp.getEmpId() %>, <%= emp.getAdminId() %>)">
                            <input type="button" value="Delete" class="actionButton" onclick="deleteEmployee(<%= emp.getEmpId() %>, <%= emp.getAdminId() %>)">
                        </td>
                    </tr>
                <%
                }
                %>
            </table>
        </center>
		</div>
<%
    }
%>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        min-height: 100vh;
        color: white;
        padding-left: 40px;
        padding-right: 40px;
    }
	.center-container {
	    background-color: #000;
	    padding: 40px 20px;
	    border-radius: 12px;
	    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	    text-align: center;
	    width: 90%;
	    max-width: 1400px;
	    box-sizing: border-box;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	}

    h3 {
        font-size: 24px;
        margin-bottom: 20px;
    }

    #employeeListTitle {
        color: #00bfff;
    }

    #addEmployeeForm {
        margin-bottom: 20px;
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        gap: 10px;
        margin-left: auto;
        margin-right: auto;
    }

    .form-row {
        display: flex;
        justify-content: center;
        gap: 10px;
        flex-wrap: wrap;
        align-items: center;
        width: 100%;
    }

    .form-group {
        display: inline-block;
        flex: 1;
        margin: 5px;
        min-width: 150px;
    }

    input, button {
        padding: 10px;
        width: 100%;
        border-radius: 8px;
        border: 2px solid #00bfff;
    }

    button {
        background-color: #00bfff;
        color: black;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    button:hover {
        background-color: #00d4ff;
        transform: translateY(-2px);
    }

    #employeeTable {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        table-layout: fixed;
        margin-left: auto;
        margin-right: auto;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ddd;
    }

    th {
        background-color: #1e3c72;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #1a1a1a;
    }

    tr:hover {
        background-color: #333;
    }

    td.action-buttons {
        display: flex;
        justify-content: space-around;
    }

    td input[type="button"] {
        background-color: #ff6347;
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        padding: 5px 10px;
        font-size: 12px;
        margin: 0 5px;
    }

    td input[type="button"]:hover {
        background-color: #e04e3a;
    }

    #logOut {
        padding: 10px 20px;
        background-color: #ff6347;
        color: white;
        font-size: 16px;
        border-radius: 8px;
        border: none;
        cursor: pointer;
        margin-top: 20px;
        width: auto;
        display: inline-block;
    }

    #logOut:hover {
        background-color: #e04e3a;
    }

    p {
        font-size: 14px;
        margin-top: 10px;
    }

    @media screen and (max-width: 768px) {
        table, form {
            width: 90%;
        }

        input, button {
            width: 100%;
        }

        td input[type="button"] {
            width: 100%;
        }

        td.action-buttons {
            flex-direction: column;
            align-items: center;
        }

        .form-group {
            min-width: 100%;
        }
    }
</style>
