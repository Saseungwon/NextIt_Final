<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="list"  tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<body>

	<div class="container">
		<div class="page-header">
			<h3>
				자유게시판 - <small>글 등록</small>
			</h3>
		</div>
		<form action="boardRegist.wow" method="post">
			<table class="table table-striped table-bordered">
				<colgroup>
					<col width="20%" />
					<col />
				</colgroup>
				
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="boTitle"  cssClass="form-control input-sm"/>
					</td>
				</tr>
				
				<tr>
					<th>회원아이디</th>
					<td>
						<input type="text" name="boMemId" value="${sessionScope.MEM_INFO.memId }" readonly="readonly"  cssClass="form-control input-sm"/>
					</td>
				</tr>
				
				<tr>
					<th>작성자명</th>
					<td>
						<input type="text" name="boWriter" value="${sessionScope.MEM_INFO.memName }" readonly="readonly"  cssClass="form-control input-sm"/>
					</td>
				</tr>
				
				<tr>
					<th>팀명</th>
					<td>
						<input type="text" name="boTeamName" value="${sessionScope.MEM_INFO.memTeamName }" readonly="readonly"  cssClass="form-control input-sm"/>
					</td>
				</tr>
				
				<tr>
					<th>포지션</th>
					<td>
						<input type="text" name="boPos" value="${sessionScope.MEM_INFO.memTeamPref }" readonly="readonly"  cssClass="form-control input-sm"/>
					</td>
				</tr>		
						
 				<tr>
					<th>분류</th>
						<td>
							<select name="boSubCate" cssClass="form-control input-sm">
								<c:forEach items="${cateList }" var="cate">
									<option value="${cate.cateName}">${cate.cateKname}</option>
								</c:forEach>
							</select>
						</td>
				</tr> 
				<tr>
					<th>내용</th>
					<td>
						<input type="text" name="boContent"  cssClass="form-control input-sm"/>
				</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="pull-left">
							<a href="boardList.wow" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;&nbsp;목록
							</a>
						</div>
						<div class="pull-right">
							<button type="submit" class="btn btn-sm btn-primary">
								<span class="glyphicon glyphicon-save" aria-hidden="true"></span> &nbsp;&nbsp;저장
							</button>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- container -->
</body>
</html>


