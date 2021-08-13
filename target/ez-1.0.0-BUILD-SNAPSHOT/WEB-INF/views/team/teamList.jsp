<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<tag:header />
<style type="text/css">
th {
	font-size: 20px;
	text-align: center;
	vertical-align: middle;
}
a {
	 text-decoration:none
}
</style>
</head>
<body>
<tag:navbar />
<div class="container py-3" >   <br><br>
<div style="text-align: center; font-size: 50px;">팀 목록</div> <br><br><br>

	<div>
		<table class="table">
			<thead>
				<tr>
					<th>엠블렘</th>
					<th>팀 이름</th>
					<th>지역</th>
					<th>팀 생성일</th>
					<c:if test="${sessionScope.MEM_INFO.memRole eq 'MANAGER' }">
					<th>팀 관리</th>
					</c:if>
				</tr>
			</thead>   
			<tbody>
				<c:forEach items="${teamList}" var="team">
					<tr>
						<th><img style="width: 100px; height: 100px;" alt="" src="${team.teamImageUrl}"></th>
						<th><a href="/team/teamView.wow?teamName=${team.teamName}">${team.teamName}</a></th>
						<th>${team.teamRegion}</th>
						<th>${team.teamRegDate}</th>
						
						<c:if test="${sessionScope.MEM_INFO.memRole eq 'MANAGER' }">
						<th>
						<form action="/admin/teamDelete.wow" method="post" >
						<input type="hidden" name="teamName" value="${team.teamName }"/>
						<button type="submit">추방</button>
						</form>
						</th>
						</c:if>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>