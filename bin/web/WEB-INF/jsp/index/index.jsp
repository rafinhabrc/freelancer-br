<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>

<html lang="pt-br">
	<head>
		<title><f:message key="aplicativo"/></title>

		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/examples-offline.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/kendo.common.min.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/kendo.default.min.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/layoutmodelo.css"/>">

		<script type="text/javascript">
			var caminhoAbsoluto = "<c:url value="/"/>";
		</script>
		<script type="text/javascript" src="<c:url value="/js/console.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery-1.8.2.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.maskedinput-1.3.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/kendo.web.min.js"/>"></script>

		<script type="text/javascript">
			$(document).ready(function() {
				$("#PainelLogin").hide();
        	 	$("#PainelLogin").show(500);
			});

			function validarFormularioLogon() {
				$('#carregando').fadeIn();

				if (($("#username").val() == "") || ($("#password").val() == "")) {
					$("#mensagem").empty().append("<f:message key="logon_atencao"/>");
					$('#carregando').hide();
					return false;
				} else {
                   	$("#PainelLogin").hide("fast");
					$('#carregando').fadeOut();
					return true;
				}
			}
		</script>
	</head>

	<body>
		<div id="PainelTopoLogin"></div>

		<div id="divCarregando" style="display:none;" class="k-block k-inset" >
			<img  src="<c:url value="/imagens/loading.gif"/>" border="0" alt="Alterar Senha"/>
		</div>

		<div id="PainelLogin" class="k-block k-inset">
			<form name="form" action="<c:url value="/sistema/logon"/>" method="POST" onsubmit="return validarFormularioLogon();">
				<table border="0" cellpadding="0" cellspacing="0" style="width: 300px; height: 53px;">
					<tr style="height: 15px;" valign="bottom" class="textoDestaqueNormal">
						<td style="width: 60px;">Usuário</td>
						<td style="width: 60px;">Senha</td>
						<td style="width: 80px;">&nbsp;</td>
					</tr>
					<tr style="height: 20px;">
						<td>
							<input id="username" type="text" name="username" class="k-textbox" value="" maxlength="30" style="width: 90px;">
						</td>
						<td>
							<input id="password" type="password" name="password" class="k-textbox"  value="" maxlength="15" style="width: 90px;">
						</td>
						<td>
							<input id="logon" type="submit" name="botaoLogon" value="" class="botaoLogon">
						</td>
					</tr>
					<tr style="height: 25px;" valign="bottom" class="textoAdvertenciaNormal">
						<td id="mensagem" style="width: 332px;" colspan="3" align="left" >
							<c:if test="${mensagem != null}">
								<f:message key="${mensagem}"/>
							</c:if>
							<c:forEach var="error" items="${errors}">
								${error.message}<br/>
							</c:forEach>
						</td>
					</tr>
				</table>
			</form>

			Teste: ${funcao.id} : ${funcao.classe} \ ${funcao.controller} \ ${funcao.nome}<br>

			<c:forEach var="item" items="${funcaoList}">
				${item.id} : ${item.classe} \ ${item.controller} \ ${item.nome}<br>
			</c:forEach>
		</div>

	</body>
</html>