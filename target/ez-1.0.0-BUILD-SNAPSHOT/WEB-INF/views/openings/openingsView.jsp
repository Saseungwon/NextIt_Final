<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>자유게시판  글 보기</title>
<tag:free_header/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<!-- 
<style>
#id_re_str{
	position: relative; 
	left:10px;
}
</style>
 -->
 <body>

	<div class="container">
		<div class="page-header">
			<h3>
				자유게시판  <small>글 보기</small>
			</h3>
		</div>
	
		<table class="table table-striped table-bordered">
			<tbody>
				<tr>
					<th>글번호</th>
					<td>${openings.boNo }</td>
				</tr>
				<tr>
					<th>분류</th>
					<td>${openings.cateKname }</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td>${openings.boTitle }</td>
				</tr>
				<tr>
					<th>작성자명</th>
					<td>${sessionScope.MEM_INFO.memName }</td>
				</tr>
				<!-- 비밀번호는 보여주지 않음  -->
				<tr>
					<th>내용</th>
					<td><textarea rows="10" name="boContent" class="form-control input-sm" readonly="readonly">${openings.boContent }</textarea></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<c:forEach var="f" items="${openings.attaches}" varStatus="st">
							<div>
								# 파일 ${st.count}
								<a href="<c:url value='/attach/download/${f.atchNo}' />" target="_blank">
									<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
									${f.atchOriginalName}
								</a>
								Size : ${f.atchFancySize} Down : ${f.atchDownHit}
							</div>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${openings.boHit }</td>
				</tr>
				<tr>
					<th>최근등록일자</th>
					<td>${openings.boModDate eq null ? board.boRegDate : board.boModDate}</td>
				</tr>
				<tr>
					<th>삭제여부</th>
					<td>${openings.boDelYn }</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="pull-left">
							<c:if test="${openings.boSubCate == 'OFFER'}">
								<a href="offerList.wow" class="btn btn-default btn-sm">
									<span class="glyphicon glyphicon-list" aria-hidden="true"></span>&nbsp;&nbsp;목록
								</a>
							</c:if>
							<c:if test="${openings.boSubCate == 'SEARCH'}">
								<a href="searchList.wow" class="btn btn-default btn-sm">
									<span class="glyphicon glyphicon-list" aria-hidden="true"></span>&nbsp;&nbsp;목록
								</a>
							</c:if>
						</div>
						<c:if test="${sessionScope.MEM_INFO.memId == openings.boMemId}">
							<div class="pull-right">
								<a href="boardEdit.wow?boNo=${openings.boNo }" class="btn btn-success btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> &nbsp;&nbsp;수정
								</a>
							</div>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

		<!-- 댓글 영역 -->
	<div class="container">
		<!-- // START : 댓글 등록 영역  -->
		<div class="panel panel-default">
			<div class="panel-body form-horizontal">
			
				<form name="frm_reply" action="<c:url value='/reply/replyRegist' />" method="post" onclick="return false;">
					<input type="hidden" name="reBoNo" value="${openings.boNo}">
					<input type="hidden" name="reBoNo" value="${reply.reParentNo}">
					<div class="form-group">
						<label class="col-sm-2  control-label">댓글</label>
						<div class="col-sm-8">
							<textarea rows="3" name="reContent" class="form-control"></textarea>
						</div>
						<div class="col-sm-2">
							<button id="btn_reply_regist" type="button" class="btn btn-sm btn-info">등록</button>
						</div>
					</div>
				</form>
				
				
			</div>
		</div>
		<!-- // END : 댓글 등록 영역  -->
		
		<!-- // START : 댓글 목록 영역  -->
		<div id="id_reply_list_area"></div>

		<div class="row text-center" id="id_reply_list_more">
			<a id="btn_reply_list_more" class="btn btn-sm btn-default col-sm-10 col-sm-offset-1">
			 <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span> 더보기
			</a>
		</div>
		<!-- // END : 댓글 목록 영역  -->

		<!-- START : 댓글 수정용 Modal -->
		<div class="modal fade" id="id_reply_edit_modal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<form name="frm_reply_edit" action="<c:url value='/reply/replyModify' />" method="post" onclick="return false;">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">댓글수정</h4>
						</div>
						<div class="modal-body">
							<input type="hidden" name="reNo" value="">
							<textarea rows="3" name="reContent" class="form-control"></textarea>
						</div>
						<div class="modal-footer">
							<button id="btn_reply_modify" type="button" class="btn btn-sm btn-info">저장</button>
							<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- END : 댓글 수정용 Modal -->
		
		
		<!-- START : 대댓글 Modal -->
		<div class="modal fade" id="id_re_reply_modal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<form name="frm_re_reply" action="<c:url value='/reply/replyRegist' />" method="post" onclick="return false;">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h4 class="modal-title">답글 쓰기</h4>
						</div>
						<div class="modal-body">
							<input type="hidden" name="reBoNo" value="${openings.boNo}" >
							<input type="hidden" name="reParentNo" value="">
							<textarea rows="3" name="reContent" class="form-control"></textarea>
						</div>
						<div class="modal-footer">
							<button id="btn_re_reply" type="button" class="btn btn-sm btn-info">저장</button>
							<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		
		
		<!-- END : 댓글 수정용 Modal -->		
	</div>
	<!-- reply container -->


	<!-- START : 댓글 처리 스크립트 -->
