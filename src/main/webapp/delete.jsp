<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<link rel="stylesheet" href="style.css">
<script>
function check(){
	if(document.form.name.value=="")      
{alert("이름을 입력하세요");                  
document.form.name.focus();}
	else if(document.form.id.value=="")
		{alert("사번을 입력하세요");
		document.form.id.focus();}
	else{document.form.submit();}
}
</script>

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
	<section class="insert">
		<h3 class="he3">인사관리 사원정보 삭제화면</h3>
		<%@include file="DBConn.jsp"%>
		<form name="form" method="post" action="deleteprocess.jsp">
		<table border=1>
		<tr>
		<th>성명</th>
		<td><input type="text" name="name"></td>
		</tr>
		<tr>
		<th>사번</th>
		<td><input type="text" name="id"></td>
		</tr>
		<tr>
		<th colspan="2">
		<input type="button" value="삭제" onclick="check()">
		<input type="reset" value="취소">
		</table>
		</form>
		</section>
	<footer>
		<h3>HRDKOREA Copyright 2021 All right reserved.</h3>
	</footer>

</body>
</html>