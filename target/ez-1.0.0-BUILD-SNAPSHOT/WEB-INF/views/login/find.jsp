<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<t:header />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<tag:navbar/>
	<div class="container">
		
			<h3>아이디/비밀번호 찾기</h3>
			<table class="table table-striped table-bordered">
				<tbody>
				<form>
					<tr>
						<th>회원명</th>
						<td><input type="text" name="memName"></td>
					</tr>
					<tr>
						<th>메일</th>
						<td><input type="text" name="memMail">
							<button type="submit" formmethod="post"
								formaction="/login/find.wow" id="findId">아이디 찾기</button></td>
					</tr>
					</form>
					<form>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="memId"></td>
					</tr>
					<tr>
						<th>메일</th>
						<td><input type="text" name="memMail">
							<button type="submit" formmethod="post"
								formaction="/login/find.wow" id="findPass">비밀번호 찾기</button></td>
					</tr>
				</form>
				<tr>
						<td><a href="/main.wow" class="btn btn-primary"> <span
								class="glyphicon glyphicon-home" aria-hidden="true"></span>
								&nbsp;Home
						</a></td>
					</tr>
				</tbody>
			</table>
	</div>
	
</body>
</html>