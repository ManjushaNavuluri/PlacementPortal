<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
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
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="dash.css" type="text/css" media="all" />
    <style>
        body {
            background: linear-gradient(115deg, #56d8e4 10%, #9f01ea 90%);
        }
        #download-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }
        h1 {
            background-color: #00FFFF;
            color: black;
            padding: 20px;
            text-align: center;
            margin: 0;
        }
        .box {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none; /* Allows clicks to pass through */
        }
        .box div {
            position: absolute;
            width: 60px;
            height: 60px;
            background-color: transparent;
            border: 6px solid rgba(255, 255, 255, 0.8);
        }
        .box div:nth-child(1) {
            top: 12%;
            left: 42%;
            animation: animate 10s linear infinite;
        }
        .box div:nth-child(2) {
            top: 70%;
            left: 50%;
            animation: animate 7s linear infinite;
        }
        .box div:nth-child(3) {
            top: 17%;
            left: 6%;
            animation: animate 9s linear infinite;
        }
        .box div:nth-child(4) {
            top: 20%;
            left: 60%;
            animation: animate 10s linear infinite;
        }
        .box div:nth-child(5) {
            top: 67%;
            left: 10%;
            animation: animate 6s linear infinite;
        }
        .box div:nth-child(6) {
            top: 80%;
            left: 70%;
            animation: animate 12s linear infinite;
        }
        .box div:nth-child(7) {
            top: 60%;
            left: 80%;
            animation: animate 15s linear infinite;
        }
        .box div:nth-child(8) {
            top: 32%;
            left: 25%;
            animation: animate 16s linear infinite;
        }
        .box div:nth-child(9) {
            top: 90%;
            left: 25%;
            animation: animate 9s linear infinite;
        }
        .box div:nth-child(10) {
            top: 20%;
            left: 80%;
            animation: animate 5s linear infinite;
        }
        @keyframes animate {
            0% {
                transform: scale(0) translateY(0) rotate(0);
                opacity: 1;
            }
            100% {
                transform: scale(1.0) translateY(-90px) rotate(360deg);
                opacity: 0;
            }
        }
        input[type="submit"]:hover {
            background: #0056b3;
        }
    </style>
    <script>
        function navigateToDetails(studentId) {
            window.location.href = 'itt18.jsp?id=' + studentId;
        }
    </script>
</head>
<body>
<div class="navbar">
    <a href="homepage.html">Home</a>
    <a href="careerCompass.html">Career Compass</a>
    <a href="contact.html">Contact</a>
    <a href="about.html">About Us</a>
</div><br><br>
<h1>INFORMATION TECHNOLOGY</h1>

<div class="box">
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
</div>

<%
try {
    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
    statement = connection.createStatement();
    String branch = request.getParameter("branch");
    String sql = "select * from it18";
    resultSet = statement.executeQuery(sql);
%>
<table>
    <thead>
        <tr>
            <th>REGISTER ID</th>
            <th>NAME</th>
            <th>BRANCH</th>
            <th>STATUS</th>
            <th>SELECTIONS</th>
        </tr>
    </thead>
    <tbody>
<%
    while (resultSet.next()) {
        String studentId = resultSet.getString("REGISTER ID");
%>
        <tr onclick="navigateToDetails('<%=studentId %>')">
            <td><%=resultSet.getString("REGISTER ID") %></td>
            <td><%=resultSet.getString("NAME") %></td>
            <td><%=resultSet.getString("BRANCH") %></td>
            <td><%=resultSet.getString("STATUS") %></td>
            <td><%=resultSet.getString("OFFERS") %></td>
        </tr>
<%
    }
    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
    </tbody>
</table>
<form action="downloadit18.jsp" method="post">
    <button id="download-button" type="submit" name="download">Download</button>
</form>

</body>
</html>
