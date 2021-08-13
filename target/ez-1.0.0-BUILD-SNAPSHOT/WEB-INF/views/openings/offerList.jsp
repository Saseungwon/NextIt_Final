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
<body>
	<tag:navbar />
	<div class="container py-4">
		<form id="form_search" action="offerList.wow?curPage=1" method="post">
			<!-- 폼 액션 서브밋 -->
			<!-- 38 글작성 버튼생성 -->
			<button type="button" onclick="location.href='openingsForm.wow'"
				class="btn btn-primary">글등록</button>
			<div id="disp_sel">
				<select name="posCate">
					<option value="">전체 포지션</option>
					<c:forEach items="${posList}" var="pos">
						<option value="${pos.cateName}" ${search.posCate == pos.cateName ? "selected" : ""}>${pos.cateKname}</option>
					</c:forEach>
				</select>
				<select name="rowSizePerPage">
					<c:forEach begin="10" end="30" step="5" var="num">
						<option value="${num}" ${search.rowSizePerPage == num ? "selected" : ""}>${num}</option>
					</c:forEach>
				</select>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">포지션</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
						<th scope="col">작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${offerList}" var="offer">
						<tr>
							<td>${offer.boNo }</td>
							<td><a href="openingsView.wow?boNo=${offer.boNo }">${offer.boTitle }</a></td>
							<td>${offer.boPos}</td>
							<td>${offer.boHit }</td>
							<td>${offer.boRegDate }</td>
							<td>${offer.boWriter }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- search 시작 -->
			<!-- <div style="position: absolute; left: 600px"> -->
			<div class="row text-center" style="width: 100%">
				<div style="width: 50%; float: none; margin: 0 auto">
					<!-- <div style="display: inline-block;text-align: center; float: none; margin:0 auto;">   -->
					<!--  <div  style="float: none; margin:0 auto;"> -->
					<select name="searchCate">
						<!-- T 제목 W 작성자 C 내용 -->
						<option value="T"
							${search.searchCate eq 'T' ? "selected='selected'" : "" }>제목</option>
						<option value="W"
							${search.searchCate eq 'W' ? "selected='selected'" : "" }>작성자</option>
						<option value="C"
							${search.searchCate eq 'C' ? "selected='selected'" : "" }>내용</option>
					</select> <input type="text" value="${search.searchWord }" name="searchWord"
						placeholder="검색어를 입력하세요""> <input type="submit" value="검색"><input type="button" value="초기화" onclick="location.href='offerList.wow'">
					<br>

					<!-- 페이징 시작 -->
					<!-- pagingVO에 있는 객체들을 search에 담고 넣어줌 -->
					<!-- << 버튼 만들기 -->
					<c:if test="${search.firstPage ne 1}">
						<a data-page="1" href="#" onclick="f_ck(this)">&lt;&lt;</a>
					</c:if>

					<!-- < 버튼 만들기 -->
					<c:if test="${search.firstPage ne 1}">
						<a data-page="${search.firstPage - search.pageSize }" href="#"
							onclick="f_ck(this)">&lt;</a>
					</c:if>

					<c:forEach begin="${search.firstPage }" end="${search.lastPage }" var="i">
						<c:if test="${search.curPage == i}">
							<a style="fontSize:15px;">${i}</a>
						</c:if>
						<c:if test="${search.curPage != i}">
							<a data-page="${i }" href="#" onclick="f_ck(this)">${i }</a>
						</c:if>
					</c:forEach>

					<!-- > 버튼 만들기 -->
					<c:if test="${search.lastPage ne search.totalPageCount}">
						<a data-page="${search.firstPage + search.pageSize }" href="#"
							onclick="f_ck(this)">&gt;</a>
					</c:if>

					<!-- >> 버튼 만들기 -->
					<c:if test="${search.lastPage ne search.totalPageCount}">
						<a data-page="${search.totalPageCount }" href="#"
							onclick="f_ck(this)">&gt;&gt;</a>
					</c:if>
					<!-- 페이징 끝 -->
				</div>
			</div>


		</form>
		<script type="text/javascript">
			function f_ck(tag) {
				//a링크의 이벤트 막기, 검색할 때 페이징 넘기면 초기화 되는 거 때문에 onclick="f_ck(this)" 줌 
				event.preventDefault();
				$("#form_search").attr('action', "offerList.wow?curPage="+ $(tag).attr('data-page'));
				$("#form_search").submit();
			}
			// 레코드 수, 분류 셀렉트
			$("#disp_sel").on("change", function() {
				$("#form_search").submit();
			});
		</script>
	</div>
</body>
</html>