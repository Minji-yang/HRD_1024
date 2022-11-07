<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="DBConn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");   //폼에 있는 name="id"값을 가져옴
	String name=request.getParameter("name");
	String dept=request.getParameter("dept");
	String position=request.getParameter("position");
	String duty=request.getParameter("duty");
	String phone=request.getParameter("phone");

	PreparedStatement pstmt=null;
	try{
		String sql="insert into person1024 values(?,?,?,?,?,?,sysdate)"; //SQL> alter table person1024 add(s_date date);
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);        //primary key중복불가
		pstmt.setString(2,name);
		pstmt.setString(3,dept);  //form select option에 value값을 넣어줘야함
		pstmt.setString(4,position);  //form select option에 value값을 넣어줘야함
		pstmt.setString(5,duty);
		pstmt.setString(6,phone);
		pstmt.executeUpdate();%>
		
		<script>
		alert("저장 성공");
		location.href="select.jsp";
		</script>
		
		<%
		
	}catch(Exception e){
		System.out.println("저장 실패");
		e.printStackTrace();
	}

%>
