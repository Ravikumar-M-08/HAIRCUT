<%@ page import="java.sql.*"%>
<% String username = request.getParameter("name");
String email = request.getParameter("email");
String date = request.getParameter("date");
String time = request.getParameter("time");

try{
    String query = "insert into data values(?,?,?,?)";
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/haircut","root","");
    Statement stmt = con.createStatement();
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1,username);
    ps.setString(2,email);
    ps.setString(3,date);
    ps.setString(4,time);
    int i = ps.executeUpdate();
    if(i>0){
        response.sendRedirect("./success.html");
    }
}catch(Exception e){
    out.print(e);
}%>