<script type="text/javascript">
// 상단에 전역변수 - 공통함수 - 이벤트 함수 - 초기화처리  
var replyParam = {
		"curPage":1, "rowSizePerPage":5, "reBoNo":${openings.boNo}
}

// 댓글목록을 구하는 함수
function fn_reply_list(){
	
	$.ajax({ 
		  type :"POST"
		, url : '<c:url value="/reply/replyList" />' 		
		, dataType : 'json' 
		, data : replyParam	
		, success : function(data) {
				// console.log('data', data);
				if(data.result){				
					// find : (.+)   repl : str += '$1';
					$reply_list_area = $('#id_reply_list_area');
					$.each(data.data, function(i, el) {    
						console.log(i, el);
						// console.log('${sessionScope.USER_INFO.userId}');
						if(el.reParentNo == 0){
							var str = '<div class="row"  data-re-no="'+el.reNo+'" data-re-ParentNo="'+ el.reParentNo + '" id=id_' + el.reNo +' >';
							//str += '<div class="col-sm-1 text-right">' + '댓글번호'  + el.reNo + '</div>'
							//str += '<div class="col-sm-1 text-right">' + '부모번호'  + el.reParentNo + '</div>';
							str += '<div class="col-sm-1 text-right">'  + el.reWriter + '</div>';
							str += '<div class="col-sm-5">';
							str += '<pre>' + el.reContent + '</pre>';
							str += '</div>';
							str += '<div class="col-sm-2">' + el.reRegDate + '</div>';
							str += '<button name="btn_re_reply"  data-re-parent-no="' +  el.reNo  + '" type="button" class="btn btn-sm btn-success" data-bs-toggle="modal" data-bs-target="#id_re_reply_modal">답글 쓰기</button>';
							if ('${sessionScope.MEM_INFO.memId}' == el.reMemId) {
								str += '<div class="col-sm-2">';
								str += '<button name="btn_reply_edit" type="button" class=" btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#id_reply_edit_modal">수정</button>';
								str += '<button name="btn_reply_delete" type="button" class="btn btn-sm btn-danger">삭제</button>';
								str += '</div>';
							}
							if (el.reParentNo != 0){
								el.reNo = el.reParentNo; 
								
							}
							str += '</div>';
							
							$reply_list_area.append(str); //id_reply_list_area영역에  추가 
						}else{
							
							if(el.reParentNo != 0){
							var str = '<div class="row" id="id_re_str" data-re-no="'+el.reNo+'" data-re-ParentNo="'+ el.reParentNo + '" id=id_' + el.reNo +' >';
							}else{
							var str = '<div class="row"  data-re-no="'+el.reNo+'" data-re-ParentNo="'+ el.reParentNo + '" id=id_' + el.reNo +' >';
								
							}

							//str += '<div class="col-sm-1 text-right">' + '댓글번호'  + el.reNo + '</div>'
							//str += '<div class="col-sm-1 text-right">' + '부모번호'  + el.reParentNo + '</div>';
							//str += '<div class="col-sm-1 text-right">' + 'ㄴ'  + '</div>';
							str += '<div class="col-sm-1 text-right">' + '<img src= "/resources/images/arrow-return-right.svg">'   + '</div>';
							str += '<div class="col-sm-1 text-right">'  + el.reWriter + '</div>';
							str += '<div class="col-sm-5">';
							str += '<pre>' + el.reContent + '</pre>';
							str += '</div>';
							str += '<div class="col-sm-2">' + el.reRegDate + '</div>';
							if ('${sessionScope.MEM_INFO.memId}' == el.reMemId) {
								str += '<div class="col-sm-2">';
								str += '<button name="btn_reply_edit" type="button" class=" btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#id_reply_edit_modal">수정</button>';
								str += '<button name="btn_reply_delete" type="button" class="btn btn-sm btn-danger">삭제</button>';
								str += '</div>';
							}
							if (el.reParentNo != 0){
								el.reNo = el.reParentNo; 
								
							}
							str += '</div>';
							$(str).insertAfter($('#id_' + el.reNo));
						}
					});
					replyParam.curPage += 1;
					// 더보기 버튼 처리  
					if(data.count < replyParam.rowSizePerPage ){
						$('#btn_reply_list_more').hide();
					}
				
					
					
				} //result end
		  }  
		, error : function(req, st, err) {
				console.log('----------------------------');
				console.log('request', req);
				console.log('status', st);
				console.log('errors', err);
				console.log('----------------------------');
			}	 	
	}); // ajax
} // fn_reply_list


