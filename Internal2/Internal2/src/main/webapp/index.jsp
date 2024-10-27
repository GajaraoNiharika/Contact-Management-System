<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Management</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        /* Welcome message styling */
        .welcome-message {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            position: fixed;
            top: 0;
            right: 0;
            width: 250px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 0 0 0 8px;
            animation: slide 0.5s ease-out forwards;
        }
        .welcome-message p {
            margin: 0;
            font-size: 1rem;
            line-height: 1.5;
        }

        /* Keyframes for sliding down effect */
        @keyframes slide {
            from { top: -60px; }
            to { top: 0; }
        }
    </style>
</head>
<body>
    <!-- Navigation inclusion -->
    <jsp:include page="navigation.jsp" />

    <!-- Welcome message with username -->
    <div class="welcome-message">
        <p>Welcome, <%= session.getAttribute("username") %></p>
    </div>
</body>
</html>
