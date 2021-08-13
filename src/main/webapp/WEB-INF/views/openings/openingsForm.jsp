<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tag"  tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<tag:header/>
</head>
<body>
<tag:navbar/>

	<div class="container">
		<div class="page-header">
			<h3>
				이적시장 - 
				<c:if test="${sessionScope.MEM_INFO.memTeamName == null}">
					<small>팀 구함</small>
				</c:if>
				<c:if test="${sessionScope.MEM_INFO.memTeamName != null}">
					<small>선수 구함</small>
				</c:if>
			</h3>
		</div>
		<form:form action="openingsRegist.wow" method="post" modelAttribute="board" enctype="multipart/form-data">
			<table class="table table-striped table-bordered">
				<colgroup>
					<col width="20%" />
					<col />
				</colgroup>
				
				<tr>
					<th>제목</th>
					<td>
						<form:input path="boTitle"/>
						<form:errors path="boTitle"/>
						<input type="hidden" name="boCate" value="OPENINGS">
						<input type="hidden" name="boMemId" value="${sessionScope.MEM_INFO.memId}">
					</td>
				</tr>
				
				<c:if test="${sessionScope.MEM_INFO.memTeamName == null}">
					<tr>
						<th>회원명</th>
						<td>
							<input type="text" name="boWriter" value="${sessionScope.MEM_INFO.memName}" readonly="readonly"/>
							<input type="hidden" name="boSubCate" value="SEARCH">
						</td>
					</tr>
				</c:if>
				
				<c:if test="${sessionScope.MEM_INFO.memTeamName != null}">
					<tr>
						<th>팀명</th>
						<td>
							<input type="text" name="boTeamName" value="${sessionScope.MEM_INFO.memTeamName }" readonly="readonly"/>
							<input type="hidden" name="boSubCate" value="OFFER">
						</td>
					</tr>
				</c:if>
				
				<tr>
					<th>포지션</th>
					<td>
						<form:select path="boPos">
							<form:options items="${posList}" itemLabel="cateKname" itemValue="cateName"/>
						</form:select>
						<form:errors path="boPos"/>
					</td>
				</tr>		

				<tr>
					<th>내용</th>
					<td>
						<form:textarea path="boContent"/>
						<form:errors path="boContent"/>
					</td>
				</tr>
				
				<tr>
					<th>첨부파일
						<button type="button" id="id_btn_new_file">추가</button>
					</th>
					<td class="file_area">
						<div class="form-inline">
							<input type="file" name="boFiles" class="form-control">
							<button type="button" class="btn_delete btn btn-sm">삭제</button>
						</div>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<div class="pull-left">
							<c:if test="${sessionScope.MEM_INFO.memTeamName == null}">
								<a href="offerList.wow" class="btn btn-default btn-sm">
									<span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;&nbsp;목록
								</a>
							</c:if>
							<c:if test="${sessionScope.MEM_INFO.memTeamName != null}">
								<a href="searchList.wow" class="btn btn-default btn-sm">
									<span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;&nbsp;목록
								</a>
							</c:if>
						</div>
						<div class="pull-right">
							<button type="submit" class="btn btn-sm btn-primary">
								<span class="glyphicon glyphicon-save" aria-hidden="true"></span> &nbsp;&nbsp;저장
							</button>
						</div>
					</td>
				</tr>
			</table>
		</form:form>
	</div>
	<!-- container -->
<script type="text/javascript">
	$('#id_btn_new_file').click(function(){
		$('.file_area').append('<div class="form-inline">'
			+ '<input type="file" name="boFiles" class="form-control">'
			+ ' <button type="button" class="btn_delete btn btn-sm">삭제</button>'
			+ '</div>');
	}); // #id_btn_new_file.click
	
	// 상위객체를 통해 이벤트 위임
	$('.file_area').on('click','.btn_delete', function(){
		$(this).closest('div').remove();
	});
</script>
</body>
</html>


