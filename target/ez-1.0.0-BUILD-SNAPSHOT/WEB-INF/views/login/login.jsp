<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<t:header />
<meta charset="utf-8">
<style>
html, body {
	height: 100%;
}

body {
	display: flex;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<script src="/resources/js/jsp.js"></script>
</head>
<body class="text-center">
	<main class="form-signin">
		<form action="/login/login.wow" method="post">
			<img class="mb-4" src="/resources/images/main.png" alt=""
				width="300" height="200">
			<h1 class="h3 mb-3 fw-normal"></h1>

			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="name@example.com" name="userId"
					value="${cookie.SAVE_ID.value}"> <label for="floatingInput">ID</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					placeholder="Password" name="userPass"> <label
					for="floatingPassword">Password</label>
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" name="rememberMe" value="Y" <c:if test="${cookie.SAVE_ID.value != null}">checked</c:if>>
					아이디 기억하기
				</label>

			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">로그인
			</button>
			<br>
			<br> <a href="/join/join.wow"
				class="w-100 btn btn-lg btn-primary">회원가입 </a> <br>
			<br> <a href="/login/find.wow"
				class="w-100 btn btn-lg btn-primary">아이디/비밀번호 찾기 </a>


			<p class="mt-5 mb-3 text-muted"></p>
		</form>
	</main>
</body>
	<script type="text/javascript">
		$(document).ready(function() {
			var v_msg = request.getParameter("msg");
			if (v_msg != null) {
				alert(v_msg);
			}
		});
	</script>
</html>
