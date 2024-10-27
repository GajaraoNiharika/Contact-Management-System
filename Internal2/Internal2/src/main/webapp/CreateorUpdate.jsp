<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search and Update Contact</title>
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f8f9fa;
            color: #333;
        }

        h2 {
            color: #007bff;
            text-align: center;
        }

        /* Centering container */
        .container {
            display: flex;
            flex-direction: column;
            align-items: center; /* Center items horizontally */
            justify-content: center; /* Center items vertically */
            min-height: 80vh; /* Ensure minimum height for vertical centering */
        }

        /* Form styling */
        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 20px auto;
            width: 100%; /* Responsive width */
        }

        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 4px;
            border: 1px solid #ddd;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Message styling */
        .success,
        .error {
            padding: 10px;
            margin: 10px auto;
            border-radius: 5px;
            max-width: 400px;
            text-align: center;
        }

        .success {
            color: #28a745;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
        }

        .error {
            color: #dc3545;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
        }

        /* Mobile responsiveness */
        @media (max-width: 500px) {
            form {
                padding: 15px;
            }

            input[type="text"],
            input[type="email"],
            input[type="submit"] {
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    
    <jsp:include page="navigation.jsp" />

    <div class="container">
        <h2>Search and Update Contact Details</h2>

        <% 
            String message = (String) request.getAttribute("message"); 
            String error = (String) request.getAttribute("error"); 
        %>

        <% if (message != null && !message.isEmpty()) { %>
            <p class="success"><%= message %></p>
        <% } else if (error != null && !error.isEmpty()) { %>
            <p class="error"><%= error %></p>
        <% } %>

        <form method="post">
            <label for="studentId">Enter Contact ID to Update:</label>
            <input type="text" id="studentId" name="studentId" required>
            <input type="submit" value="Search">
        </form>

        <%
            String studentId = request.getParameter("studentId");

            if (studentId != null && !studentId.isEmpty()) {
                HttpSession session1 = request.getSession(true);
                session1.setAttribute("studentId", studentId);

                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/contactdb", "root", "9490");
                    ps = conn.prepareStatement("SELECT * FROM contact WHERE contact_id = ?");
                    ps.setString(1, studentId);
                    rs = ps.executeQuery();

                    if (rs.next()) {
        %>
                        <div>
                            <form action="UpdateServlet" method="post">
                                <input type="hidden" name="studentId" value="<%= studentId %>" />
                                <label for="name">Name:</label>
                                <input type="text" id="name" name="name" value="<%= rs.getString("name") %>" required><br>

                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" value="<%= rs.getString("email") %>" required><br>
                                
                                <label for="phoneNumber">Phone Number:</label>
                                <input type="text" id="phoneNumber" name="phoneNumber" value="<%= rs.getString("phone_number") %>" required><br>

                                <label for="address">Address:</label>
                                <input type="text" id="address" name="address" value="<%= rs.getString("address") %>" required><br>
                                
                                <input type="submit" value="Update">
                            </form>
                        </div>
        <%
                    } else {
        %>
                        <p class="error">Contact with ID <%= studentId %> not found.</p>
        <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>
</body>
</html>
