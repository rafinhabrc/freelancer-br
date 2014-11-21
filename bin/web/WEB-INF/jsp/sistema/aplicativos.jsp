<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>

<html lang="pt-br">
	<head>
		<title><f:message key="nomeSistema"/></title>

		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/estilos.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/layout.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/menudock.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/modal.css"/>">

		<script type="text/javascript" src="<c:url value="/js/jquery-1.8.2.js"/>">"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.simplemodal-1.4.1.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/fisheye-iutil.js"/>"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$('#menu').Fisheye({
					maxWidth: 24,
					items: 'a',
					itemsText: 'span',
					container: '.dock-container',
					itemWidth: 72,
					proximity: 30,
					alignment: 'left',
					valign: 'bottom',
					halign: 'center'
				});
			});

			function botaoAlterarSenha() {
				$("#janelaModal").load("<c:url value="/usuario/formularioAlterarSenha"/>");
				$("#janelaModal").modal({
					containerCss:{height: 180, width: 300},
					close: true
				});
			}
		</script>
	</head>
	<body>
		<%@ include file="/includes/layout.jsp" %>

		<%@ include file="/includes/menu.jsp" %>

		<div class="divPrincipal">
			<div class="divUsuario">
				<table border="0" cellpadding="0" cellspacing="0" style="width: 400px; height: 30px;">
					<tr style="height: 15px;">
						<td style="width: 400px;" align="right">
							${userSession.usuario.nome}
						</td>
					</tr>
					<tr style="height: 15px;" align="right">
						<td style="width: 400px;">
							${userSession.usuario.perfil.nome}
						</td>
					</tr>
				</table>
			</div>
			<iframe id="iframe" src="<c:url value="${url}"/>" width="100%" height="100%" scrolling="no" marginheight="0" marginwidth="0" frameborder="0"></iframe>
		</div>

		<div id="janelaModal" style="display: none;"></div>
	</body>
</html>