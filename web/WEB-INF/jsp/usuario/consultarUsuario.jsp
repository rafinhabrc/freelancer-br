<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="pt-br">
	<head>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#infoUsuario").load("<c:url value="/usuario/informacoesUsuario"/>");
				$("#infoAdicionais").load("<c:url value="/usuario/informacoesAdicionais"/>");
			});
		</script>
	</head>
	<body>
		<div class="box col-md-12">
	        <div class="box-inner">
	            <div class="box-header well">
	                <h2>Meu Perfil</h2>
	            </div>
	            
	            <div class="box-content" style="font-size: 16px;">
	            	<div id="infoUsuario"></div>
	            						
					<div id="infoAdicionais"></div>
					
					<div class="row">
						<div class="form-group col-lg-12">
							<strong>Primeiro Acesso</strong>
							
							<hr style="border-style: inset; border-width: 1px; margin: 0px; margin-bottom: 3px;">
						</div>
						<div class="form-group col-lg-12">
							<strong>Último Acesso</strong>
							
							<hr style="border-style: inset; border-width: 1px; margin: 0px; margin-bottom: 3px;">
						</div>
						<div class="form-group col-lg-12">
							<strong>Último Serviço Postado</strong>
							
							<hr style="border-style: inset; border-width: 1px; margin: 0px; margin-bottom: 3px;">
						</div>
						<div class="form-group col-lg-12">
							<strong>Serviço Mais Visitado</strong>
							
							<hr style="border-style: inset; border-width: 1px; margin: 0px; margin-bottom: 3px;">
						</div>
						<div class="form-group col-lg-12">
							<strong>Total de Serviços Postados</strong>
							
							<hr style="border-style: inset; border-width: 1px; margin: 0px; margin-bottom: 3px;">
						</div>
					</div>
				</div>
	        </div>
	    </div>
	    
	</body>
</html>