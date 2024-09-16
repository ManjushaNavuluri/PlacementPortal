<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
List<String> batches = new ArrayList<>();
List<Integer> totals = new ArrayList<>();
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
        #chart-container {
            width: 80%;
            margin: 0 auto;
        }
    </style>
</head>
<body>

<h1>HIGHER STUDIES</h1>

<%
try {
    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
    statement = connection.createStatement();
    String sql = "select * from highertable";
    resultSet = statement.executeQuery(sql);
    while (resultSet.next()) {
        String batch = resultSet.getString("Batch");
        int total = resultSet.getInt("TOTAL");
        batches.add(batch);
        totals.add(total);
%>
<div class="student-block">
    <p><strong>BATCH:</strong> <%= batch %></p>
    <p><strong>GRE / IELTS / TOEFL / DUOLINGO:</strong> <%= resultSet.getString("GRE / IELTS / TOEFL / DUOLINGO") %></p>
    <p><strong>CAT / MAT:</strong> <%= resultSet.getString("CAT / MAT") %></p>
    <p><strong>TOTAL:</strong> <%= total %></p>
</div>
<%
    }
    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<form action="downloadece18.jsp" method="post">
    <button id="download-button" type="submit" name="download">Download</button>
</form>

<!-- Include Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- Create a container for the chart -->
<div id="chart-container">
    <canvas id="myBarChart"></canvas>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    var ctx = document.getElementById('myBarChart').getContext('2d');
    var myBarChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: <%= batches.toString() %>.replace(/\[|\]|"/g, "").split(","),
            datasets: [{
                label: 'TOTAL',
                data: <%= totals.toString() %>.replace(/\[|\]/g, "").split(","),
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
});
</script>

</body>
</html>
