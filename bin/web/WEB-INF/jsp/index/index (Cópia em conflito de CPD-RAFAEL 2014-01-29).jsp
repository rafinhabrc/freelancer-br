<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>

<html lang="pt-br">
	<head>
		<title><f:message key="aplicativo"/></title>

		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<link rel="shortcut icon" href="imagens/logo.ico">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/examples-offline.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/kendo.common.min.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/kendo.default.min.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/layoutmodelo.css"/>"> 

		<script type="text/javascript">
			var caminhoAbsoluto = "<c:url value="/"/>";
		</script>
		<script type="text/javascript" src="<c:url value="/js/jquery-1.7.2.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/kendo.web.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/console.js"/>"></script>
	 

		<script type="text/javascript">
			$(document).ready(function() {
				$("#forms").css('display', 'none');
				$("#forms").show(400);
			});

			function validarFormularioLogon() {
				//Exibe loading
				$('#carregando').fadeIn();
				 
				if (($("#username").val() == "") || ($("#password").val() == "")) {
					$("#mensagem").empty().append("Digite o Usuário e a Senha de Acesso");
					$('#carregando').css('display', 'none');
					return false;
				} else {
                    $("#forms").hide("fast");
					$('#carregando').fadeOut();
					return true;
				}
			}
		</script>
	</head>
	<body>
 	<style scoped>
        .forms {
            float: left;
			width: auto;
		  	height: auto;
		  	margin-left: 36%;
		  	margin-top: 40px;
        }
        .divFormInput {
			margin-right: 20px;
			margin-bottom: 10px;
		}
		h1 {
			font: 25px "arial black", Helvetica, sans-serif;
			text-shadow: #1C1C1C 1px 1px 1px;
			color: #1C1C1C;
		}
		input {
			box-shadow: 1px 1px 1px 1px rgba(0, 0, 0, 0.1);
		}
   	</style>
		<form name="form" action="<c:url value="/sistema/logon"/>" method="POST" onsubmit="return validarFormularioLogon();">
			<div id="divLogoLedware"></div>
			<div style="margin-left: 45%; margin-top: 60px;">
				<h1>LedHotel </h1>
			</div>
			<div id="PainelLogin" class="k-content">
				<div id="forms" class="forms">
					<div class="divFormInput" style="float: left; width: 200px;">
						Username
		   				<input id="username" type="text" name="username" class="k-textbox" value="" style="width: 200px; height: 30px;">
		        	</div>
		        	<div class="divFormInput" style="float: left; width: 200px;">
		        		Senha
		   				<input id="password" type="password" name="password" class="k-textbox"  value=""  style="width: 200px; height: 30px;">
		        	</div>
		        	<div class="divFormInput" style="float: left; margin-left: -10px;">
		   				<input id="logon" type="submit" name="botaoLogon" value="" class="botaoLogin" style="box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0);">
		        	</div>
		        	</br>
					<span id="mensagem" class="textoAdvertenciaNormal">
						<c:if test="${mensagem != null}">
							<f:message key="${mensagem}"/>
						</c:if>
						<c:forEach var="error" items="${errors}">
							${error.message}
						</c:forEach>
					</span>
				</div>
			</div>
		</form>
	</body>
</html>