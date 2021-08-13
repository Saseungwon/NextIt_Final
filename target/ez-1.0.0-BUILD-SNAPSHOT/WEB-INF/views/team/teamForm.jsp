<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<tag:header />
</head>
<body>
	<tag:navbar />
	<form:form action="/team/teamRegist.wow" method="post"
		modelAttribute="team" enctype="multipart/form-data">
		<br><br><br>
		<div class="row"><div class="col-1"></div><div class="col"><h2>팀 생성</h2></div></div>
		<br><br><br>
		<div class="row">
			<div class="col-2"></div>
			<div class="col">
			<table>
				<tr>
					<td rowspan="2">
						<div id="image_container" style="width:300px; height:300px;">
							<img src="/profile/TEAM/default.png" style="width:300px; height:300px;">
						</div>
					</td>
					<td>
						<form:input path="teamName" cssClass="form-control" placeholder="팀 이름 입력" />
						<form:errors path="teamName" />
					</td>
				</tr>
				<tr>
					<td>
						<form:input path="teamProfile" cssClass="form-control" placeholder="팀 소개 입력" />
						<form:errors path="teamProfile" />
					</td>
				</tr>
				<tr>
					<td>
						<input type="file" class="form-control" name="proFile" accept="image/*" onchange="setThumbnail(event);">
					</td>
					<td>
						<form:input path="teamRegion" cssClass="form-control" placeholder="활동 지역 입력" />
						<form:errors path="teamRegion" />
					</td>
				</tr>
				<tr align="right">
					<td colspan="2">
						<form:button class="btn btn-primary">신청</form:button>
					</td>
				</tr>
			</table>
			</div>
		</div>
	</form:form>
	<script>
		function setThumbnail(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				img.setAttribute("style", "width:300px; height:300px");
				document.querySelector("div#image_container").innerHTML = "";
				document.querySelector("div#image_container").appendChild(img);
			};
			reader.readAsDataURL(event.target.files[0]);
		}
	</script>
</body>
</html>