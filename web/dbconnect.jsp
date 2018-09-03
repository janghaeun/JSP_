<%--
  Created by IntelliJ IDEA.
  User: sihan
  Date: 2018-04-10
  Time: 오후 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Connection conn = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");

        String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
        String jdbcId = "root";
        String jdbcPw = "kaiser";
//        String jdbcId = "jspuser";
//        String jdbcPw = "jsppass";


        conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);

        out.println("db su");
    } catch (SQLException e) {
        out.println("db fail");
        e.printStackTrace();
    } finally {
        conn.close();
    }
%>

</body>
</html>
