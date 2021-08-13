<%@page import="com.nextit.tatics.vo.TaticsVO"%>
<%@page import="com.nextit.team.vo.TeamVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
  <head>
  <tag:header/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
	 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>Dashboard Template · Bootstrap v5.0</title>

    

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

    <style>
    
    #highImg{
	  width: 200px;
	  height: 200px;
	  object-fit: cover;
	  border-radius: 200px;
	  border: 5px solid;
    }
    
            /* 원시작 */
    html,
        body {
            padding: 0;
            margin: 0;
            width: 100%;
            height: 100%;
        }

        /* 공이 자유자재로 움직일 수 있도록 position을 'absolute'로 설정 */
        .ball {
            position: absolute;
        }

        /* 공을 선택했을 때, 그림자가 생기도록 설정 */
        .ball:hover {
            box-shadow: 0 0 10px 0 darkgray;
            cursor: pointer;
        }

		/* 공의 색상 설정 */
        .pink {
            background-image: url('/resources/images/uni1.png');
            background-size: 75px 75px;
        }
        
        
        

        /* 공의 크기 설정 */


        .s50 {
            width: 75px;
            height: 75px;
            border-radius: 75px;
            text-align: center;
            color: white;
            font-weight: bold;
            line-height: 69px;
            
        }
        
        /* 원끝 */
    
    
      .bd-placeholder-img {
        font-size: 1.5rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 10rem;
        }
      }
    </style> 
    
    <!-- 원 스크립트 시작  -->
    <script>
        // js/event_handler.js

        // 공 선택 이벤트 핸들러
        function handleMouseDown(event) {
            event.preventDefault();;

            const balls = document.querySelectorAll(".ball");
            const el = event.target;
            const classList = el.classList;

            if (!classList.contains("hold")) {
                // 공을 클릭했을 때, 마우스 커서의 XY좌표
                const mouseX = event.clientX;
                const mouseY = event.clientY;

                // 선택한 공의 XY좌표 (왼쪽 상단 모서리 기준)
                const ballPos = el.getBoundingClientRect();
                const ballX = ballPos.x;
                const ballY = ballPos.y;

                // 선택한 공 안에 있는 마우스 커서의 XY좌표
                const gapX = mouseX - ballX;
                const gapY = mouseY - ballY;

                el.setAttribute("gap-x", gapX);
                el.setAttribute("gap-y", gapY);

                // 선택한 공을 맨 앞으로 가지고 오기
                const maxPriority = (
                    balls.length > 0
                        ? Math.max.apply(null, Array.from(balls).map(ball => ball.getAttribute("priority")))
                        : 9999
                ) + 1;
                el.setAttribute("priority", maxPriority);
                el.style["z-index"] = maxPriority;

                // 선택한 공에 'hold' class를 추가
                classList.add("hold");
            }
        }

        // 공 움직임 이벤트 핸들러
        function handleMouseMove(event) {
            event.preventDefault();

            const el = document.querySelector(".ball.hold");
            if (el) {
                // 움직이는 마우스 커서의 XY좌표
                const mouseX = event.clientX;
                const mouseY = event.clientY;

                // 선택한 공 안에 있는 마우스 커서의 XY좌표
                const gapX = el.getAttribute("gap-x");
                const gapY = el.getAttribute("gap-y");

                // 마우스 커서의 위치에 따른 공의 XY좌표
                const ballX = mouseX - gapX;
                const ballY = mouseY - gapY;

                // 공의 위치를 변경
                el.style.left = ballX + "px";
                el.style.top = ballY + "px";
            }
        }

        // 공 놓기 이벤트 핸들러
        function handleMouseUp(event) {
            event.preventDefault();

            const el = document.querySelector(".ball.hold");
            if (el) {
                // 움직이면 적용된 속성 및 class를 삭제
                el.removeAttribute("gap-x")
                el.removeAttribute("gap-y")

                el.classList.remove("hold");
            }
        }
    </script>
    <!-- 원 스크립트 끝  -->

    
    <!-- Custom styles for this template -->
  </head>
  <body>
    <tag:navbar/>


