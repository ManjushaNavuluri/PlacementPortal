<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String rno = request.getParameter("rno");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "mysql";
String userid = "root";
String password = "";

try {
    Class.forName(driver);
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}

Connection connection = null;
PreparedStatement preparedStatement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="dash.css" type="text/css" media="all" />

    <style>
        body {
            background: linear-gradient(115deg, #56d8e4 10%, #9f01ea 90%);
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #333;
            overflow: hidden;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .student-block {
            margin: 20px auto;
            padding: 20px;
            max-width: 600px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
            border: 1px solid #ddd;
        }
        .student-block:nth-child(odd) {
            background-color: #f0f0f0;
        }
        h1 {
            background-color: #00FFFF;
            color: black;
            padding: 20px;
            text-align: center;
            margin: 0;
        }
        .form-group {
            display: flex;
            margin: 10px 0;
            align-items: center;
        }
        .form-group label {
            width: 200px;
            text-align: right;
            margin-right: 10px;
            font-weight: bold;
        }
        .form-group input {
            flex: 1;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group p {
            margin: 0; /* Remove default margin from <p> elements */
            padding: 8px; /* Add padding if needed for spacing */
        }
        .submit-container {
            text-align: center;
            margin-top: 20px;
        }
        .submit-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }
        .submit-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="navbar">
    <a href="homepage.html">Home</a>
    <a href="dashboard.html">Dashboard</a>
    <a href="careerCompass.html">Career Compass</a>
    <a href="contact.html">Contact</a>
    <a href="about.html">About Us</a>
</div><br><br>
<h1>PLACEMENT PORTAL</h1>



<%
try {
    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
    String sql = "SELECT * FROM it18 WHERE `REGISTER ID` = ?";
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, rno);
    resultSet = preparedStatement.executeQuery();
    
    while (resultSet.next()) {
%>
<div class="student-block">
    <div class="form-group">
        <label for="registerId">REGISTER ID:</label>
        <p><%=resultSet.getString("REGISTER ID") %></p>
    </div>
    <div class="form-group">
        <label for="name">NAME:</label>
        <p><%=resultSet.getString("NAME") %></p>
    </div>
    <div class="form-group">
        <label for="branch">BRANCH:</label>
        <p><%=resultSet.getString("BRANCH") %></p>
    </div>
    <div class="form-group">
        <label for="status">STATUS:</label>
        <input type="text" id="status" value="<%=resultSet.getString("STATUS") %>">
    </div>
    <div class="form-group">
        <label for="offers">SELECTIONS:</label>
        <input type="text" id="offers" value="<%=resultSet.getString("OFFERS") %>">
    </div>
    <div class="form-group">
        <label for="company1">COMPANY1:</label>
        <input type="text" id="company1" value="<%=resultSet.getString("COMPANY1") %>" >
    </div>
    <div class="form-group">
        <label for="company2">COMPANY2:</label>
        <input type="text" id="company2" value="<%=resultSet.getString("COMPANY2") %>" >
    </div>
    <div class="form-group">
        <label for="company3">COMPANY3:</label>
        <input type="text" id="company3" value="<%=resultSet.getString("COMPANY3") %>" >
    </div>
    <div class="form-group">
        <label for="company4">COMPANY4:</label>
        <input type="text" id="company4" value="<%=resultSet.getString("COMPANY4") %>" >
    </div>
    <div class="form-group">
        <label for="company5">COMPANY5:</label>
        <input type="text" id="company5" value="<%=resultSet.getString("COMPANY5") %>" >
    </div>
    <div class="form-group">
        <label for="company6">COMPANY6:</label>
        <input type="text" id="company6" value="<%=resultSet.getString("COMPANY6") %>" >
    </div>
    <div class="form-group">
        <label for="company7">COMPANY7:</label>
        <input type="text" id="company7" value="<%=resultSet.getString("COMPANY7") %>" >
    </div>
</div>
<%
    }
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    try {
        if (resultSet != null) resultSet.close();
        if (preparedStatement != null) preparedStatement.close();
        if (connection != null) connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>

<div class="submit-container">
    <form action="http://localhost:9999/PPDemo/insertPlacement" method="post">
        <input type="submit" class="submit-button" value="SUBMIT">
    </form>
</div>

</body>
</html>
