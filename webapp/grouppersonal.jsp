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
            cursor: pointer;
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
    <script>
        function navigateToDetails(studentId) {
            window.location.href = 'studentDetails.jsp?id=' + studentId;
        }
    </script>
</head>
<body>

<h1>PLACEMENT PORTAL</h1>

<%
try {
    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
    statement = connection.createStatement();
    String branch = request.getParameter("branch");
    String sql = "select * from personaldetails2";
    resultSet = statement.executeQuery(sql);
    while (resultSet.next()) {
        String studentId = resultSet.getString("id");
%>
<div class="student-block" onclick="navigateToDetails('<%=studentId %>')">
    <p><strong>REGISTER ID:</strong> <%=studentId %></p>
    <p><strong>NAME:</strong> <%=resultSet.getString("name") %></p>
    <p><strong>MAIL:</strong> <%=resultSet.getString("mail") %></p>
    <p><strong>ADDRESS:</strong> <%=resultSet.getString("address") %></p>
    <p><strong>YEAR:</strong> <%=resultSet.getString("year") %></p>
    <p><strong>PHONE:</strong> <%=resultSet.getString("phone") %></p>
</div>
<%
    }
    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
<form action="download.jsp" method="post">
    <button id="download-button" type="submit" name="download">Download</button>
</form>

</body>
</html>
