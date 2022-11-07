<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<link rel="stylesheet" href="style.css">

</head>
<body>
	<header>
		<h1>인사관리 프로젝트</h1>
	</header>
	<nav>
		<ul>
		<li><a href="select.jsp">조회</a></li>
		<li><a href="insert.jsp">사원등록</a></li>
		<li><a href="update.jsp">정보변경</a></li>
		<li><a href="delete.jsp">퇴사처리</a></li>
		<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	<section class="select">
		<h3 class="he3">직원정보조회</h3>
		<%@include file="DBConn.jsp"%>
		<table border=1>
		<tr>
		<th>no</th>
		<th>성명</th>
		<th>사번</th>
		<th>직급</th>
		<th>직책</th>
		<th class=phone>연락처</th>
		<th>소속부서</th>
		<th>입력날짜</th>
		</tr>
		
		<%
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		int no=0;
		try{
				String sql="select id,name,position,dept,duty,phone,to_char(s_date,'YYYY-MM-DD') from person1024";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					int id=rs.getInt("id");
					String name=rs.getString(2);
					String position=rs.getString("position");
					String duty=rs.getString("duty");
					String phone=rs.getString("phone");
					String dept=rs.getString("dept");
					String s_date=rs.getString(7);
					no++;
				
		%>
		<tr>
		<td><%=no %></td>
		<td><%=name %></td>
		<td><a href="update.jsp?id=<%=id%>"><%=id %></a></td>
		<td><%=position %></td>
		<td><%=duty %></td>
		<td><%=phone %></td>
		<td><%=dept %></td>
		<td><%=s_date %></td>
		</tr>
		<% }
		}catch(Exception e){
			System.out.println("DB 오류");
			e.printStackTrace();
		}
		%>			
		</table>
		</section>
	<footer>
		<h3>HRDKOREA Copyright 2021 All right reserved.</h3>
	</footer>

</body>
</html>