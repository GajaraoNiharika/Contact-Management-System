<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Navigation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        h2 {
            margin: 20px;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333;
            padding: 10px;
        }

        nav div {
            display: flex;
            gap: 15px;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            padding: 8px 16px;
            background-color: #444;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #555;
        }

        form {
            margin: 0;
        }

        button {
            background-color: #d9534f;
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>
<h2>Welcome, User <%= session.getAttribute("username") %></h2>

<%
    HttpSession session1 = request.getSession();
    String rollNumber = (String) session1.getAttribute("username");
%>

<nav>
    <div>
        <a href="CreateorUpdate.jsp">Update Contact</a>
        <a href="deleteStudent.jsp">Delete Contact</a>
        <a href="ShowData.jsp">My Details</a>
        <a href="viewStudents.jsp">Show All Details</a>
        <a href="welcome.jsp">Welcome Page</a>
    </div>
    <form action="Logout" method="post">
        <button type="submit">Logout</button>
    </form>
</nav>

</body>
</html>
