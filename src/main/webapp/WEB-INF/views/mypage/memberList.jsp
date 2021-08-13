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
	text-decoration: none
}
</style>
</head>
<body>
	<tag:navbar />
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>생사 여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${memList}" var="mem">
					<tr>
						<th>${mem.memId}</th>
						<th>${mem.memName}</th>
						<c:if test="${mem.memRole eq 'USER' }">
							<c:if test="${mem.memDelYn eq 'N' }">
								<th>
									<form action="/admin/memDelete.wow" method="post">
										<input type="hidden" name="memId" value="${mem.memId }" />
										<button type="submit">죽이기</button>
									</form>
								</th>
							</c:if>
							<c:if test="${mem.memDelYn eq 'Y' }">
								<th>
									<form action="/admin/memRestore.wow" method="post">
										<input type="hidden" name="memId" value="${mem.memId }" />
										<button type="submit">살리기</button>
									</form>
								</th>
							</c:if>
						</c:if>
						<c:if test="${mem.memRole eq 'MANAGER' }">
							<th>관리자</th>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>