<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
<div id="id_div_lst"></div>
    <div id="wrapper"></div>


	<script>
	
	
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
	
	
        var v_lst = [
        	<c:forEach items="${teamList }" var="team" varStatus="st">
        		"${team.ttsMemName}"
        		<c:if test="${not st.last}">,</c:if>
        	</c:forEach>
        ];
        
        var v_posi = [
        	<c:forEach items="${teamList }" var="team" varStatus="st">
        		"${team.ttsMemPos}"
        		<c:if test="${not st.last}">,</c:if>
        	</c:forEach>
        ];
        
        var str = "<table class='table table-striped table-hover'><tr><td>포지션</td><td>이름</td></tr>"
        for (i = 0; i < v_lst.length; i++) {
            str += "<tr><td>" + v_posi[i] + "</td>";
            str += "<td><a href='#' onclick=f_create(this)>" + v_lst[i] + "</a></td></tr>";
        }
        str += "</table>"
        $("#id_div_lst").html(str)

        function f_create(tag) {
            var v_name = $(tag).html()
            tag.onclick = function () {
            	swal("이미 존재합니다.", "필드에 없는 선수를 선택해주세요!", "error");
            }
            $("<div>").addClass("ball pink s50")
            			   .attr("id","drag1")
            			   .attr("draggable","true")
            			   .attr("ondragstart","drag(event)")
                      .html(v_name)
                      .appendTo($("#id_div2"))
            const balls = document.querySelectorAll(".ball");

            balls.forEach(function (ball, idx) {
                // 공의 우선순위 설정
                let priority = ball.getAttribute("priority");
                if (!priority) {
                    priority = idx + 1;
                    ball.setAttribute("priority", priority);
                }
                ball.style["z-index"] = priority;

                // 공 선택 이벤트 바인딩
                ball.addEventListener('mousedown', handleMouseDown);
            });

            // 마우스 이벤트 바인딩
            document.addEventListener('mousemove', handleMouseMove);
            document.addEventListener('mouseup', handleMouseUp);
        }

    </script>
    </nav>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">전술보드</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
      </div>

      <div class="my-4 w-100" ondrop="drop(event)" ondragover="allowDrop(event)" id="div1" style="text-align: center;">
	       <div id="id_div2"></div> 

      	<img src="/resources/images/board2.jpeg" style="width: 700px; height: 490px;">
      		<br><br><h2>포지션별 세부지침</h2><br>
      		<div class="container" style="text-align: center;">
      		
				<div class="col-lg-3" style="float: none; margin:0 auto;">
					<form class="form-floating">
					  <input type="email" class="form-control" id="floatingInputValue" value="">
					  <label for="floatingInputValue">공격수</label>
					</form>			
				</div>
				<br>
				<div class="col-lg-3" style="float: none; margin:0 auto;">
					<form class="form-floating">
					  <input type="email" class="form-control" id="floatingInputValue"  value="">
					  <label for="floatingInputValue">미드필더</label>
					</form>			
				</div>
				<br>
				<div class="col-lg-3" style="float: none; margin:0 auto;">
					<form class="form-floating">
					  <input type="email" class="form-control" id="floatingInputValue" value="">
					  <label for="floatingInputValue">수비수</label>
					</form>			
				</div>
				
			</div>
      	</div>
       <button type="button" onclick="downImg()">이미지 저장</button>
       
       <script type="text/javascript">
       
       
       
       /*  */
       function allowDrop(ev) {
           ev.preventDefault();
       }
    
       function drag(ev) {
           ev.dataTransfer.setData("text", ev.target.id);
       }
    
       function drop(ev) {
           ev.preventDefault();
           var data = ev.dataTransfer.getData("text");
           ev.target.appendChild(document.getElementById(data));
       }
		/*  */
       
       
       //이미지(png)로 다운로드
       function downImg(){
           html2canvas($("#div1")[0]).then(function(canvas){
               var myImage = canvas.toDataURL();
               console.log(myImage);	
               downloadURI(myImage, "저장할 파일명.png") 
           });
       }

       function downloadURI(uri, name){
           var link = document.createElement("a")
           link.download = name;
           link.href = uri;
           document.body.appendChild(link);
           link.click();
       }
       
       
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
       
       
      <br>
      
      <hr>
      
      
      <h2>선수 기록</h2> <br>      
          <!-- Three columns of text below the carousel -->
    <div class="row" style="text-align: center;">
    
    <div class="col-lg-2"></div>
      <div class="col-lg-4">
      <h1>득점 1위</h1>
      	<img alt="" id="highImg" src="${highGoal.ttsMemImageUrl }"> <br><br>
      <h3>${highGoal.ttsMemName }</h3>
      <h3>${highGoal.ttsTotalGoal }골</h3>
      </div><!-- /.col-lg-4 -->
      
      
      <div class="col-lg-4">
      <h1>도움 1위</h1>
      	<img alt="" id="highImg" src="${highAssi.ttsMemImageUrl }"> <br><br>
      <h3>${highAssi.ttsMemName }</h3>
      <h3>${highAssi.ttsTotalAssi }도움</h3>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
    
    
    <!-- /END THE FEATURETTES -->
    <br><br> 
      
      
      
      
      

      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th>포지션</th>
              <th>이름</th>
              <th>경기수</th>
              <th>골</th>
              <th>어시스트</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${teamList }" var="team">
				<tr>
					<td>${team.ttsMemPos }</td>
					<c:if test="${sessionScope.MEM_INFO.memName eq team.ttsMemName}">
						<td style="color:red;">${team.ttsMemName }</td>
					</c:if>
					<c:if test="${sessionScope.MEM_INFO.memName ne team.ttsMemName}">
						<td>${team.ttsMemName }</td>
					</c:if>
					<td>${team.ttsCnt }</td>
					<td>${team.ttsGoal }</td>
					<td>${team.ttsAssi }</td>
				</tr>
			</c:forEach>
          </tbody>
        </table>
      </div>
    </main>
  </div>
</div>



  </body>
</html>