$(document).ready(function() {
	
	// 대댓글버튼 클릭
	$('#id_reply_list_area').on('click','button[name=btn_re_reply]',function(e){
		$btn = $(this);
		$div = $btn.closest('div.row');
		$('form[name=frm_re_reply] input[name=reParentNo]').val( $btn.data('re-parent-no') );
		$('form[name=frm_re_reply] textarea[name=reContent]').val('');
		$('#id_re_reply_modal').modal();
	}); // btn_re_reply.click
	
	
	
	// 모달창의 대댓글 버튼 btn_re_reply 클릭
	$("#btn_re_reply").click(function(e) {
		e.preventDefault();		// 이벤트 전파방지. 엔터 등으로 서브밋 되는 것 방지
		$btn = $(this);
		$div = $btn.closest('div.row');
		res = confirm("글을 등록하시겠습니까?");
		if(res){
			params = $('form[name=frm_re_reply]').serialize();
			$.ajax({
				type :"POST" 						// 전송 방식 설정 (Defaut : GET)
		      , url : '<c:url value="/reply/replyRegist"/>'			// 요청 페이지 URL정보
			  , dataType : 'json'  					// 서버로부터 전달받을 데이터 유형 (html, xml, json, script)
			  , data : params						// 서버에 전송할 파라미터 정보
			  , success : function(data) {
					console.log('data',data);
					if(data.result) {
					// 등록된 정보를 화면에 삽입해야 하지만 먼저 확인하기 위해 reload 사용 
						location.reload();
					} else {
						alert(data.msg);
					}
				} 		 		// 요청에 성공한 경우 호출되는 함수 (data, status, xhr )
			  , error :	function(req, st, err) {
					console.log('----------------------------------');
					console.log('request', req);
					console.log('status', st);
					console.log('errors', err);
					console.log('----------------------------------');
					if(req.status == 401) {		// 로그인이 안 되어있으면 로그인 페이지로 이동
						window.location.href = '<c:url value="/login/login.wow" />'
					}else{
						alert('등록중 일부 오류가 발생했습니다. \\r\\n 지속적으로 오류 밸생시 가영엄마에게 연락부탁드립니다.');
					}
				}			// 요청에 실패한 경우 호출되는 함수 (xhr, status, error)
			}); 	// ajax
		}
		
	}); // btn_reply_modify.click
	
	
	
	
	// 수정버튼 클릭
	$('#id_reply_list_area').on('click','button[name=btn_reply_edit]',function(e){
		$btn = $(this);
		$div = $btn.closest('div.row');
		$('form[name=frm_reply_edit] input[name=reNo]').val($div.data('re-no'));
		$('form[name=frm_reply_edit] textarea[name=reContent]').val($div.find('div pre').text());
		$('#id_reply_edit_modal').modal();
		
	}); // btn_reply_edit.click
	
	// 모달창의 (수정)저장버튼 btn_reply_modify 클릭
	$("#btn_reply_modify").click(function(e) {
		e.preventDefault();		// 이벤트 전파방지. 엔터 등으로 서브밋 되는 것 방지
		$btn = $(this);
		$div = $btn.closest('div.row');
		
		res = confirm("글을 수정하시겠습니까?");
		location.reload(); 
		if(res){
			params = $('form[name=frm_reply_edit]').serialize();
			$.ajax({
				type :"POST" 						// 전송 방식 설정 (Defaut : GET)
		      , url : '<c:url value="/reply/replyModify" />'			// 요청 페이지 URL정보
			  , dataType : 'json'  					// 서버로부터 전달받을 데이터 유형 (html, xml, json, script)
			  , data : params						// 서버에 전송할 파라미터 정보
			  , success : function(data) {
					console.log('data',data);
					if(data.result) {
						
						var $rn = $('form[name=frm_reply_edit] input[name=reNo]').val()
						var $rc = $('form[name=frm_reply_edit] textarea[name=reContent]').val()
						 
						$('div.row[data-re-no='+$rn+']').find('pre').text($rc)
						$('form[name=frm_reply_edit] input[name=reNo]').val('')
						$('form[name=frm_reply_edit] textarea[name=reContent]').val('')
						$('#id_reply_edit_modal').modal('hide');
					} else {
						alert(data.msg);
					}
				} 		 		// 요청에 성공한 경우 호출되는 함수 (data, status, xhr )
			  , error :	function(req, st, err) {
					console.log('----------------------------------');
					console.log('request', req);
					console.log('status', st);
					console.log('errors', err);
					console.log('----------------------------------');
					if(req.status == 401) {		// 로그인이 안 되어있으면 로그인 페이지로 이동
						window.location.href = '<c:url value="/login/login.wow" />'
					}
				}			// 요청에 실패한 경우 호출되는 함수 (xhr, status, error)
			}); 	// ajax
		}
		
	}); // btn_reply_modify.click
	
	// 삭제버튼 클릭
	$('#id_reply_list_area').on('click','button[name=btn_reply_delete]',function(e){
		$btn = $(this);
		$div = $btn.closest('div.row');
		res = confirm("글을 삭제하시겠습니까?");
		location.reload(); 
		if(res){
			params = "reNo=" + $div.data('re-no');
			$.ajax({ 
				  type :"POST"
				, url : '<c:url value="/reply/replyDelete"/>' 		
				, dataType : 'json' 
				, data : params	
				, success : function(data) {
						console.log('data', data);
						if(data.result){
							$div.remove();
						}else{
							alert(data.msg);
						}
				  }  
				, error : function(req, st, err) {
						console.log('----------------------------');
						console.log('request', req);
						console.log('status', st);
						console.log('errors', err);
						console.log('----------------------------');
					}	 	
			}); // ajax			
		}  // confirm		
		
		
	}); // btn_reply_delete.click

	// 더보기 버튼 클릭
	$('#btn_reply_list_more').click(function(e) {
		fn_reply_list();
	}); // #btn_reply_list_more.click
	
	
	// 등록버튼 클릭
	$("#btn_reply_regist").click(function(e) {
		e.preventDefault();
		res = confirm("글을 등록하시겠습니까?");
		location.reload(); 
		if(res){
			params = $('form[name=frm_reply]').serialize();
			$.ajax({ 
				  type :"POST"
				, url : '<c:url value="/reply/replyRegist"/>' 		
				, dataType : 'json' 
				, data : params	
				, success : function(data) {
						console.log('data', data);
						if(data.result){
							replyParam.curPage = 1;
							document.forms.frm_reply.reContent.value = '';
							$('#id_reply_list_area').html('');
							fn_reply_list();
						}else{
							alert(data.msg);
						}
				  }  
				, error : function(req, st, err) {
						console.log('----------------------------');
						console.log('request', req);
						console.log('status', st);
						console.log('errors', err);
						console.log('----------------------------');
					}	 	
			}); // ajax			
		}  // confirm		
	}); // #btn_reply_regist.click

	// 초기화 함수 호출
	fn_reply_list();
	
}); // ready

</script>
<!-- END : 댓글 처리 스크립트 -->

</body>
</html>