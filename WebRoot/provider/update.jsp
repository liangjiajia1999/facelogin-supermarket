<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update.jsp' starting page</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div class="container">
  		<div class="panel panel-success">
  			<div class="panel-heading">类别信息</div>
  			<div class="panel-body">
  				<form class="form-horizontal" action="ProviderServlet?action=do_update" method="post">
				  <div class="form-group">
				    <label  class="col-sm-2 control-label">供应商编号:</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="pid" readonly="readonly" value="${provider.pid}"/>
				    </div>
				  </div>
				  <div class="form-group">
				    <label  class="col-sm-2 control-label">供应商名称:</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="pname" value="${provider.pname}"/>
				    </div>
				  </div>
				  <div class="form-group">
				    <label  class="col-sm-2 control-label">电话:</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="pphone" value="${provider.pphone}"/>
				    </div>
				  </div>
				  <div class="form-group">
				    <label  class="col-sm-2 control-label">地址:</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="paddress" value="${provider.paddress}"/>
				    </div>
				  </div>
				  <div class="form-group">
				    <label  class="col-sm-2 control-label">联系人:</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="plinkman" value="${provider.plinkman}"/>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-success">保存</button>
				    </div>
				  </div>
				</form>
  			</div>
  		</div>
  	</div>
  </body>
</html>
