<html>
<body>
<%@page import="java.sql.*,java.util.*,java.io.*"%>

<%
String name=request.getParameter("name");
String empid=request.getParameter("empid");
String address=request.getParameter("address");
String designation=request.getParameter("designation");
String emailid=request.getParameter("emailid");
String username=request.getParameter("username");
String password=request.getParameter("password");
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
stmt.executeUpdate("create table if not exists employee(name varchar(50),empid
varchar(50) primary key,address varchar(100),designation varchar(50) ,emailid varchar(50),username varchar(50),password varchar(15))");
PreparedStatement pstatement = null;
String queryString = "INSERT INTO employee(name,empid,address,designation,emailid,username,password)
VALUES (?, ?, ? ,? , ? ,? ,? )";
pstatement = con.prepareStatement(queryString);
pstatement.setString(1, name);
pstatement.setString(2, empid);
pstatement.setString(3, address);
pstatement.setString(4, designation);
pstatement.setString(5, emailid);
pstatement.setString(6, username);
pstatement.setString(7, password);
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
