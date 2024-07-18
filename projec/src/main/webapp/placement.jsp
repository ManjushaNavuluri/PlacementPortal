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
<html><head>
<style>
body {
    background-image: url('VVIT.png'); /* Replace 'your-background-image.jpg' with the actual image file path */
    background-size: cover; /* Cover the entire viewport */
    background-repeat: no-repeat; /* Prevent repeating the image */
    background-attachment: fixed; /* Keep the background fixed while scrolling */
  }
  table{
  background-color: white;
  }
  h1{
  background-color: #00FFFF;
  color:black;
  align-items:center;
  padding:20px;
  text-align:center;
  }
  table{
  align-items:center;
  text-align:center;
  background-color:#f4fdfd ;
  
  }
  
  </style>
  <h1>PLACEMENT PORTAL</h1>
</head>

<body>


<table border="1">
<tr>
<th>REGISTER ID</th>
<th>NAME</th>
<th>BRANCH</th>
<th>STATUS</th>
<th>SELECTIONS</th>
<th>COMPANY1</th>
<th>COMPANY2</th>
<th>COMPANY3</th>
<th>COMPANY4</th>
<th>COMPANY5</th>
<th>COMPANY6</th>


</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String branch=request.getParameter("branch");
//if(branch=="CIVIL"){
String sql ="select * from csetable_2018";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("REGISTER ID") %></td>
<td><%=resultSet.getString("NAME") %></td>
<td><%=resultSet.getString("BRANCH") %></td>
<td><%=resultSet.getString("STATUS") %></td>
<td><%=resultSet.getString("OFFERS") %></td>
<td><%=resultSet.getString("COMPANY1") %></td>
<td><%=resultSet.getString("COMPANY2") %></td>
<td><%=resultSet.getString("COMPANY3") %></td>
<td><%=resultSet.getString("COMPANY4") %></td>
<td><%=resultSet.getString("COMPANY5") %></td>
<td><%=resultSet.getString("COMPANY6") %></td>

</tr>
<%
//}

}

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table> 
</body>
</html>