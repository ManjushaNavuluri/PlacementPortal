<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<title>ALUMNI</title>
</head>
<body>
<h1>ALUMNI</h1>
<table border="1">
<tr>
<th>StuId</th>
<th>StuName</th>
<th>Dept</th>
<th>cgpa</th>
<th>Package</th>
</tr>
<%
try{
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","");
    Statement statement=connection.createStatement();
    String sql ="select * from contactdata2";
    ResultSet resultSet = statement.executeQuery(sql);
    while(resultSet.next()){  
%>
<tr>
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("lname") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("msg") %></td>
</tr>
<%
    }
    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
</table>

<form action="download.jsp" method="post">
    <button type="submit" name="download">Download</button>
</form>

</body>
</html>