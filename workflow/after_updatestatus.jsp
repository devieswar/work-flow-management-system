<html>
<body>
<%@page import="java.sql.*,java.util.*,java.io.*"%>

<%
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
stmt.executeUpdate("create table if not exists assignedprojects(projectname varchar(50),projectid varchar(50) ,taskid varchar(100) primary key,details varchar(50) ,empid varchar(50) ,projectstatus number(50) )");
PreparedStatement pstatement = null;
String queryString = "update assignedprojects set projectstatus=? where empid="+empid;
pstatement = con.prepareStatement(queryString);
pstatement.setInt(1, projectstatus);

int result = pstatement.executeUpdate();
if(result!=0){
out.println(" Database successfully Updated!");

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
