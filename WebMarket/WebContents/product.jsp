<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dto.RecentProduct"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<!-- 서버와 접속 후 브라우저 종료전 까지 모든 페이지에서 사용가능한 session범위로 지정 -->
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>
<% ProductRepository productDAO = ProductRepository.getInstance(); %>
<%@ include file="dbconn.jsp" %>
<%
String id = request.getParameter("id");
Product product =productDAO.getProductById(id);
%>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function addToCart(){
	if(confirm("상품을 장바구니에 추가하시겠습니까?")){
		document.addForm.submit();
	}else{
		document.addForm.reset();
	}
}
</script>
</head>
<body>
<div class="jumbotron">
    <div class="container">
      <h1 class="display-3">상품 정보</h1>
    </div>
</div>
<div class="container">
  <div class="row">
  <%
  PreparedStatement pstmt =null;
  ResultSet rs = null;
  
  String sql = "select * from product where p_id=?";
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(1, id);
  rs = pstmt.executeQuery();
  
  if(rs.next()) {
	  
  
  %>
     <div class="col-md-5">
        <img src='/upload/<%=rs.getString("p_fileName")%>' style="width:100%">
     </div>
     <div class="col-md-6">
        <p><% for(int i=1;i<=4;i++){out.print("★");} %></p>
       <h3><%=rs.getString("p_name") %></h3>
       <p><%=rs.getString("p_description") %>
       <p><b>상품 코드 : </b><span class="badge badge-danger"><%=rs.getString("p_id") %></span>
       <p><b>제조사</b>:<%=rs.getString("p_manufacturer") %>
       <p><b>분류</b>:<%=rs.getString("p_category") %>
       <p><b>재고 수</b>:<%=rs.getLong("p_unitsInStock") %>
       <h4><%=rs.getInt("p_unitPrice") %>원</h4>
       <p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">
          <div class="col-md-2">
          <input type="number" name="qty" value="0" class="form-control input-md">
          </div>
          <a href="#" class="btn btn-info" onclick="addToCart()">상품주문 &raquo;</a>
          <a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
          <a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
          </form>
          <% } %>
     </div>
  </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>