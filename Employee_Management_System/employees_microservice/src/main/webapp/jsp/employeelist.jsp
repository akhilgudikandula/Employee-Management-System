<%@ page import="java.util.List"%>

<script>
    function back() {
        window.location.href = "/employee/main";
    }
</script>

<%
    List<Object[]> list = (List<Object[]>) request.getAttribute("list");
    if (list != null && list.isEmpty()) {
%>
    <div class="center-container">
        <h3 style="color: #ff6347;">No employees found</h3>
    </div>
<%
    } else {
%>
    <div class="center-container">
        <h3 style="color: #00bfff;">Employee List</h3>
        
        <form method="post" action="/employee/searchby" style="margin-bottom: 20px;">
            <input type="text" name="searchData" placeholder="Enter search data" required style="padding: 8px; width: 100%; margin-bottom: 10px; border-radius: 8px; border: 2px solid #00bfff;">
            
            <select name="searchBy" required style="padding: 8px; width: 100%; margin-bottom: 10px; border-radius: 8px; border: 2px solid #00bfff;">
                <option value="" selected disabled>Select search criteria</option>
                <option value="Id">ID</option>
                <option value="Name">Name</option>
                <option value="Job">Job</option>
                <option value="Location">Location</option>
            </select>

            <button type="submit" style="padding: 10px 20px; background-color: #00bfff; color: black; border-radius: 8px; border: none; cursor: pointer; transition: background-color 0.3s ease;">
                Search
            </button>
        </form>

        <table border="1" style="width: 100%; border-collapse: collapse; margin-bottom: 20px;">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Job</th>
                <th>Location</th>
                <th>HireDate</th>
                <th>Salary</th>
            </tr>

            <% for(Object[] arr : list) { %>
                <tr>
                    <td><%= arr[0] %></td>
                    <td><%= arr[1] %></td>
                    <td><%= arr[2] %></td>
                    <td><%= arr[3] %></td>
                    <td><%= arr[4] %></td>
                    <td><%= arr[5] %></td>
                </tr>
            <% } %>
        </table>

        <button onclick="back()" style="padding: 10px 20px; background-color: #ff6347; color: white; border-radius: 8px; border: none; cursor: pointer; transition: background-color 0.3s ease;">
            Back
        </button>
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
        width: 80%;
        box-sizing: border-box;
    }

    h3 {
        font-size: 24px;
        margin-bottom: 20px;
    }

    
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }

    th, td {
        padding: 12px;
        text-align: left;
        border: 1px solid #ddd;
    }

    th {
        background-color: #00bfff;
        color: #000;
    }

    tr:nth-child(even) {
        background-color: #1a1a1a;
    }

    tr:hover {
        background-color: #333; 
    }

    button {
        padding: 10px 20px;
        margin-top: 10px;
        font-size: 16px;
        background-color: #00bfff;
        border: none;
        border-radius: 8px;
        color: black;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    button:hover {
        background-color: #00d4ff;
        transform: translateY(-2px);
    }

    @media screen and (max-width: 768px) {
        .center-container {
            width: 95%;
        }

        input, select, button {
            width: 100%;
        }
    }
</style>
