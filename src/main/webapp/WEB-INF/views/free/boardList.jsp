<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<tag:header />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<body>
	<tag:navbar />



	<div class="container py-4">
		<!-- START : 목록건수 및 새글쓰기 버튼  -->
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-3 form-inline">
				전체 ${searchVO.totalRowCount }건 조회 <select id="id_rowSizePerPage"
					name="rowSizePerPage" class="form-control input-sm">
					<c:forEach var="i" begin="10" end="50" step="10">
						<option value="${i}"
							${i eq searchVO.rowSizePerPage ? "selected='selected'" : "" }>${i }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<!-- END : 목록건수 및 새글쓰기 버튼  -->

		<form action="boardList.wow?curPage=1" method="post" name="search">
			<!-- 폼 액션 서브밋 -->
			<input type="hidden" id="text_row" value="${searchVO.rowSizePerPage }"
				name="rowSizePerPage"> <input type="hidden" name="curPage"
				value="${searchVO.curPage }">
			<!-- 38 글작성 버튼생성 -->
			<button type="button" onclick="location.href='boardForm.wow' "
				class="btn btn-primary">글등록</button>
		<table class="table">
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">글분류</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
						<th scope="col">작성자</th>
						<c:if test="${sessionScope.MEM_INFO.memRole eq 'MANAGER' }">
							<th scope="col">삭제/복구</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList }" var="board">
						<c:if
							test="${board.boDelYn eq 'N' || sessionScope.MEM_INFO.memRole eq 'MANAGER' }">
							<tr>
								<td>${board.boNo }</td>
								<td><a href="boardView.wow?boNo=${board.boNo }">${board.boTitle }</a></td>
								<td>${board.cateKname }</td>
								<td>${board.boHit }</td>
								<td>${board.boRegDate }</td>
								<td>${board.boWriter }</td>
								<c:if test="${sessionScope.MEM_INFO.memRole eq 'MANAGER' }">
									<c:if test="${board.boDelYn eq 'N' }">
										<td>
											<a class="btn btn-primary" data-page="${board.boNo }" href="#" onclick="f_del(this)">삭제</a>
										</td>
									</c:if>
									<c:if test="${board.boDelYn eq 'Y' }">
										<td>
											<a class="btn btn-primary" data-page="${board.boNo }" href="#" onclick="f_rst(this)">복구</a>
										</td>
									</c:if>
								</c:if>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			<!-- search 시작 -->
			<!-- <div style="position: absolute; left: 600px"> -->
			<div class="row text-center" style="width: 100%">
				<div style="width: 50%; float: none; margin: 0 auto">
					<!-- <div style="display: inline-block;text-align: center; float: none; margin:0 auto;">   -->
					<!--  <div  style="float: none; margin:0 auto;"> -->
					<select name="searchType">
						<!-- T 제목 W 작성자 C 내용 -->
						<option value="T"
							${search.searchType eq 'T' ? "selected='selected'" : "" }>제목</option>
						<option value="W"
							${search.searchType eq 'W' ? "selected='selected'" : "" }>작성자</option>
						<option value="C"
							${search.searchType eq 'C' ? "selected='selected'" : "" }>내용</option>
					</select> <input type="text" value="${search.searchWord }" name="searchWord"
						placeholder="검색어를 입력하세요""> <input type="submit" value="검색">
					<br>

					<!-- 페이징 시작 -->
					<!-- pagingVO에 있는 객체들을 search에 담고 넣어줌 -->
					<!-- << 버튼 만들기 -->
					<c:if test="${searchVO.firstPage ne 1}">
						<a data-page="1" href="#" onclick="f_ck(this)">&lt;&lt;</a>
					</c:if>

					<!-- < 버튼 만들기 -->
					<c:if test="${searchVO.firstPage ne 1}">
						<a data-page="${searchVO.firstPage - searchVO.pageSize }" href="#"
							onclick="f_ck(this)">&lt;</a>
					</c:if>

					<c:forEach begin="${searchVO.firstPage }"
						end="${searchVO.lastPage }" var="i">
						<c:if test="${i == searchVO.curPage}">
							<a style="font-size: 20px;">${i }</a>
						</c:if>
						<c:if test="${i != searchVO.curPage}">
							<a data-page="${i }" href="#" onclick="f_ck(this)">${i }</a>
						</c:if>
					</c:forEach>

					<!-- > 버튼 만들기 -->
					<c:if test="${searchVO.lastPage ne searchVO.totalPageCount}">
						<a data-page="${searchVO.firstPage + searchVO.pageSize }" href="#"
							onclick="f_ck(this)">&gt;</a>
					</c:if>

					<!-- >> 버튼 만들기 -->
					<c:if test="${searchVO.curPage ne searchVO.totalPageCount}">
						<a data-page="${searchVO.totalPageCount }" href="#"
							onclick="f_ck(this)">&gt;&gt;</a>
					</c:if>
					<!-- 페이징 끝 -->
				</div>
			</div>

		</form>
		<script type="text/javascript">
			function f_ck(tag) {
				//a링크의 이벱트 막기, 검색할 때 페이징 넘기면 초기화 되는 거 때문에 onclick="f_ck(this)" 줌 
				event.preventDefault();
				document.forms[2].action = "boardList.wow?curPage="
						+ $(tag).attr('data-page');
				document.forms[2].submit();
				//console.log(tag);
			}

			$('#id_rowSizePerPage').change(function(e) {
				console.log(document.forms[2]);
				$("#text_row").val(this.value);
				document.forms[2].submit();

			}); // '#id_rowSizePerPage'.change
			
			function f_del(tag) {
				event.preventDefault();
				document.forms[2].action = "/admin/boDelete.wow?boNo="
						+ $(tag).attr('data-page');
				document.forms[2].submit();
			}
			
			function f_rst(tag) {
				event.preventDefault();
				document.forms[2].action = "/admin/boRestore.wow?boNo="
						+ $(tag).attr('data-page');
				document.forms[2].submit();
			}
		</script>
	</div>
</body>
</html>