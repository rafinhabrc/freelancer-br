<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>

<html lang="pt-br">
	<head>
		<title><f:message key="aplicativo"/></title>

		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>

	<body class="divConteudo">

		<div id="tituloPagina">Acesso Restrito</div>

		<div id="conteudoPagina">
			<table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%;">
				<tr style="height: 150px;" valign="bottom">
					<td align="center">
						<img src="<c:url value="/imagens/icones/iconeAtencao.png"/>" alt="Atenção" border="0">
					</td>
				</tr>
				<tr style="height: 25px;" valign="middle" class="textoGrande">
					<td align="center">
						<b>Atenção:</b> O acesso a esta Função está restrito a usuários selecionados.
					</td>
				</tr>
				<tr style="height: 140px;" valign="bottom" class="textoNormal">
					<td align="center">
						Se você necessita do acesso a esta Função entre em contato com o <b>Administrador do Sistema</b>.
					</td>
				</tr>
			</table>
		</div>

	</body>
</html>