<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Contact</title>
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
            display: flex; /* Use flexbox */
            flex-direction: column; /* Stack children vertically */
            align-items: center; /* Center children horizontally */
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%; /* Responsive width */
            margin: 20px auto;
        }

        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
            color: #333;
            text-align: center; /* Center the label */
        }

        input[type="text"],
        input[type="submit"] {
            width: 100%; /* Ensure input takes full width */
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 4px;
            border: 1px solid #ddd;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff; /* Blue color */
            color: #fff;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        /* Message styling */
        .success {
            color: #28a745;
            background-color: #d4edda;
            padding: 10px;
            margin: 10px auto;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
            max-width: 400px;
            text-align: center;
        }

        .error {
            color: #dc3545;
            background-color: #f8d7da;
            padding: 10px;
            margin: 10px auto;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            max-width: 400px;
            text-align: center;
        }

        /* Mobile responsiveness */
        @media (max-width: 500px) {
            form {
                padding: 15px;
            }

            input[type="text"],
            input[type="submit"] {
                padding: 8px;
            }
        }
    </style>
</head>
<body>

    <jsp:include page="navigation.jsp" />

    <div class="container">
        <h2>Delete Contact</h2>

        <% 
            String message = (String) request.getParameter("message"); 
            String error = (String) request.getParameter("error"); 
        %>

        <% if (message != null && !message.isEmpty()) { %>
            <p class="success"><%= message %></p>
        <% } else if (error != null && !error.isEmpty()) { %>
            <p class="error"><%= error %></p>
        <% } %>

        <form action="deleteStudent" method="post">
            <label for="studentId">Enter Contact ID to Delete:</label>
            <input type="text" id="studentId" name="studentId" required>
            <input type="submit" value="Delete">
        </form>
    </div>
</body>
</html>
