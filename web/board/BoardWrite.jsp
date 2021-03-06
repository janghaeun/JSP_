<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="java.net.URLEncoder" %>

<%
    String encoded_key = "";

    String column = request.getParameter("column");
    if (column == null)
        column = "";

    String key = request.getParameter("key");
    if (key != null) {
        encoded_key = URLEncoder.encode(key,"utf-8");
    } else {
        key ="";
    }


    int CurrentPage = Integer.parseInt(request.getParameter("CurrentPage"));
%>


<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=utf-8"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css"/>		
	<TITLE>게시글 입력</TITLE>
	<script type="text/javascript" src ="../include/scripts.js"></script>
	<script type="text/javascript">

		function CheckForm(form) {

		    if (!form.name.value){
			    alert("성명을 입력하세요");
			    form.name.focus();
			    return true;
			}

			if (form.mail.value){
		        if ( !isCorrectEmail('BoardWrite','mail')){
		            alert("전자우편형식이 올바르지 않습니다");
		            form.mail.focus();
		            form.mail.select();
		            return;
				}
			}


			if (!form.subject.value){
                alert("게시판의 제목을 입력하시요");
                form.subject.focus();
                return true;
			}

			if (!form.pass.value){
                alert("비밀번호를 입력하시오");
                form.pass.focus();
                return true;
			}

			form.submit();
        }

	</script>

</HEAD>

<BODY>

<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER><FONT SIZE=4><B>게시판 ( 게시글 입력 )</B></FONT></TD>
	</TR>
</TABLE>

<%
//------------------------------- JSP CODE START ( 세션 변수에 따른 문서 선택 )
	String member_id = (String)session.getAttribute("member_id");
	if(member_id == null) {
%>
		<jsp:include page="../member/LoginForm.jsp">
		<jsp:param name="CurrentPage" value="<%=CurrentPage%>"/>
		<jsp:param name="column" value="<%=column%>"/>
		<jsp:param name="key" value="<%=key%>"/>
		</jsp:include>

<% 
	} else { 
%>
	//loginState 문서에 페이지 정보와 키워드 검색을 위한 정보 전달 값 입력
	<jsp:include page="../member/LoginState.jsp">
		<jsp:param name="CurrentPage" value="<%=CurrentPage%>"/>
		<jsp:param name="column" value="<%=column%>"/>
		<jsp:param name="key" value="<%=key%>"/>
	</jsp:include>

<% 
	}
//------------------------------- JSP CODE END 	
%>

<FORM action="BoardWriteProc.jsp" NAME="BoardWrite"  METHOD=POST enctype="multipart/form-data">

<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=2 ALIGN=CENTER>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>이름</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="name" SIZE=20 style="ime-mode:active" onkeydown="javascript:Korean()" >
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>전자우편</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="mail" SIZE=60 style="ime-mode:inactive">
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>제목</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="subject" SIZE=70>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>내용</B></TD>
		<TD WIDTH=500>
			<TEXTAREA NAME="content" COLS=70 ROWS=8></TEXTAREA>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>파일첨부</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=FILE NAME="filename" SIZE=60>
		</TD>
	</TR> 
	 
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>패스워드</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=PASSWORD NAME="pass" SIZE=20>
		</TD>
	</TR>
	
</TABLE>

</FORM>

<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

	<TR ALIGN=CENTER>
		<TD WIDTH=110 ALIGN=LEFT>
			<IMG SRC="../images/btn_list.gif" onClick="javascript:location.replace('BoardList.jsp?column=<%=column%>&key=<%=encoded_key%>&CurrentPage=<%=CurrentPage%>')" STYLE=CURSOR:HAND>
		</TD>
		<TD WIDTH=400 ALIGN=CENTER>		
			<IMG SRC="../images/btn_save.gif" STYLE=CURSOR:HAND onclick="javascript:CheckForm(BoardWrite)">&nbsp;&nbsp;
			<IMG SRC="../images/btn_cancel.gif"  onClick="javascript:location.replace('BoardList.jsp?column=<%=column%>&key=<%=encoded_key%>')" STYLE=CURSOR:HAND>
		</TD>
		<TD WIDTH=110 ALIGN=LEFT>&nbsp;</TD>   
	</TR>
	
</TABLE>

</BODY>
</HTML>