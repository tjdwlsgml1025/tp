<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.Context"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.sql.DataSource"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HomeShopping</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<style>
.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 80vh; /* 뷰포트의 높이에 맞춰 가운데 정렬 */
}

.insertBox {
	width: 600px;
	max-width: 100%;
	border: 3px solid #000;
	padding: 500px;
	box-sizing: border-box;
}

.table-smaller {
	max-width: 80%;
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
	background: url('mart.jpg') no-repeat center center fixed;
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
<header>
	<%@ include file="/golf_jsp/nav.jsp"%>
</header>
<body>


	<section class="d-flex flex-column align-items-center">
		<div class="section-bg"></div>

		<div class="title">회원매출조회</div>
		<br>
		<table class="table table-striped table-hover">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>


			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.custno}</td>
					<td>${dto.custname}</td>
					<td>${dto.grade}</td>
					<td>${dto.price}</td>
				</tr>
			</c:forEach>


		</table>
	</section>

	<footer class="align-bottom p-4">
		<!-- <p>ⓒ AliceSeo 2023</p> -->
		<%@ include file="/golf_jsp/footer.jsp"%>
	</footer>
</body>
</html>