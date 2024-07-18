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
    background-image: url('pp5.jpg'); /* Replace 'your-background-image.jpg' with the actual image file path */
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
  font-size:10px;
  font-color: white;
  color: #660033 ;
  }
  
</style>
</head>
<body>

<h1>PLACEMENT PORTAL</h1>

<%

try{
String rid=request.getParameter("studentid");
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from inftable_2018 LIMIT 1";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<p id="label"><b>REGISTER ID : </b></p><input type="text" value=<%=    resultSet.getString("RID") %>>
<p id="label"><b>NAME : </b></p><input type="text" value=<%=    resultSet.getString("NAME") %>>
<p id="label"><b>BRANCH : </b></p><input type="text" value=<%=    resultSet.getString("BRANCH") %>>
<p id="label"><b>STATUS : </b></p><input type="text" value=<%=    resultSet.getString("STATUS") %>>
<p id="label"><b>OFFERS : </b></p><input type="text" value=<%=    resultSet.getString("OFFERS") %>>
<p id="label"><b>COMPANY1 : </b></p><input type="text" value=<%=    resultSet.getString("COMPANY1") %>>
<p id="label"><b>COMPANY2 : </b></p><input type="text" value=<%=    resultSet.getString("COMPANY1") %>>
<p id="label"><b>COMPANY3 : </b></p><input type="text" value=<%=    resultSet.getString("COMPANY1") %>>
<p id="label"><b>COMPANY4 : </b></p><input type="text" value=<%=    resultSet.getString("COMPANY1") %>>
<p id="label"><b>COMPANY5 : </b></p><input type="text" value=<%=    resultSet.getString("COMPANY1") %>>
<p id="label"><b>COMPANY6 : </b></p><input type="text" value=<%=    resultSet.getString("COMPANY1") %>>
<input type="submit" value="SUBMIT">
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>