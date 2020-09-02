<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
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
<style>
td{
color:white;
}
.registerbtn {
background-color: black;
color: white;
padding: 10px 10px;
margin: 8px 0;
border: none;
cursor: pointer;
width: 10%;
opacity: 0.9;
}
</style>
<body style="background-color:gray">
<table border="1">
<tr>
<td>projectname</td>
<td>projectid</td>
<td>taskid</td>
<td>details</td>
<td>empid</td>
<td>projectstatus</td>

</tr>
<%
String empid=request.getParameter("empid");
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from assignedprojects where empid='"+empid+"' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getString("projectname") %></td>
<td><%=resultSet.getString("projectid") %></td>
<td><%=resultSet.getString("taskid") %></td>
<td><%=resultSet.getString("details") %></td>
<td><%=resultSet.getString("empid") %></td>
<td><%=resultSet.getString("projectstatus") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<FORM ACTION="http://localhost:8080/workflow/employeelogin.html" method="get" >
<textarea rows="5" cols="50">
Feedback And Suggestions.
</textarea>
<br>
<button type="submit"class="registerbtn">Submit</button>
</body>
</html>
