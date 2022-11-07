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
		<h3 class="he3">인사관리 사원정보변경 화면</h3>
		
		<%@include file="DBConn.jsp"%>
		<%
			String id=request.getParameter("id");
		/*  select파일에 a href주소에 id */
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try
			{
				String sql="select * from person1024 where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,id);
				rs=pstmt.executeQuery();
			
				if(rs.next()){
					String name=rs.getString("name");
					String position=rs.getString("position");
					String duty=rs.getString("duty");
					String dept=rs.getString("dept");
					String phone=rs.getString("phone");
				
		%>
		
	
		<form name="form" method="post" action="updateprocess.jsp">
		<table border=1>
		<tr>
		<th><label for="id">사원번호</label></th>
		<td><input type="text" id="id" name="id" value="<%=id%>" ></td>
		<!-- select파일에 a href주소에 id -->
		</tr>
		<tr>
		<th><label for="name">성명</label></th>
		<td><input type="text" id="name" name="name" value="<%=name%>" ></td>
		</tr>
		<tr>
		<th><label for="dept">소속부서</label></th>
		<td>
		<select id="dept" name="dept">
		<option value="영업부"<%if(dept.equals("영업부")){%>selected<%}%>>영업부</option>
		<option value="경리부"<%if(dept.equals("경리부")){%>selected<%}%>>경리부</option>
		<option value="홍보부"<%if(dept.equals("홍보부")){%>selected<%}%>>홍보부</option>
		<option value="인사부"<%if(dept.equals("인사부")){%>selected<%}%>>인사부</option>
		<option value="기획부"<%if(dept.equals("기획부")){%>selected<%}%>>기획부</option>
		</select>
		<!--value값이 insertprocess를 통해 데이터베이스로 들어가는 내용 -->
		</td>
		</tr>
		<tr>
		<th><label for="position">직급</label></th>
		<td>
		<select id="position" name="position" >
		<option value="1"<%if(position.equals("1")){%>selected<%}%>>1급</option>        
		<option value="2"<%if(position.equals("2")){%>selected<%}%>>2급</option>
		<option value="3"<%if(position.equals("3")){%>selected<%}%>>3급</option>
		<option value="4"<%if(position.equals("4")){%>selected<%}%>>4급</option>
		</select>
		<!--value값에 1급 넣으면 4byte가 되므로 에러 -->
		</td>
		</tr>
		<tr>
		<th><label for="duty">직책</label></th>
		<td><input type="text" id="duty" name="duty" value="<%=duty%>"  ></td>
		</tr>
		<tr>
		<th><label for="phone">연락처</label></th>
		<td><input type="text" id="phone" name="phone" value="<%=phone%>" ></td>
		</tr>
		<tr>
		<th colspan="2">
		<input type="button" value="수정" onclick="check()">
		<input type="reset" value="취소">
		</th>
		</tr>
		</table>
		</form>
		<%
					}
			}catch(Exception e)
			{System.out.println("db 오류");
			e.printStackTrace();
			}
				%>
		
	</section>
	<footer>
		<h3>HRDKOREA Copyright 2021 All right reserved.</h3>
	</footer>

</body>
</html>