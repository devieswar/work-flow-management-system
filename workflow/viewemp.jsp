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
<td>name</td>
<td>empid</td>
<td>address</td>
<td>designation</td>
<td>emailid</td>
<td>username</td>
<td>password</td>

</tr>
<%

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from employee ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("empid") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("designation") %></td>
<td><%=resultSet.getString("emailid") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("password") %></td>
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
