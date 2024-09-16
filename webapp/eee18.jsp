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
        .student-block {
            margin: 20px auto;
            padding: 20px;
            max-width: 600px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }
        .student-block:nth-child(odd) {
            background-color: #f0f0f0;
        }
        h1 {
            background-color: #00FFFF;
            color: black;
            padding: 20px;
            text-align: center;
            margin: 0; /* Remove default margin */
        }
    </style>
</head>
<body>

<h1>PLACEMENT PORTAL</h1>


<%
try {
    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
    statement = connection.createStatement();
    String branch = request.getParameter("branch");
    String sql = "select * from eee18";
    resultSet = statement.executeQuery(sql);
    while (resultSet.next()) {
%>
<div class="student-block">
    <p><strong>REGISTER ID:</strong> <%=resultSet.getString("REGISTER ID") %></p>
    <p><strong>NAME:</strong> <%=resultSet.getString("NAME") %></p>
    <p><strong>BRANCH:</strong> <%=resultSet.getString("BRANCH") %></p>
    <p><strong>STATUS:</strong> <%=resultSet.getString("STATUS") %></p>
    <p><strong>SELECTIONS:</strong> <%=resultSet.getString("OFFERS") %></p>
    <p><strong>COMPANY1:</strong> <%=resultSet.getString("COMPANY1") %></p>
    <p><strong>COMPANY2:</strong> <%=resultSet.getString("COMPANY2") %></p>
    <p><strong>COMPANY3:</strong> <%=resultSet.getString("COMPANY3") %></p>
    <p><strong>COMPANY4:</strong> <%=resultSet.getString("COMPANY4") %></p>
    <p><strong>COMPANY5:</strong> <%=resultSet.getString("COMPANY5") %></p>
    <p><strong>COMPANY6:</strong> <%=resultSet.getString("COMPANY6") %></p>
    <p><strong>COMPANY7:</strong> <%=resultSet.getString("COMPANY7") %></p>
</div>
<%
    }
    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
<form action="downloadeee18.jsp" method="post">
    <button id="download-button" type="submit" name="download">Download</button>
</form>

</body>
</html>
