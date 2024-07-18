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
    background-image:url("bg.jpg"); /* Replace 'your-background-image.jpg' with the actual image file path */
    background-size: cover; /* Cover the entire viewport */
    background-repeat: no-repeat; /* Prevent repeating the image */
    background-attachment: fixed; /* Keep the background fixed while scrolling */
  }
  body {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Make the body take up the full viewport height */
  }
  #text
  {
  padding:8px;
  }
  #label
  {
  font-size:30px;
  font-color: white;
  color: #900C3F  ;
  }
  
</style>
</head>
<body>

<h1 font-color="white">PLACEMENT PORTAL</h1>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from personaldetails1 where Stu_id="+request.getParameter("studentid");
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<p id="label"><b>Stu_id :</b>      <%=resultSet.getString("Stu_id") %></p>
<p id="label"><b>Stu_name :</b>      <%=resultSet.getString("Stu_name") %></p>
<p id="label"><b>Stu_mail :</b>      <%=resultSet.getString("Stu_mail") %></p>
<p id="label"><b>addr :</b>       <%=resultSet.getString("addr") %></p>
<p id="label"><b>year :</b>     <%=resultSet.getString("year") %></p>
<p id="label"><b>contact :</b>      <%=resultSet.getString("contact") %></p>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>