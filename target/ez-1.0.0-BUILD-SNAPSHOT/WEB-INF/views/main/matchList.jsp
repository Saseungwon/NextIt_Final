<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<tag:header/>
</head>
<body>
<tag:navbar/>
<%-- <ul>
	<c:forEach items="${matchInfoList}" var="info">
		<li>대회명 : ${info.matchName}</li>
		<li>신청일 : ${info.matchStart} ~ ${info.matchEnd}</li>
	</c:forEach>
</ul> --%>


<main>

  <section class="py-5 text-center container"> 
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw" style="font-size: 50px;">진행중인 대회</h1>
      </div>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      
      
      <c:forEach items="${matchInfoList}" var="info">
        <div class="col"> 	 
          <div class="card shadow-sm">
          	<img alt="" src="${info.matchImage}" style="width: 100%; height: 400px;">


            <div class="card-body" style="text-align: center;">
              <p class="card-text" style="font-size: 30px;">대회명 : ${info.matchName}</p>
              <p class="card-text" style="font-size: 20px;">일정 : ${info.matchStart} - ${info.matchEnd}</p>
              
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                </div>
                  <button type="button" class="btn btn-sm btn-outline-secondary">신청하기</button>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>

      </div>
    </div>
  </div>

</main>

</body>
</html>