<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="description" content="">
 <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
 <meta name="generator" content="Hugo 0.83.1">
 <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/carousel/">
<link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
	
	img { display: block; margin: 0px auto; }
      
    </style>
    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet"> 
<tag:header/>
</head>
<body>
<tag:navbar/>
<header>
</header>
  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

<br><br><br><br>
  <div class="container marketing">


    <!-- START THE FEATURETTES -->


    <div class="row featurette">
      <div class="col-md-7 order-md-2">
      
        <h2 class="featurette-heading">${team.teamName} <span class="text-muted">-  ${team.teamRegion}</span></h2>
        <p class="lead">팀 등록일 : ${team.teamRegDate} </p>
        <p class="lead">소속리그 : ${team.teamLeague}부 리그 </p>
        <p class="lead">팀 소개 <br> ${team.teamProfile}</p>
        <c:if test="${sessionScope.MEM_INFO.memTeamName eq null }">
	       <button type="button" onclick="location.href='teamJoin.wow?teamName=${team.teamName}' " class="btn btn-primary">가입 신청</button>
        </c:if>
        <c:if test="${sessionScope.MEM_INFO.memTeamName eq team.teamName }">
        	<button type="button" onclick="location.href='/tatics/taticsView.wow' " class="btn btn-primary">팀 전술</button>
        </c:if>
        <c:if test="${sessionScope.MEM_INFO.memTeamName ne team.teamName }">
        	<c:if test="${sessionScope.MEM_INFO.memTeamRole eq 'MANAGER' }">
	        	<button type="button" onclick="location.href='친선전신청페이지' " class="btn btn-primary">친선전 신청</button>
    	    </c:if>
   	    </c:if>
   	    <c:if test="${sessionScope.MEM_INFO.memTeamName eq team.teamName }">
	       <button type="button" onclick="location.href='teamQuit.wow' " class="btn btn-primary">팀 탈퇴</button>
        </c:if>
        
        <c:if test="${team.teamName eq sessionScope.MEM_INFO.memTeamName }">
        	<c:if test="${sessionScope.MEM_INFO.memTeamRole eq 'MANAGER' }">
		       <button type="button" onclick="location.href='recordForm.wow' " class="btn btn-primary">경기결과 등록</button>  
        	</c:if>
        </c:if>
       
      </div>
      <div class="col-md-5 order-md-1">
		<img alt="" src="${team.teamImageUrl }" width="300px" height="300px"> 
      </div>
    </div> <br><br>

    	
    
  </div><!-- /.container -->


    <script src="/docs/5.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

      













</body>
</html>