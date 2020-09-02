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
<td>details</td>
</tr>
<%

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from projects ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("projectname") %></td>
<td><%=resultSet.getString("projectid") %></td>
<td><%=resultSet.getString("details") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>
