<html>
<body>
<%@page import="java.sql.*,java.util.*,java.io.*"%>

<%
String projectname=request.getParameter("projectname");
String projectid=request.getParameter("projectid");
String taskid=request.getParameter("taskid");
String details=request.getParameter("details");
String empid=request.getParameter("empid");
String projectstatus=request.getParameter("projectstatus");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root", "");
String sql = "CREATE DATABASE if not exists test";
Statement s1=con.createStatement();
s1.executeUpdate(sql);
Statement s2=con.createStatement();
s2.executeUpdate("use test");
Statement stmt=con.createStatement();
stmt.executeUpdate("create table if not exists assignedprojects(projectname varchar(50),projectid varchar(50) ,taskid varchar(100) primary key,details varchar(50) ,empid varchar(50),projectstatus number(50))");
PreparedStatement pstatement = null;
String queryString = "INSERT INTO assignedprojects(projectname,projectid,taskid,details,empid,projectstatus)
VALUES (?, ?, ? ,? , ? , ?)";
pstatement = con.prepareStatement(queryString);
pstatement.setString(1, projectname);
pstatement.setString(2, projectid);
pstatement.setString(3, taskid);
pstatement.setString(4, details);
pstatement.setString(5, empid);
pstatement.setString(6, projectstatus);

int result = pstatement.executeUpdate();
if(result!=0){
out.println("Data is successfully inserted!");

}

else {
out.println("try again");}

}
catch(Exception e)
{
out.println(e);
}
%>
<a href ="http://localhost:8080/workflow/manager_case.html">Back To Home</a><br/><br/>
</body>
</html>
