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
</style>
</head>
<body>
	<tag:navbar />
	<div>
		<form:form action="/record/registScore.wow" method="post"
			modelAttribute="memRcd">
			<input type="hidden" name="rcdMatchNo" value="${memRcd.rcdMatchNo }">
			<input type="hidden" name="rcdMatchCate" value="${memRcd.rcdMatchCate }">
			<table id="id_table">
				<tr>
					<td>선수ID</td>
					<td>골</td>
					<td>어시</td>
				</tr>
				<tr>
					<td><form:input path="rcdMemId" placeholder="선수ID 입력" /> <form:errors
							path="rcdMemId" /></td>
					<td><form:input path="rcdGoal" placeholder="골 입력" /> <form:errors
							path="rcdGoal" /></td>
					<td><form:input path="rcdAssist" placeholder="어시 입력" /> <form:errors
							path="rcdAssist" /></td>
				</tr>
				
			</table>
			<button type="button" onclick="f_add()">선수 추가</button>


			<form:button>등록</form:button>
		</form:form>
	</div>
	<script type="text/javascript">
		var table = document.getElementById("id_table");
		function f_add() {
			var str = "";
			str += '<tr><td><input id="rcdMemId" name="rcdMemId" placeholder="선수ID 입력" type="text" value=""> </td>';     
			str += '<td><input id="rcdGoal" name="rcdGoal" placeholder="골 입력" type="text" value="0"> </td>';             
			str += '<td><input id="rcdAssist" name="rcdAssist" placeholder="어시 입력" type="text" value="0"> </td></tr>';   
			table.innerHTML += str;
		}
	</script>

	
</body>
</html>