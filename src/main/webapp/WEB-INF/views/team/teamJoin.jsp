<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<tag:header/>
</head>
<body>
<tag:navbar/>

	<div class="container">
		<div class="page-header">
			<h3>
				팀 가입신청
			</h3>
		</div>
		<form action="/team/teamJoinRegist.wow" method="post" >
			<table class="table table-striped table-bordered">
				<colgroup>
					<col width="20%" />
					<col />
				</colgroup>
				
				<tr>
					<th>팀명</th>
					<td>
						
						<input type="text" name="memTeamName" value="${teamName }" readonly="readonly">
					</td>
				</tr>
				
				<tr>
					<th>회원아이디</th>
					<td>
						<input name="memId" value="${sessionScope.MEM_INFO.memId }" readonly="readonly">
					</td>
				</tr>
				
				<tr>
					<th>작성자명</th>
					<td>
						<input value="${sessionScope.MEM_INFO.memName }" readonly="readonly">						
					</td>
				</tr>
				
				<tr>
					<th>포지션</th>
					<td>
						<input name="memPref"/>
					</td>
				</tr>		
				
				<tr>
					<th>등 번호</th>
					<td>
						<input name="memBackNo"/>
					</td>
				</tr>	
						
 				
				<tr>
					<td colspan="2">
						
					<div class="pull-right">
							<button type="submit" class="btn btn-sm btn-primary">
								<span class="glyphicon glyphicon-save" aria-hidden="true"></span> 신청
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