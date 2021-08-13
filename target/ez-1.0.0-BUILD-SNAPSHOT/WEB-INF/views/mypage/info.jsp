<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<t:header />
</head>
<body>
<t:navbar />
	<div class="container">
		<form action="/mypage/edit.wow" method="post">
			<h3>회원정보</h3>
			<table class="table table-striped table-bordered">
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="memId" value="${member.memId }"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="text" name="memPass" value="${member.memPass }"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>회원명</th>
						<td><input type="text" name="memName" value="${member.memName }"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td><input type="text" name="memZip" value="${member.memZip }"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="memAddr1" value="${member.memAddr1 }"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input type="text" name="memAddr2" value="${member.memAddr2 }"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>생일</th>
						<td><input type="text" name="memBir" value='${sessionScope.MEM_INFO.memBir}'
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>메일</th>
						<td><input type="text" name="memMail" value="${member.memMail }"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>핸드폰</th>
						<td><input type="text" name="memHp" value="${member.memHp }"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>자기소개</th>
						<td><input type="text" name="memProfile" value="${member.memProfile }"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>선호 포지션</th>
						<td><input type="text" name="memPref" value="${member.memPref }"
							readonly="readonly"></td>
					</tr>
					<c:if test="${member.memRole eq 'MANAGER'} ">
						<tr>
							<th>탈퇴여부</th>
							<td><input type="text" name="memDelYn"
								value="${member.memDelYn }" readonly="readonly"></td>
						</tr>
					</c:if>
					<tr>
						<td><a href="/main.wow" class="btn btn-primary"> <span
								class="glyphicon glyphicon-home" aria-hidden="true"></span>
								&nbsp;Home
						</a></td>
						<td>

							<button type="submit" class="btn btn-info btn-sm">
								<span class="glyphicon glyphicon-king" aria-hidden="true"></span>&nbsp;수정
							</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>