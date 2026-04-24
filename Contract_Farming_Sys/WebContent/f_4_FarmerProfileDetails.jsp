<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*,com.connection.ConnectionDB" %>

<%
HttpSession session1 = request.getSession(false);
Integer userId = (Integer) session1.getAttribute("userId"); // ✅ correct key

String name="", email="", phone="", address="";

if(userId != null){
    Connection con = ConnectionDB.connect();

    PreparedStatement ps = con.prepareStatement("SELECT * FROM farmer WHERE Id=?");
    ps.setInt(1, userId);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        name = rs.getString("FName");
        email = rs.getString("FEmail");
        phone = rs.getString("FContact");
        address = rs.getString("FAddress");
    }
}
%>
</body>
</html>