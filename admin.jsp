<html>
<head>
    <link rel="stylesheet" href="./admin.css">
    <title>HAIRCUT</title>
</head>
<body>
<form action="./admin.jsp" method="get">
    <input type="date" name="date">
    <input type="submit" Value="Search">
</form>
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Date</th>
                <th>Time</th>
            </tr>
<%@ page import="java.sql.*"%>
<%

try{
    String date = request.getParameter("date");
    String query = "select * from data where date=?";
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/haircut","root","");
    Statement stmt = con.createStatement();
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1,date);
    ResultSet rs = ps.executeQuery();
    while(rs.next()){
        %>
        
            <tr>
                <td><%out.print(rs.getString(1));%></td>
                <td><%out.print(rs.getString(2));%></td>
                <td><%out.print(rs.getString(3));%></td>
                <td><%out.print(rs.getString(4));%></td>
            </tr>
            
        
    <%}%>
        </table>
<%}catch(Exception e){
    out.print(e);
}%>
</body>
</html>