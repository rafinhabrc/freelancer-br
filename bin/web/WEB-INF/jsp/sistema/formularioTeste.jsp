<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>

<html lang="pt-br">
	<head>
		<title><f:message key="nomeSistema"/></title>
		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript">
			$(document).ready(function () {
			  //  $("#aluno").kendoComboBox();
			/*
				 	  $("#divFormulario").kendoWindow({
                            width: "630px",
                            height: "315px",
                            title: "teste",
                            actions: ["Refresh", "Close"],
                  //       modal:true,
                        }).data("kendoWindow").open();
			*/

			});

		</script>
	</head>
	<body>
		<div id="divPrincipal">
		<div id="divFormulario" style="background-color: #999999;width:400px">
		<b>teste </b> 
		<br>
		<br>
			<select name="aluno"    id="aluno">
					<option value="">Escolha</option>
					<option value="M">Masculino</option>
					<option value="F">Feminino</option>
			</select>
			<br>
			<br>
				<button id="botaoGravar" type="button" name="gravar"  >Gravar</button>
			<br>
			<br>
		</div>
		</div>
	</body>
</html>