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
	if(document.form.id.value=="")      //form안에 name="id"인 값이 없을때
{alert("id를 입력하세요");                  //유효성검사창
document.form.id.focus();}
	else if(document.form.name.value=="")      //form안에 name="name"인 값이 없을때
	{alert("이름을 입력하세요");                  //유효성검사창
	document.form.name.focus();}
	else if(document.form.dept.value=="")      //form안에 name="dept"인 값이 없을때
	{alert("소속부서를 선택하세요");                  //유효성검사창
	document.form.dept.focus();}
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
		<h3 class="he3">인사관리 사원등록 화면</h3>
		<form name="form" method="post" action="insertprocess.jsp">
		<table border=1>
		<tr>
		<th><label for="id">사원번호</label></th>
		<td><input type="text" id="id" name="id" ></td>
		</tr>
		<tr>
		<th><label for="name">성명</label></th>
		<td><input type="text" id="name" name="name" ></td>
		</tr>
		<tr>
		<th><label for="dept">소속부서</label></th>
		<td>
		<select id="dept" name="dept">
		<option value="영업부">영업부</option>
		<option value="경리부">경리부</option>
		<option value="홍보부">홍보부</option>
		<option value="인사부">인사부</option>
		<option value="기획부" >기획부</option>
		</select>
		<!--value값이 insertprocess를 통해 데이터베이스로 들어가는 내용 -->
		</td>
		</tr>
		<tr>
		<th><label for="position">직급</label></th>
		<td>
		<select id="position" name="position">
		<option value="1">1급</option>        
		<option value="2">2급</option>
		<option value="3">3급</option>
		<option value="4">4급</option>
		<option value="5">5급</option>
		</select>
		<!--value값에 1급 넣으면 4byte가 되므로 에러  -->
		</td>
		</tr>
		<tr>
		<th><label for="duty">직책</label></th>
		<td><input type="text" id="duty" name="duty" ></td>
		</tr>
		<tr>
		<th><label for="phone">연락처</label></th>
		<td><input type="text" id="phone" name="phone"></td>
		</tr>
		<tr>
		<th colspan="2">
		<input type="button" value="등록" onclick="check()">
		<input type="reset" value="취소">
		</th>
		</tr>
		</table>
		</form>
		
	</section>
	<footer>
		<h3>HRDKOREA Copyright 2021 All right reserved.</h3>
	</footer>

</body>
</html>