<%--
  Created by IntelliJ IDEA.
  User: haeun
  Date: 2018-11-05
  Time: 오전 10:21
  To change this template use File | Settings | File Templates.
--%>

<%@page language="java" contentType="text/html; charset =utf-8" pageEncoding="utf-8" %>
<%
    String code = request.getParameter("IdPw");

    String viewPageURI = null;

    if(code.equals("1")){
        viewPageURI = "IdSearch.jsp";
    }else if(code.equals("2")) {
        viewPageURI = "PwSearch.jsp";
    }

%>

<jsp:forward page="<%= viewPageURI %>"/>