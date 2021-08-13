<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
					자유게시판  <small>글 수정</small>
				</h3>
			</div>
			<form:form action="boardModify.wow" method="post" modelAttribute="board">
			
				<table class="table table-striped table-bordered">
					<colgroup>
						<col width="20%" />
						<col />
					</colgroup>
					<tr>
						<th>글번호</th>
						<td>${board.boNo }
						<form:hidden path="boNo"/>
						</td>
					</tr>
					
					<tr>
						<th>분류</th>
							<td>
								<form:select path="boCate" cssClass="form-control input-sm">
									<form:option value="">-- 선택하세요 --</form:option>
									<form:options items="${cateList}" itemLabel="cateKname" itemValue="cateHrchy"/>
								</form:select>
								<form:errors path="boCate"/>
							</td>
					</tr> 

					
					<tr>
						<th>글제목</th>
						<td>
							<form:input path="boTitle" cssClass="form-control input-sm"/>
						</td>
					</tr>
					<tr>
						<th>작성자명</th>
						<td>${sessionScope.MEM_INFO.memName }<input type="hidden" name="boWriter" value="${sessionScope.MEM_INFO.memName }">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" name="boContent" class="form-control input-sm">${board.boContent }</textarea></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${board.boHit }</td>
					</tr>
					<tr>
						<th>최근등록일자</th>
						<td>${board.boModDate eq null ? board.boRegDate : board.boModDate }</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="pull-left">
								<a href="boardList.wow" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;&nbsp;목록
								</a>
							</div>
							<div class="pull-right">

								<a href="boardList.wow" class="btn btn-info btn-sm"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;목록으로
								</a>
								<button type="submit"  class="btn btn-sm btn-primary">
									<span class="glyphicon glyphicon-save" aria-hidden="true"></span> &nbsp;&nbsp;저장
								</button>

								<button type="button" id="del_btn" class="btn btn-sm btn-danger"> 
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> &nbsp;&nbsp;삭제
								</button>
							</div>
						</td>
					</tr>
				</table>
			</form:form>
		</div>
		<!-- container -->

<script type="text/javascript">
	var v_del_btn = document.getElementById('del_btn'); 	
	v_del_btn.onclick = function() {
		document.forms[0].action = "boardDelete.wow"; 
		document.forms[0].submit(); 
	}
</script>
</body>
</html>