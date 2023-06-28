<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
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
request.setCharacterEncoding("utf-8");
%>
이름 : ${param.name}<br>
age : ${param.age}<br>
gender : ${param.gender}<br>
hobby : ${param.hobby}<br>
test : ${param.test}<br>
year : ${param.year}<br>
<h2>요청파라미터에 저장된 모든 값 조회하기 </h2>
<h3>취미 :</h3>

<%
String[] hobbies = request.getParameterValues("hobby");
//야구, 축구, 독서,
for (String h : hobbies) { %>
<%=h %>,
<%} %><br>

<table>
  <tr><th>파라미터이름(Enumeration)</th><th>파라미터값</th></tr>
<% //Iterator의 구버전 : 반복자. 
   Enumeration e = request.getParameterNames();  //name을 가지고온다 
   while(e.hasMoreElements()) {
	   String paramName = (String)e.nextElement(); //파라미터 이름
	   String[] paramValues = request.getParameterValues(paramName);
%>	   
 <tr><td><%=paramName%></td>
     <td><% for(String v : paramValues) { %>
         <%=v%>&nbsp;&nbsp;&nbsp;  <%}%>     </td>
 </tr><%  }  %>  
</table>
<table>
  <tr><th>Map</th><th>파라미터값</th></tr>
<% //Iterator의 구버전 : 반복자. 
   Map <String, String[]> map = request.getParameterMap();
   Iterator<Map.Entry<String, String[]>> it = map.entrySet().iterator(); 
   while(it.hasNext()) {
	   Entry<String, String[]> en = it.next(); //파라미터 이름
	   
%>	   
 <tr><td><%=en.getKey()%></td>
     <td><% for(String v : en.getValue()) {%>
         <%=v%>&nbsp;&nbsp;&nbsp;<%}%></td>
 </tr><%  }  %>  
</table>


/request1.jsp?name=aaaa&id=bbbb&pwd=ppp
</html>