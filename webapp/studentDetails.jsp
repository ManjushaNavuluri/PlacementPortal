<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
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
        .student-details {
            margin: 20px auto;
            padding: 20px;
            max-width: 600px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
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

<h1>STUDENT DETAILS</h1>

<%
try {
    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
    statement = connection.createStatement();
    String sql = "select * from personaldetails2 where id = '" + id + "'";
    resultSet = statement.executeQuery(sql);
    if (resultSet.next()) {
%>
<div class="student-details">
    <p><strong>REGISTER ID:</strong> <%=resultSet.getString("id") %></p>
    <p><strong>NAME:</strong> <%=resultSet.getString("name") %></p>
    <p><strong>MAIL:</strong> <%=resultSet.getString("mail") %></p>
    <p><strong>ADDRESS:</strong> <%=resultSet.getString("address") %></p>
    <p><strong>YEAR:</strong> <%=resultSet.getString("year") %></p>
    <p><strong>PHONE:</strong> <%=resultSet.getString("phone") %></p>
</div>
<%
    } else {
%>
<p>No student found with ID <%=id %></p>
<%
    }
    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

</body>
</html>
