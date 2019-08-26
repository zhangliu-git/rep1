<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %><!--不加的话不识别el表达式-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'bookdesc.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	body {
		font-size: 10pt;
		background: rgb(254,238,189);
	}
	div {
		margin:20px;
		border: solid 2px gray;
		width: 150px;
		height: 150px;
		text-align: center;
	}
	li {
		margin: 10px;
	}
</style>
	<script type="text/javascript">
		function setMethod(method){
			var ele = document.getElementById("method");
			ele.value = method;
		}
	</script>

  </head>
  
  <body>

  <!--错误信息-->
  <c:if test="${allErrors!=null}">
	  <c:forEach items="${allErrors}" var="error">
		<font color="red" > ${error.defaultMessage} <br></font>
	  </c:forEach>
  </c:if>
  <div>
    <img src="<c:url value='/${items.image }'/>" border="0"/>
  </div>
  <form style="margin:20px;" id="form" action="<c:url value='/book/editBookSubmit.action'/>" method="post">
  	<input type="hidden" name="method" value="" id="method">
  	<input type="hidden" name="bid" value="${items.bid }">
  	<input type="hidden" name="image" value="${items.image }">
  	
  	图书名称：<input type="text" name="bname" value="${items.bname }"/><br/>
  	图书单价：<input type="text" name="price" value="${items.price }"/>元<br/>
  	图书作者：<input type="text" name="author" value="${items.author }"/><br/>
  	图书分类：<select style="width: 150px; height: 20px;" name="cid">
	  			<c:forEach items="${categoryList }" var="cl">
	  				<option value="${cl.cid }" <c:if test='${cl.cid eq bookCustom.category.cid }'>selected="selected"</c:if> >${cl.cname }</option>
	  			</c:forEach>
     		
    		</select><br/>
  	<input type="submit" name="method" value="删除" onclick="setMethod('delete')"/>
  	<input type="submit" name="method" value="编辑" onclick="setMethod('edit')"/>
  </form>
  </body>
</html>
