<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#button {
    padding: 10px 20px; /* Add some padding for better button appearance */
    font-size: 18px; /* Adjust font size as needed */
    margin: 0 10px;
  }
  
  body {
    background-image: url('VVIT.png'); /* Replace 'your-background-image.jpg' with the actual image file path */
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
  #studentid
  {
  font-size: 50px;
  font-color:white;
  color: white;
  }
  #textbox{
 padding:10px; 
  }
  .button-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px; }
  
</style>

<meta charset="UTF-8">
<title>form</title>
</head>
<body>
<form action="getPersonal.jsp">
<label for="stuid" id="studentid">Enter student id:</label>
<input type="text" name="studentid" id="textbox"><br><br>
<input type="submit" value="SHOW DATA" id="button">
</form>
</body>
</html>