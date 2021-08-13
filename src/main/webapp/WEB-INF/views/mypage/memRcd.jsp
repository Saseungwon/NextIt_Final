<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<tag:header />
</head>
<tag:navbar />
<body>
	<div>
		<div>
			<table class="table table-striped table-bordered">
				<tr>
					<td>경기 분류</td>
					<td>경기 횟수</td>
					<td>골 횟수</td>
					<td>어시 횟수</td>
				</tr>
				<c:forEach items="${recordCount }" var="count">
					<tr>
						<td>${count.matchCate }</td>
						<td>${count.totalMatch }</td>
						<td>${count.totalGoal }</td>
						<td>${count.totalAssist }</td>
					</tr>
				</c:forEach>
				<tr>
			</table>
		</div>
		<br> <br> <br>
		<div>
			<table class="table table-striped table-bordered">
				<tr>
					<td>경기 분류</td>
					<td>경기 번호</td>
					<td>골</td>
					<td>어시</td>
				</tr>
				<c:forEach items="${record }" var="rcd">
					<tr>
						<td>${rcd.rcdMatchCate eq "lea" ? "리그" : "친선" }</td>
						<td>${rcd.rcdMatchNo}</td>
						<td>${rcd.rcdGoal }</td>
						<td>${rcd.rcdAssist }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>