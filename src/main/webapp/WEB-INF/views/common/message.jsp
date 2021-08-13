<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>EzMatch : ${resultMessageVO.title}</title>
</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<body>
	<div class="container">
		<div class="row col-md-8 col-md-offset-2">
			<div class="page-header">
				<h3>${resultMessageVO.title}</h3>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<p>${resultMessageVO.message}</p>
				</div>
				<div class="panel-body">
					<a href="${pageContext.request.contextPath}"
						class="btn btn-primary"> 
						<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
						&nbsp;Home
					</a>
					<div class="pull-right">
						<a href="#" onclick="history.back()" class="btn btn-default">
							<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
							&nbsp;뒤로가기
						</a> 
						&nbsp;&nbsp;
						<c:if test="${not empty resultMessageVO.url}">
							<a href="<c:url value='${resultMessageVO.url}' />"
								class="btn btn-warning"> 
								<span class="glyphicon glyphicon-new-window aria-hidden="true"></span>
								&nbsp;${resultMessageVO.urlTitle}
							</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- container -->
</body>
</html>