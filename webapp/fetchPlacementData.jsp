<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Placement Data</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<%
    String year = request.getParameter("year");
    String tableName = "";

    switch(year) {
        case "2022-2023":
            tableName = "2223data";
            break;
        case "2021-2022":
            tableName = "2122data";
            break;
        case "2020-2021":
            tableName = "2021data";
            break;
        default:
            out.print("<p>Invalid year selected. Please choose a valid year.</p>");
            return;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/placement", "root", "");

        String sql = "SELECT company, total_selected, ctc_lpa FROM " + tableName;
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        if (!rs.next()) {
            out.print("<p>No data available for the selected year.</p>");
        } else {
            out.print("<table>");
            out.print("<tr><th>S.NO</th><th>Company</th><th>Total Selected</th><th>CTC (LPA)</th></tr>");

            int count = 1;
            do {
                out.print("<tr>");
                out.print("<td>" + count++ + "</td>");
                out.print("<td>" + rs.getString("company") + "</td>");
                out.print("<td>" + rs.getInt("total_selected") + "</td>");
                out.print("<td>" + rs.getFloat("ctc_lpa") + "</td>");
                out.print("</tr>");
            } while (rs.next());

            out.print("</table>");
        }

    } catch (Exception e) {
        out.print("<p>An error occurred while retrieving data.</p>");
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
</body>
</html>
