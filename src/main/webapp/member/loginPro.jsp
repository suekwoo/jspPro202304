<%@page import="member.Member"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");

MemberDao md = new MemberDao();
Member mem = md.oneMember(id); 
String msg = "";
String url = "";
if (mem ==null) {   //id 없음
	msg="아이디를 확인 하세요";
    url="loginForm.jsp";
} else  {	
	if (pass.equals(mem.getPass())) {  //login ok
		session.setAttribute("id", id);
	    msg=mem.getName()+"님이 로그인 하셨습니다";
		url="index.jsp";
	} else {
		msg = "비밀번호를 확인 하세요";
		url="loginForm.jsp";
	}}
%>
<script>
  alert ('<%=msg%>');
  location.href="<%=url%>";
</script>




</body>
</html>