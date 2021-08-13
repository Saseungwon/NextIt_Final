var request = {};
request.getParameter = function(p_schName) {
	var v_urlStr = location.href;
	if (v_urlStr.indexOf("?") != -1) {
		var v_queryString = v_urlStr.split("?")[1];
		var v_params = v_queryString.split("&");
		for (var i = 0; i < v_params.length; i++) {
			var v_name = v_params[i].split("=")[0];
			var v_value = v_params[i].split("=")[1];
			if (v_name == p_schName) {
				return decodeURIComponent(v_value).replaceAll("+", " ");
			}
		}

	}
	return null; // 아예 없거나 못찾았을댄 null 리턴
}

request.getParameterValues = function(p_schName) {
	var v_urlStr = location.href;
	var v_rsltArr = [];
	if (v_urlStr.indexOf("?") != -1) {
		var v_queryString = v_urlStr.split("?")[1];
		var v_params = v_queryString.split("&");
		for (var i = 0; i < v_params.length; i++) {
			var v_name = v_params[i].split("=")[0];
			var v_value = v_params[i].split("=")[1];
			if (v_name == p_schName) {
				v_rsltArr.push(decodeURIComponent(v_value).replaceAll("+", " "));
			}
		}

	}
	if (!v_rsltArr.length) {
		return null;
	}
	return v_rsltArr;
}