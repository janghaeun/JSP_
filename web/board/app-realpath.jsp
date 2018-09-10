<%--
  Created by IntelliJ IDEA.
  User: haeun
  Date: 2018-09-10
  Time: 오전 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String realFolder = "";
    String saveFoldler = "upload_files";
    ServletContext context = getServletContext();
    realFolder = context.getRealPath(saveFoldler);
    out.println("저장경로 : "+realFolder+"<br>");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
