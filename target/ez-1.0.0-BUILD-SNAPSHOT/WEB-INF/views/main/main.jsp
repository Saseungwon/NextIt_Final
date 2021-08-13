<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<tag:header/>
<style>
	.img-thumbnail {
		width: 100px;
		height: 100px;
	}
	
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

/* Carousel스타일 시작 */

/* GLOBAL STYLES
-------------------------------------------------- */
/* Padding below the footer and lighter body text */

body {
  padding-bottom: 3rem;
  color: #5a5a5a;
}


/* CUSTOMIZE THE CAROUSEL
-------------------------------------------------- */

/* Carousel base class */
.carousel {
  margin-bottom: 4rem;
}
/* Since positioning the image, we need to help out the caption */
.carousel-caption {
  bottom: 3rem;
  z-index: 10;
}

/* Declare heights because of positioning of img element */
.carousel-item {
  height: 32rem;
}
.carousel-item > img {
  position: absolute;
  top: 0;
  left: 0;
  min-width: 100%;
  height: 32rem;
}


/* MARKETING CONTENT
-------------------------------------------------- */

/* Center align the text within the three columns below the carousel */
.marketing .col-lg-4 {
  margin-bottom: 1.5rem;
  text-align: center;
}
.marketing h2 {
  font-weight: 400;
}
/* rtl:begin:ignore */
.marketing .col-lg-4 p {
  margin-right: .75rem;
  margin-left: .75rem;
}
/* rtl:end:ignore */


/* Featurettes
------------------------- */

.featurette-divider {
  margin: 5rem 0; /* Space out the Bootstrap <hr> more */
}

/* Thin out the marketing headings */
.featurette-heading {
  font-weight: 300;
  line-height: 1;
  /* rtl:remove */
  letter-spacing: -.05rem;
}


/* RESPONSIVE CSS
-------------------------------------------------- */

@media (min-width: 40em) {
  /* Bump up size of carousel content */
  .carousel-caption p {
    margin-bottom: 1.25rem;
    font-size: 1.25rem;
    line-height: 1.4;
  }

  .featurette-heading {
    font-size: 50px;
  }
}

@media (min-width: 62em) {
  .featurette-heading {
    margin-top: 7rem;
  }
}
/* Carousel스타일 끝 */
	
</style>
</head>
<body>
<tag:navbar/>

  

 <div id="myCarousel" class="carousel slide" data-bs-ride="carousel" style="width: 100%;">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
    
      <div class="carousel-item active">
			<img alt="" src="/resources/images/stadium.jpg" style="object-fit: cover; opacity: 0.85;"> 
        <div class="container">
          <div class="carousel-caption text-start">
            <h1 style="font-size: 80px;">EzMatch</h1> <br>
            <p><a class="btn btn-lg btn-secondary" href="/team/teamList.wow">팀 가입하기</a></p>
          </div>
        </div>
      </div>
       
      
      <div class="carousel-item">
       <img alt="" src="/resources/images/chelsea.jpg"  style="object-fit: cover; opacity: 0.85;">
        <div class="container"> 
          <div class="carousel-caption">
            <h1 style="font-size: 80px;">EzMatch</h1> <br>
            <p><a class="btn btn-lg btn-secondary" href="matchList.wow">경기신청</a></p>
          </div>
        </div>
      </div>
      
       
      <div class="carousel-item">
        <img alt="" src="/resources/images/torres.jpg" style="object-fit: cover; opacity: 0.85;"> 
        <div class="container">
          <div class="carousel-caption text-end">
             <h1 style="font-size: 80px;">EzMatch</h1> <br>
            <p><a class="btn btn-lg btn-secondary" href="/free/boardList.wow">글쓰기</a></p>
          </div>
        </div>
      </div>
      
    </div>
    
    
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div> 

<div class="container">
  <div class="row align-items-center">

    <div class="col" style="text-align: center;"> <br><br><br><br>
    	<h3>최근 기사</h3><br><br>
   <div>
	    <c:forEach items="${articleList}" var="article">
	    <div>
	      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
	        <div class="col p-4 d-flex flex-column position-static">
	          <h7 class="mb-0">${article.atcTitle}</h7>
	          <a href="${article.atcLink}" class="stretched-link" target="blank">내용보기</a>
	        </div>
	        <div class="col-auto d-none d-lg-block">
	        
	          <img src="${article.atcImg}" class="img-thumbnail">
	        </div>
	      </div>
	    </div>
	  </c:forEach>
  </div>
    </div>
    
        	<!-- <a href="/free/boardList.wow"><p>자유 게시판</p></a> -->
    <div class="col" style="text-align: center; font-size: 18px;">
    
    
	<h3>자유게시판</h3>    
		<ul class="nav justify-content-end">
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="/free/boardList.wow">전체보기</a>
		  </li>
		</ul>
		    <table class="table">
			  <thead>
			    <tr>
			      <th scope="col">분류</th>
			      <th scope="col">제목</th>
			    </tr>
			  </thead>
			  <tbody>
			  		<c:forEach items="${freeList}" var="free">
					    <tr>
					      <td>[${free.cateKname}]</td>
					      <td><a href="/free/boardView.wow?boNo=${free.boNo}"> ${free.boTitle}</a></td>
					    </tr>
					</c:forEach>
			  </tbody>
		</table>
   </div>
    
      <div class="col" style="text-align: center; font-size: 18px;">
    
    	<c:if test="${openingsList[0].boSubCate == 'OFFER'}">
    	
    	<h3>선수 구합니다</h3>    
		<ul class="nav justify-content-end">
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="/openings/offerList.wow">전체보기</a>
		  </li>
		</ul>
    	</c:if>
    	<c:if test="${openingsList[0].boSubCate == 'SEARCH'}">
    	<h3>팀 구합니다</h3>    
		<ul class="nav justify-content-end">
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="openings/searchList.wow">전체보기</a>
		  </li>
		</ul>
    	
    	</c:if>
    	
    	 <table class="table">
			  <thead>
			    <tr>
			      <th scope="col">포지션</th>
			      <th scope="col">제목</th>
			    </tr>
			  </thead>
			  <tbody>
			  		<c:forEach items="${openingsList}" var="openings">
					    <tr>
					      <td>[${openings.boPos}]</td>
					      <td><a href="/openings/openingsView.wow?boNo=${openings.boNo}">${openings.boTitle}</a></td>
					    </tr>
					</c:forEach>
			  </tbody>
		</table>
	    	
    </div>
  </div>
</div>
</body>
</html>