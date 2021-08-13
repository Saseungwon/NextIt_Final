<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<t:header />
<meta charset="utf-8">
<style>
#container {
	margin: 0 auto;
	width: 800px;
}
</style>

</head>
<body>
<tag:navbar/>
	<div class="container">
		<form:form action="regist.wow" modelAttribute="memberVO">
			<div class="row col-md-8 col-md-offset-2">

				<table class="table">
					<colgroup>
						<col width="20%" />
						<col />
					</colgroup>

					<tr>
						<th>ID</th>
						<td><form:input path="memId" id="text_id"
								cssClass="form-control input-sm" /> <form:errors path="memId" />
						</td>
						<td><form:button id="btn_idck" cssClass="btn btn-default">중복 체크</form:button>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td colspan="2"><form:password path="memPass"
								cssClass="form-control input-sm" /> <form:errors path="memPass" />
						</td>
					</tr>
					<tr class="form-group-sm">
						<th>회원명</th>
						<td colspan="2"><form:input path="memName"
								cssClass="form-control input-sm" /> <form:errors path="memName" />
						</td>
					</tr>
					<tr class="form-group-sm">
						<th>이메일</th>
						<td colspan="2"><form:input path="memMail" id="txt_email"
								cssClass="form-control input-sm" /> <form:errors path="memMail" />
							<form:button id="btn_email">인증 코드 전송</form:button> <input
							type="text" id="text_code" value=""></td>
					</tr>
					<tr class="form-group-sm">
						<th>생일</th>
						<td>
							<form:input  type="date" path="memBir" cssClass="form-control input-sm"/>
							<form:errors path="memBir"/>
						</td>
					</tr>

					<tr class="form-group-sm">
						<th>우편번호</th>
						<td>
							<form:input path="memZip" cssClass="form-control input-sm" id="sample6_postcode" />
							<form:errors path="memZip" />
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						</td>
					</tr>

					<tr class="form-group-sm">
						<th>주소</th>
						<td>
							<form:input path="memAddr1" cssClass="form-control input-sm" id="sample6_address" />
							<form:errors path="memAddr1" />
							<form:input path="memAddr2" cssClass="form-control input-sm" id="sample6_detailAddress" />
							<form:errors path="memAddr2" />
						</td>
					</tr>
					<tr class="form-group-sm">
						<th>핸드폰</th>
						<td><form:input path="memHp" cssClass="form-control input-sm" />
							<form:errors path="memHp" /></td>
					</tr>
					<tr class="form-group-sm">
						<th>자기소개</th>
						<td><form:textarea path="memProfile"
								cssClass="form-control input-sm" cols="30" rows="5"/> <form:errors
								path="memProfile" /></td>
					</tr>
					<tr class="form-group-sm">
						<th>선호 포지션</th>
						<td><form:input path="memPref"
								cssClass="form-control input-sm" /> <form:errors path="memPref" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="pull-left">
								<a href="${pageContext.request.contextPath}/"
									class="btn btn-sm btn-default"> <span
									class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									&nbsp;&nbsp;취 소
								</a>
							</div>
							<div class="pull-right">
								<button type="submit" class="btn btn-sm btn-primary">
									<span class="glyphicon glyphicon-chevron-right"
										aria-hidden="true"></span> &nbsp;&nbsp;다 음
								</button>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</form:form>

</div>




<!-- id, email체크 -->
<script type="text/javascript">
	var isExist = true;
	var checkTime = false;
	var code = "";
	
	function fn_timeOut() {
		checkTime = false;
	}
	
	function fn_emailCk(email) {
		if (code == email) {
			return true;
		}
		
		return false;
	}
	
	$("#text_id").on("keydown", function() {
		isExist = true;
	})

	$("#btn_idck").on("click", function() {
		event.preventDefault();
		memId = {memId:$("#text_id").val()};
		$.ajax({
			type:"POST",
			url:'<c:url value="/join/idck" />',
			dataType:'text',
			data:memId,
			success:function(data) {
				if (data == "isExist") {
					alert("이미 존재하는 아이디입니다.");
					isExist = true;
					return;
				}
				
				alert("사용할 수 있는 아이디입니다.");
				isExist = false;
			}
		})
	})
	
	$("#btn_sub").on("click", function() {
		if (isExist) {
			event.preventDefault();
			alert("아이디 중복체크 필요");
		}
		if (!fn_emailCk($("#text_code").val())) {
			event.preventDefault();
			alert("이메일 체크 필요.");
		}
	})
	
	$("#btn_email").on("click", function() {
		event.preventDefault();
		alert("인증메일을 발송했습니다. 메일을 확인해주세요.");
		var param = {email:$("#txt_email").val()};
		$.ajax({
			url: "email.wow",
			type: "post",
			dataType: "text",
			data: param,
			success: function(data) {
				checkTime = true;
				code = data;
				setTimeout(fn_timeOut, 120000);
			}
		})
	})
</script>

<!-- 다음 주소 api -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>
