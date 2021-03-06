<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>功能点配置</title>
	<meta name="decorator" content="default"/>
</head>
<body>
	<form:form id="inputForm" modelAttribute="func" action="${ctx}/rtc/func/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="funcid"/>
		<sys:message content="${message}"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>名称:</label></td>
		         <td  class="width-35" ><form:input path="funcname" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>类型:</label></td>
		         <td class="width-35" >
		         		<form:select path="schemaId" class="form-control m-b required" maxlength="50">
			         		<form:options items="${schemaList}" itemLabel="schemaDescribe" itemValue="schemaId" htmlEscape="false"/>
						</form:select>
		         </td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>SQL:</label></td>
				 <td class="width-35" colspan="3"><form:textarea path="funcsql" htmlEscape="false" rows="6" class="form-control required"></form:textarea> </td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>统计SQL:</label></td>
				 <td class="width-35" colspan="3"><form:textarea path="funcStatisticSql" htmlEscape="false" rows="6" class="form-control required"></form:textarea> </td>
		      </tr>
		</tbody>
		</table>
	</form:form>
	<script type="text/javascript">
		var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){
			  $("#inputForm").submit();
			  return true;
		  }
	
		  return false;
		}
		$(document).ready(function() {
			validateForm = $("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</body>
</html>