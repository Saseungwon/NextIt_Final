<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<tag:header />
<style type="text/css">
	#lea{
		display: none;
	}
	#fnd{
		display: none;
	}
</style>
</head>
<body>
	<tag:navbar />

	<div>
		<select id="id_sel" onchange="f_cate()">
			<option>경기 분류</option>
			<option id="op_lea" value="league">리그</option>
			<option id="op_fnd" value="friendly">친선</option>
		</select>
	</div>
	<div id="lea">
		<form:form action="/record/league.wow" method="post"
			modelAttribute="leaRecord">
			<table>
				<tr>
					<td>팀명</td>
					<td><form:input path="leaTeamName" placeholder="팀 이름 입력" /> <form:errors
							path="leaTeamName" /></td>
				</tr>
				<tr>
					<td>점수</td>
					<td><form:input path="leaScore" placeholder="점수 입력" /> <form:errors
							path="leaScore" /></td>
				</tr>
				<tr>
					<td>소속리그</td>
					<td><form:input path="leaNo" placeholder="N부 리그 입력" /> <form:errors
							path="leaNo" /></td>
				</tr>
				<tr>
					<td>분기</td>
					<td><form:input path="leaQuarter" placeholder="분기 입력" /> <form:errors
							path="leaQuarter" /></td>
				</tr>
			</table>
			<form:button>등록</form:button>
		</form:form>
	</div>
	
	<div id="fnd">
		<form:form action="/record/friendly.wow" method="post"
			modelAttribute="fndRecord">
			<table>
				<tr>
					<td>팀명</td>
					<td><form:input path="fndTeamName" placeholder="팀 이름 입력"></form:input>
						<form:errors path="fndTeamName"></form:errors></td>
				</tr>
				<tr>
					<td>점수</td>
					<td><form:input path="fndScore" placeholder="점수 입력"></form:input>
						<form:errors path="fndScore"></form:errors></td>
				</tr>
			</table>
			<form:button>등록</form:button>
		</form:form>
	</div>

	<script>
			var lea = document.getElementById("lea");
			var fnd = document.getElementById("fnd");
		function f_cate() {
			if(document.getElementById("id_sel").value == "league"){
				fnd.style.display = "none";
				lea.style.display = "inline";
			}else{
				lea.style.display = "none";
				fnd.style.display = "inline";
			}			
		}
	</script>

</body>
</html>