<%@page import="ch07.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL에서 연산자 사용하기</title>
</head>
<% Student s = new Student();
   s.setName("홍길동");
   s.setAge(20);
   request.setAttribute("student", s);
   %>
<body>
   ${student.name}   // student.getName() <br>
   ${student.age}  // student.getAge()
</body>
</html>