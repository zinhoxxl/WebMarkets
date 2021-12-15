<%@page import="mvc.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>view.jsp</h1>
   <%=request.getAttribute("num") %><br>
   <%=request.getAttribute("page") %><br>
   <%=((BoardDTO)request.getAttribute("board")).getSubject() %>
</body>
</html>