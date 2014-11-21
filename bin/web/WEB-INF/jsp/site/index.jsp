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
		
		<!-- <link rel="shortcut icon" href="<c:url value="/imagens/favicon.ico"/>"> -->
    	
    	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/animate.min.css"/>">
    	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/bootstrap.min.css"/>"/>
    	<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/datetimepicker.min.css"/>"/>
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.8.21.custom.css"/>">
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/noty_theme_default.css"/>"/>		
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/responsive-tables.css"/>"/>
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/style.css"/>"/>
		
		<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/bootstrap.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/charisma.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/moment.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/lang/pt-br.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/fullcalendar.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/datetimepicker.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/init-chart.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.autogrow-textarea.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.chosen.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.colorbox-min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.cookie.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.history.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.iphone.toggle.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.noty.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.raty.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.responsive-tables.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.uploadify-3.1.min.js"/>"></script>		
		
		<script type="text/javascript">
			$(document).ready(function() {
				moment.locale("pt-br");
			});
			
			function cadastrar() {
				$("#container").load("<c:url value="/cadastrar"/>");
			}
		</script>
		
		<style type="text/css">
			.navbar-nav > li > a:hover {
				background-color: #e7e7e7 !important;
				border-radius: 8px;
				color: #000;
			}
			a {
				color: #000;
			}			
			a:hover {
				color: #000;
			}
			.sidebar-nav .nav-header {
				color: #000;
			}
			.row {
			    margin-left: 0px;
			    margin-right: 0px;
			}
			.button.fb {
			    background: none repeat scroll 0 0 #6079ab;
			    border: medium none;
			    border-radius: 5px;
			    color: white;
			    cursor: pointer;
			    font-family: "Source Sans Pro",sans-serif;
			    font-size: 17px;
			    font-weight: 500;
			    padding: 10px 20px;			    
			    text-decoration: none;
			    text-transform: uppercase;
			    vertical-align: middle;
			}
		</style>
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
		                        <li class="nav-header hidden-md">Menu</li>
		                        <li><a class="ajax-link" href="index.html"><i class="glyphicon glyphicon-home"></i><span> Página Inicial</span></a></li>
		                        <li><a class="ajax-link" href="ui.html"><i class="glyphicon glyphicon-pencil"></i><span> Publique seu Serviço</span></a></li>
		                        <li><a class="ajax-link" href="chart.html"><i class="glyphicon glyphicon-question-sign"></i><span> Como Funciona</span></a></li>
		                        <li class="nav-header hidden-md"><f:message key="menu.categorias"/></li>
		                        <li><a class="ajax-link" href="index.html"><i class="glyphicon glyphicon-chevron-right"></i><span> Programação</span></a></li>
		                        <li><a class="ajax-link" href="ui.html"><i class="glyphicon glyphicon-chevron-right"></i><span> Design</span></a></li>
		                        <li><a class="ajax-link" href="chart.html"><i class="glyphicon glyphicon-chevron-right"></i><span> Analísta</span></a></li>
		                        <li><a class="ajax-link" href="typography.html"><i class="glyphicon glyphicon-chevron-right"></i><span> Gerência de Projetos</span></a></li>
		                        <li><a class="ajax-link" href="gallery.html"><i class="glyphicon glyphicon-chevron-right"></i><span> Banco de Dados</span></a></li>
		                        <li><a class="ajax-link" href="gallery.html"><i class="glyphicon glyphicon-chevron-right"></i><span> Técnico</span></a></li>
		                        <li><a class="ajax-link" href="gallery.html"><i class="glyphicon glyphicon-chevron-right"></i><span> Consultor</span></a></li>
		                   	</ul>
		                </div>
		            </div>
		        </div>
		        
		        <div id="container" class="container-load">
			    	
			    	<div class="box col-md-14">
				        <div class="box-inner">
				            <div class="box-header well">
				                <h2>Seja um Freelancer Agora</h2>
				            </div>
				            <div class="box-content row">
				                <div class="col-lg-12 col-md-12">
				                     <div class="container-12 max-978">
										<div class="facebook-login" style="text-align:center;margin-top:20px;">
											<a href="#" class="button fb">
												<i class="fa fa-facebook"></i> Entrar com Facebook
											</a>
											<br/>
											<br/>
											<span>ou...</span>
										</div>
										<div class="col-lg-6 col-md-6">
											<center><h2>JÁ TENHO CADASTRO</h2></center>
																			
											<form method="post" action="#">
												<div class="row">
													<div class="form-group col-lg-6">
								                        <label>E-mail *</label>
								                        <input type="text" class="form-control" id="">
								                    </div>
								                </div>
								                <div class="row">
								                    <div class="form-group col-lg-6">
								                        <label>Senha *</label>
								                        <input type="password" class="form-control" id="">
								                    </div>
								                </div>
								                 <div class="row">
								                 	<div class="form-group col-lg-6">
														<input type="submit" class="btn btn-close btn-default" value="Entrar" name="entrar">
														<a href="#" style="margin-left: 20px;">Esqueci a minha senha</a>
													</div>
												</div>
											</form>
										</div>
										
										<div class="login-page half column">
											<div class="grid-4 column not-registered">
												<center><h2>NÃO É CADASTRADO?</h2></center>
												
												<br/>
												<ul class="f7">
													<li>É de graça</li>
													<li>É fácil</li>
													<li>É só divulguar seus serviços</li>
													<li>E Aguardar as oportunidades que estão esperando por você!</li>
												</ul>
												<br/>
												
												 <div class="row">
								                 	<div class="form-group col-lg-6" style="text-align: center;">
														<a href="#"><h3>Cadastre-se Agora!</h3></a>
													</div>
												</div>
											</div>
										</div>
									</div>
				                </div>
				            </div>
				        </div>
			    	</div>
				</div>
				
			</div>
			
			<jsp:include page="/includes/rodape.jsp"></jsp:include>
						
		</div>		
	</body>
</html>