<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<t:header />
</head>
<body>
<tag:navbar />
<div class="container">
	<form:form action="/mypage/modify.wow" modelAttribute="member">
	<h3>회원 정보 수정</h3>	
	<table class="table table-striped table-bordered">
		<tbody>
			<tr>
				<th>아이디</th>
				<td>
					${member.memId}<form:hidden path="memId" />
					<form:errors path="memId"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<form:password path="memPass" cssClass="form-control input-sm"/>
					<form:errors path="memPass"/>
				</td>
			</tr>
			<tr>
				<th>회원명</th>
				<td>
					<form:input path="memName" cssClass="form-control input-sm"  />
					<form:errors path="memName"/>
				</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>
					<form:input path="memZip" cssClass="form-control input-sm" id="sample6_postcode" />
					<form:errors path="memZip" />
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<form:input path="memAddr1" cssClass="form-control input-sm" id="sample6_address" />
					<form:errors path="memAddr1" />
					<form:input path="memAddr2" cssClass="form-control input-sm" id="sample6_detailAddress" />
					<form:errors path="memAddr2" />
				</td>
			</tr>
			<tr>
				<th>생일</th>
				<td>
					<input type="date" name="memBir" class="form-control input-sm" >
				</td>
			</tr>
			<tr>
				<th>메일</th>
				<td>
					<form:input path="memMail" cssClass="form-control input-sm" />
					<form:errors path="memMail"/>
				</td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td>
					<form:input path="memHp" cssClass="form-control input-sm" />
					<form:errors path="memHp"/>
				</td>
			</tr>
			<tr>
				<th>자기소개</th>
				<td><form:textarea path="memProfile"
						cssClass="form-control input-sm" cols="30" rows="5" /> <form:errors
						path="memProfile" />
				</td>
			</tr>
			<tr>
				<th>선호 포지션</th>
				<td><form:input path="memPref"
						cssClass="form-control input-sm" /> <form:errors path="memPref" />
				</td>
			</tr>	
			<%-- <tr>
				<th>탈퇴여부</th>
				<td>${member.memDelYn }</td>
			</tr>	 --%>
			<tr>
				<td colspan="2">
					<a href="/main.wow" class="btn btn-primary">
						<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
						&nbsp;Home
					</a>
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
						&nbsp;&nbsp; 저장
					</button>
				</td>
			</tr>
		</tbody>	
	</table>
	</form:form>
</div>


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