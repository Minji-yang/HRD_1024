<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String position=request.getParameter("position");
	String dept=request.getParameter("dept");
	String duty=request.getParameter("duty");
	String phone=request.getParameter("phone");
	
	PreparedStatement pstmt=null;
	try{
		String sql="update person1024 set name=?,dept=?,position=?,duty=?,phone=? where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,name);
		pstmt.setString(2,dept);
		pstmt.setString(3,position);
		pstmt.setString(4,duty);
		pstmt.setString(5,phone);
		pstmt.setString(6,id);
		pstmt.executeUpdate();%>
		
		<script>
		alert("수정 성공");
		location.href="select.jsp";
		</script>
	<%
	}
	catch(Exception e){
		System.out.println("수정 실패");
		e.printStackTrace();
	}
%>

</body>
</html>