<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="pt-br">
	<head>
		<title><f:message key="site"/></title>
		
		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="shortcut icon" href="<c:url value="/imagens/favicon.ico"/>">
    	
    	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/animate.min.css"/>">
    	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/bootstrap.css"/>"/>
    	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/chosen.css"/>"/>
    	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/datetimepicker.min.css"/>"/>
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.8.21.custom.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/noty_theme_default.css"/>"/>
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/responsive-tables.css"/>"/>
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/bvalidator.css"/>"/>
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/layout.css"/>"/>
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/waitMe.css"/>"/>
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/style.css"/>"/>
		
		<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/bootstrap.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/charisma.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/chosen.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/moment.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/lang/pt-br.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/fullcalendar.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/datetimepicker.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/init-chart.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.autogrow-textarea.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.colorbox-min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.cookie.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.history.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.iphone.toggle.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.noty.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.raty.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.responsive-tables.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.uploadify.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.waitMe.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.bvalidator.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.maskedinput.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/funcoesControle.js"/>"></script>
		
		<script type="text/javascript">
			var caminhoAbsoluto = "<c:url value="/"/>";
		</script>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$("#container").waitMe({effect :'ios', text :'', bg :'rgba(255,255,255,0.5)', color :'#000', sizeW :'', sizeH :''});
				$("#container").load("<c:url value="/paginaLogin"/>");
				
				$("#filtroPesquisa").blur(function(){
					$("#container").waitMe({effect :'ios', text :'', bg :'rgba(255,255,255,0.5)', color :'#000', sizeW :'', sizeH :''});
					$("#container").load("<c:url value="/pesquisar"/>", {categoria: null, filtro : $("#filtroPesquisa").val()});
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="/includes/topo.jsp"></jsp:include>
		
		<div class="ch-container" style="position: absolute; width: 100%; top: 70px;">
		    <div class="row">
		    	
		        <div class="col-sm-2 col-lg-2" style="margin-top: 10px;">
		            <div class="sidebar-nav">
		                <div class="nav-canvas">
		                    <div class="nav-sm nav nav-stacked"></div>
		                    <ul class="nav nav-pills nav-stacked main-menu">
		                        <li class="nav-header"></li>
		                        <li class="nav-header hidden-md"><i class="glyphicon glyphicon-chevron-right"></i> <f:message key="titulo.menu"/></li>
		                        <li><a class="ajax-link" onclick="paginaLogin();" href="#"><span> <f:message key="menu.pagina.inicial"/></span></a></li>
		                        <li><a class="ajax-link" href="#"><span> <f:message key="menu.como.funciona"/></span></a></li>
		                        <li class="nav-header hidden-md"><i class="glyphicon glyphicon-chevron-right"></i> <f:message key="titulo.categorias"/></li>
		                        <li><a class="ajax-link" href="#" onclick="pesquisar('<f:message key="menu.categoria.admin.bd"/>');"><span> <f:message key="menu.categoria.admin.bd"/></span></a></li>
		                        <li><a class="ajax-link" href="#" onclick="pesquisar('<f:message key="menu.categoria.admin.redes"/>');"><span> <f:message key="menu.categoria.admin.redes"/></span></a></li>
		                        <li><a class="ajax-link" href="#" onclick="pesquisar('<f:message key="menu.categoria.analista.sistema"/>');"><span> <f:message key="menu.categoria.analista.sistema"/></span></a></li>
		                        <li><a class="ajax-link" href="#" onclick="pesquisar('<f:message key="menu.categoria.consultor.ti"/>');"><span> <f:message key="menu.categoria.consultor.ti"/></span></a></li>
		                        <li><a class="ajax-link" href="#" onclick="pesquisar('<f:message key="menu.categoria.gerencia.projeto"/>');"><span> <f:message key="menu.categoria.gerencia.projeto"/></span></a></li>
		                        <li><a class="ajax-link" href="#" onclick="pesquisar('<f:message key="menu.categoria.programador"/>');"><span> <f:message key="menu.categoria.programador"/></span></a></li>
		                        <li><a class="ajax-link" href="#" onclick="pesquisar('<f:message key="menu.categoria.web.designer"/>');"><span> <f:message key="menu.categoria.web.designer"/></span></a></li>
		                   	</ul>
		                </div>
		            </div>
		        </div>
		    	
		        <div id="container" class="container-load"></div>
		        
			</div>
			
			<jsp:include page="/includes/rodape.jsp"></jsp:include>
			
		</div>
	</body>
</html>