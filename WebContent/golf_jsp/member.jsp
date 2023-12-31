<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="jsp_team_project_golf_dto.Tbl_gmember_Dto"%>
<%@ page import="jsp_team_project_golf_dao.Tbl_gmember_Dao"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">

<title>골프 회원 조회</title>
<style>
.table-smaller {
	max-width: 80%; /* Adjust the width as needed */
	margin: 0 auto;
}

.table-outer {
	border: 1px solid #ccc;
	padding: 10px;
	margin: 0 auto;
	max-width: 80%; /* Adjust the width as needed */
}

.table-wrapper {
	text-align: center;
}

.table {
	margin-top: 10px;
}

.section-bg {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -1;
	opacity: 0.3; /* 흐림 효과 설정 */
	filter: blur(5px); /* 흐림 효과 블러 적용 */
	background: url('jsp_teamproject_img/golf2.jpg') no-repeat center center
		fixed;
	background-size: cover;
}

.title {
	text-align: center;
	text-transform: uppercase;
	font-size: 26px;
	letter-spacing: 1px;
	display: grid;
	grid-template-columns: 1fr auto 1fr;
	grid-template-rows: 30px 0;
	grid-gap: 22px;
	margin-top: 20px;
	position: relative; /* 배경 이미지와 겹치기 위해 상대 위치 설정 */
	z-index: 1; /* 배경 이미지 뒤에 배치하기 위한 z-index 설정 */
}

.title:before, .title:after {
	content: '[';
	display: inline-block;
	position: relative;
	top: 1px;
	height: 100%;
	font-size: 1.25em;
	color: tomato;
	transition: all 0.5s ease;
}

.title:after {
	content: ']';
}

.title:hover:before {
	transform: translateX(-5px);
}

.title:hover:after {
	transform: translateX(5px);
}
</style>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<section>
		<div class="section-bg"></div>
		<div class="title">골프 회원 조회</div>
		<div class="table-outer">
			<div class="table-wrapper">
				<table class="table table-striped table-hover">
					<tbody>
						<%-- Dao에서 골프 회원 정보 조회하기 --%>
						<%
							Tbl_gmember_Dao gmemberDao = new Tbl_gmember_Dao();
							List<Tbl_gmember_Dto> gmembers = gmemberDao.getclasss();
							for (Tbl_gmember_Dto gmember : gmembers) {
						%>
						<tr>
							<td><%=gmember.getC_no()%></td>
							<td><%=gmember.getC_name()%></td>
							<td><%=gmember.getPhone()%></td>
							<td><%=gmember.getAddress()%></td>
							<td><%=gmember.getGrade()%></td>
						</tr>
						<%
							}
						%>
						
						
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>
