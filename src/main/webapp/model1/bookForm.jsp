<%@page import="model1.Book"%>
<%@page import="model1.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head><body>
<h1  class="w3-center"> 방명록</h1><br>
<div class="w3-container">
<form class="w3-container w3-card-4" method="post"  action="bookForm.jsp">
<br><p>      
<label class="w3-text-grey">작성자</label>
<input class="w3-input w3-border" type="text"  name="writer">
</p><p>      
<label class="w3-text-grey">제목</label>
<input class="w3-input w3-border" type="text"   name="title">
</p><p>      
<label class="w3-text-grey">내용</label>
<textarea class="w3-input w3-border" style="resize:none"  name="content"></textarea>
</p>
  <p class="w3-center">
  <button type="submit" class="w3-btn w3-padding w3-teal " 
  style="width:120px">Send &nbsp; ❯</button></p>
</form></div>
<%

/* 1) table 
    create table book (
	writer varchar(20),
	title  varchar(300),
	content varchar(3000),
	rdate  date
		);
	

 */



  BookDao  bd = new BookDao();
  //bd.getConnection();
  request.setCharacterEncoding("utf-8");
  String writer = request.getParameter("writer");
  String title = request.getParameter("title");
  String content = request.getParameter("content");
  int num=0;
  if (writer!=null) {
  Book b = new Book(writer, title, content);
  
  num = bd.insertBook(b);
  
  
  }
  
%><%=num%>개 입력 되었음
</body></html>