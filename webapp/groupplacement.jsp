<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    // Get the parameter values from the form
    String branch = request.getParameter("branch");
    int year = Integer.parseInt(request.getParameter("year"));

    // Define the target URLs for redirection
    String targetURL = "";

    // Logic to determine the target URL based on branch and year
    if (branch != null && !branch.isEmpty()) {
        if (branch.equalsIgnoreCase("IT") && year == 2018) {
            targetURL = "it18.jsp";
        } else if (branch.equalsIgnoreCase("CSE") && year == 2018) {
            targetURL = "cse18.jsp";
        } else if (branch.equalsIgnoreCase("ECE") && year == 2018) {
            targetURL = "ece18.jsp";
        } else if (branch.equalsIgnoreCase("EEE") && year == 2018) {
            targetURL = "eee18.jsp";
        } else if (branch.equalsIgnoreCase("CIVIL") && year == 2018) {
            targetURL = "civil18.jsp";
        } else if (branch.equalsIgnoreCase("MECH") && year == 2018) {
            targetURL = "mech18.jsp";
        } else {
            // Redirect to a default page if no matching conditions are found
            targetURL = "default.jsp";
        }
    } else {
        // Redirect to a default page if branch is not provided
        targetURL = "default.jsp";
    }

    // Perform the redirection
    response.sendRedirect(targetURL);
%>
