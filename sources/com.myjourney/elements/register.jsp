<%@page import="net.arnx.jsonic.JSON"%>
<%@page import="com.thongtv.model.Result"%>
<%@page import="com.thongtv.service.Impl.HomeServiceImpl"%>
<%
	HomeServiceImpl home = new HomeServiceImpl(pageContext, request, response);
	Result result = home.register();
	
	response.setContentType("application/json");
	out.println(JSON.encode(result));
	
%>