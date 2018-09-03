<%--
  Created by IntelliJ IDEA.
  User: sihan
  Date: 2018-06-14
  Time: 오후 3:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("utf-8");%>

<%
    String passwd = request.getParameter("pass");
    int rno = Integer.parseInt(request.getParameter("rno"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String encoded_key = "";

    String column = request.getParameter("column");
    if (column == null)
        column = "";

    String key = request.getParameter("key");
    if (key != null) {
        encoded_key = URLEncoder.encode(key, "utf-8");
    } else {
        key = "";
    }

    try {
        Class.forName("com.mysql.jdbc.Driver");
        String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
        String jdbcId = "root";
        String jdbcPw = "rootpass";
        conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);

        String  Query1 = "Select UsrPass from board where RcdNo=?";
        pstmt = conn.prepareStatement(Query1);
        pstmt.setInt(1,rno);
        rs = pstmt.executeQuery();

        rs.next();
        String dbPass = rs.getString(1);

        if(passwd.equals(dbPass)){
            String Query2 = "Delete from board where RcdNo=" +rno;
            pstmt = conn.prepareStatement(Query2);
            pstmt.executeUpdate(Query2);

            rs.close();
            pstmt.close();
            conn.close();

            String retUrl = "BoardList.jsp?column=" + column + "&key=" + encoded_key;
            response.sendRedirect(retUrl);
        }

        else {
            rs.close();
            pstmt.close();
            conn.close();

            out.println("<script language=\"javascript\">");
            out.println("alert('패스워드가 틀렸습니다')");
            out.println("history.back()");
            out.println("</script>");

            out.flush();
        }

    }catch (SQLException e){
        e.printStackTrace();
    }
%>


