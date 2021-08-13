<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.nav_list {
	text-decoration: none;
	color: white;
}
</style>
<nav class="navbar navbar-dark bg-dark"
	aria-label="First navbar example">
	<div class="container-fluid">
		<a class="navbar-brand" href="/main.wow">EzMatch</a>
		<button class="navbar-toggler collapsed" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarsExample01"
			aria-controls="navbarsExample01" aria-expanded="false"
			aria-label="Toggle navigation">
			<a class="nav_list" href="#">게시판</a>
		</button>
		<button class="navbar-toggler collapsed" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarsExample02"
			aria-controls="navbarsExample02" aria-expanded="false"
			aria-label="Toggle navigation">
			<a class="nav_list" href="#">팀</a>
		</button>
		<button class="navbar-toggler collapsed" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarsExample03"
			aria-controls="navbarsExample03" aria-expanded="false"
			aria-label="Toggle navigation">
			<a class="nav_list" href="#">이적시장</a>
		</button>

		<div class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="dropdown01"
				data-bs-toggle="dropdown" aria-expanded="false">${sessionScope.MEM_INFO.memName}님
				환영합니다.</a>
			<ul class="dropdown-menu" aria-labelledby="dropdown01">
				<li>
					<form action="/mypage/info.wow" method="post">
						<button class="dropdown-item">마이페이지</button>
					</form>
				</li>
				<c:if test="${sessionScope.MEM_INFO.memRole eq 'MANAGER' }">
					<li>
						<form action="/admin/memList.wow" method="post">
							<button class="dropdown-item">회원 목록</button>
						</form>
					</li>
				</c:if>
				<li><a class="dropdown-item" href="/mypage/record.wow">개인기록</a></li>
				<li><a class="dropdown-item" href="/login/logout.wow">로그아웃</a></li>
			</ul>
		</div>


		<div class="collapse navbar-collapse" id="navbarsExample01">
			<ul class="navbar-nav me-auto mb-2">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="/free/boardList.wow">자유 게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="/matchList.wow">현재
						신청가능한 경기</a></li>
			</ul>
		</div>

		<div class="collapse navbar-collapse" id="navbarsExample02">
			<ul class="navbar-nav me-auto mb-2">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="/team/teamList.wow"> 팀 목록 </a></li>
				<c:choose>
					<c:when test="${sessionScope.MEM_INFO.memTeamName == null}">
						<li class="nav-item"><a class="nav-link"
							href="/team/teamForm.wow"> 팀 생성 </a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link"
							href="/team/teamView.wow?teamName=${sessionScope.MEM_INFO.memTeamName}">
								내 팀 </a></li>
					</c:otherwise>
				</c:choose>
				<c:if test="${sessionScope.MEM_INFO.memTeamName != null }">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="/tatics/taticsView.wow"> 팀 전술 </a></li>
				</c:if>
			</ul>
		</div>
		<div class="collapse navbar-collapse" id="navbarsExample03">
			<ul class="navbar-nav me-auto mb-2">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="/openings/offerList.wow"> 선수 구해요 </a></li>
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="/openings/searchList.wow"> 팀 구해요 </a></li>
			</ul>
		</div>
	</div>
</nav>

<script type="text/javascript">
	// 네비게이션 바
	$("nav").find("button.navbar-toggler").on("mouseenter", function() {
		if ($("button.navbar-toggler").not(".collapsed")[0] != $(this)[0]) {
			$("nav").find("button.navbar-toggler").not(".collapsed").click();
		} else {
			return;
		}
		this.click();
	});
	$("nav").on("mouseleave", function() {
		$("nav").find("button.navbar-toggler").not(".collapsed").click();
		console.log(this);
	});
</script>
