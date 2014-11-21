<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
 
<html lang="pt-br">
	<head>
		<title><f:message key="aplicativo" /></title>

		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/examples-offline.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/kendo.common.min.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/kendo.default.min.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/layoutmodelo.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/smartpaginator.css"/>">

		<script type="text/javascript">
			var caminhoAbsoluto = "<c:url value="/"/>";
		</script>
		<script type="text/javascript" src="<c:url value="/js/console.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/escola.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery-1.8.2.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.maskedinput-1.3.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.priceformat-1.5.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/kendo.culture.pt-BR.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/kendo.web.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/smartpaginator.js"/>"></script>

		<script type="text/javascript">
			$(document).ready(function() {
				kendo.culture("pt-BR");

				$("#menu2").kendoMenu();
				$.ajaxSetup({ cache: false });
			});

			function botaoAlterarSenha() {
				$("#container").load("<c:url value="/usuario/formularioAlterarSenha"/>");
			}
		</script>
	</head>

	<body>
		<div id="main">
			<div id="header" class="k-block k-shadow">
				<div id="divLogo" style="float: left;">
					<!-- Logo Ledware-->
				</div>
				<div id="divBanner" style="float: left;"> 
					<!-- Banner -->
				</div>
				<!--  Cabecalho  -->
				<div id ="divMenuUsuario" style="float: right;" class="k-block k-shadow">
					 <div id="divSaudacao">${saudacao}</div>
					 <div id="divBotoesUsuario">
						<a class="k-button" href="<c:url value="/sistema"/>">
							<img src="<c:url value="/imagens/icones/home.png"/>"  border="0" alt="Página Principal" /><span>Início</span>
						</a>
						<a class="k-button" href="#" onclick="botaoAlterarSenha();">
							<img  src="<c:url value="/imagens/icones/iconeSenha.png"/>" border="0" alt="Alterar Senha" /><span>Senha</span>
						</a>
						<a class="k-button" href="<c:url value="/sistema/logout"/>">
							<img src="<c:url value="/imagens/icones/logout.png"/>" border="0" alt="Sair" /><span>Sair</span>
						</a>
					 </div>
				</div>
			</div>
			<div id="mainnav" class="k-block k-shadow">
				<!--  Menu Superior -->
				<div id="teste">
					<ul id="menu2">
						<li>Item 1
							<ul>
								<li>Sub Item 1
		                            <ul>
		                                <li>Sub Item 3</li>
		                                <li>Sub Item 4</li> 
		                            </ul>
								</li>
								<li>Sub Item 2</li>
							</ul>
						</li>
						<li>Item 2
							<ul>
								<li>Sub Item 1</li>
								<li>Sub Item 2</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>

			<div id="conteudo" class="k-block k-shadow">
				<div id="container" class="k-block k-shadow">
					<!--  Conteudo da Página -->
				</div>
				<div id="acoes" class="k-block k-shadow">
					<!--  Barra de Ações  -->
				</div>
			</div>

			<div id="footer" class="k-block k-shadow" >
				<!--  Rodape -->
			</div>
		</div>

	</body>
</html>