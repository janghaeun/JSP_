<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css">
	<TITLE>아이디 찾기</TITLE>

	<script language="javascript" src = "../include/scripts.js"></script>
	<script language="javascript">

        function CheckMemberForm(form) {
            if(!form.UserName.value){
                alert('이름을 입력하세요');
                form.UserName.focus();
                return true;
            }
            if (!form.UserJumin1.value){
                alert('주민등록번호 앞 6자리를 입력하세요');
                form.UserJumin1.focus();
                return;
			}

			if(!form.UserJumin2.value){
			    alert('주민등록번호 뒤 7자리를 입력하세요');
			    form.UserJumin2.focus();
			    return;
			}

			if (! JuminNoCheck(form.UserJumin1,form.UserJumin2)){
			    alert('주민번호가 적절치 않습니다.');
			    form.UserJumin1.focus();
			    return;
			}

			form.submit();
        }

	</script>

</HEAD>

<BODY TOPMARGIN=0 LEFTMARGIN=0>

<TABLE WIDTH=378 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>

	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER HEIGHT=30><FONT COLOR=WHITE SIZE=3><B>아이디 찾기</B></FONT></TD>

	</TR>

	<TR>
		<TD ALIGN=CENTER>
		
		<FORM NAME="IdSearch" METHOD=POST ACTION="IdSearchProc.jsp">
		
		<TABLE WIDTH=250 CELLSPACING=0 CELLPADDING=0 TOPMARGIN=0 LEFTMARGIN=0>

			<TR>
				<BR>
				<TD WIDTH=100 HEIGHT=30>이름</TD>
				<TD WIDTH=150 HEIGHT=30>
					<INPUT TYPE=TEXT NAME="UserName" SIZE=17 MAXLENGTH=20 STYLE="ime-mode:active" onkeydown="javascript:Korean()">
				</TD>
			</TR>

			<TR>
				<TD WIDTH=100 HEIGHT=30>주민등록번호</TD>
				<TD WIDTH=150 HEIGHT=30>
					<INPUT TYPE=TEXT NAME="UserJumin1" SIZE=6 MAXLENGTH=6 style="ime-mode: disabled " onkeydown="javascript:NumKey()"> -
					<INPUT TYPE=TEXT NAME="UserJumin2" SIZE=7 MAXLENGTH=7 style="ime-mode: disabled " onkeydown="javascript:NumKey()">
				</TD>
			</TR>

		</TABLE>
		
		</FORM>
		
		</TD>
	</TR>

	<TR>
		<TD HEIGHT=50 ALIGN=CENTER>
			<IMG SRC="../images/btn_idpw_srch_ok.gif" STYLE=CURSOR:HAND onclick="javascript:CheckMemberForm(IdSearch)">&nbsp;&nbsp;
			<IMG SRC="../images/btn_idpw_srch_cancel.gif" STYLE=CURSOR:HAND onclick="javacript: self.close();">
		</TD>
	</TR>

</TABLE>

</BODY>
</HTML>