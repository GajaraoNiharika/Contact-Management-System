<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Contact</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 20px;
            text-align: center;
        }
        h2 {
            color: #333;
        }
        form {
            margin-top: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        p {
            margin-top: 20px;
            font-weight: bold;
        }
        p.error {
            color: red;
        }
        p.success {
            color: green;
        }
    </style>
</head>
<body>

<jsp:include page="navigation.jsp" />

<h2>Search Contact</h2>

<%-- Display success or error messages --%>
<% String message = (String) request.getAttribute("message"); %>
<% String error = (String) request.getAttribute("error"); %>

<% if (message != null && !message.isEmpty()) { %>
    <p class="success"><%= message %></p>
<% } else if (error != null && !error.isEmpty()) { %>
    <p class="error"><%= error %></p>
<% } %>

<form action="CreateorUpdate.jsp" method="post">
    <label for="studentId">Enter Student ID to update:</label>
    <input type="text" id="studentId" name="studentId">
    <input type="submit" value="Search">
</form>

<% 
    // Retrieve the entered student ID from the form
    String studentId = request.getParameter("studentId");

    if (studentId != null && !studentId.isEmpty()) {
        // Create or retrieve HttpSession
        HttpSession session1 = request.getSession(true);

        // Store studentId in session
        session1.setAttribute("studentId", studentId);
    }
%>

</body>
</html>
