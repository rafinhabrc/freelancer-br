<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="pt-br">
	<head>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".raty").raty({ readOnly: true, score: 3 });
				
			 	$("#myModal").on("show", function() {
 					$("#myModal a.btn").on("click", function(e) {
			 			console.log("button pressed");
				 		$("#myModal").modal('hide');
				 	});
			 	});
				
			 	$("#myModal").on("hide", function() {
	 				$("#myModal a.btn").off("click");
			 	});
				
			 	$("#myModal").on("hidden", function() {
			 		$("#myModal").remove();
			 	});
				
			 	$("#myModal").modal({
		 			"backdrop" : "static",
				 	"keyboard" : true,
				 	"show" : false
			 	});
			});
		</script>
	</head>
	<body>
		
		<div class="box col-md-12">
	        <div class="box-inner">
	            <div class="box-header well">
	                <h2>Serviços</h2>
	            </div>
	            
	            <div class="row">
	            	<div class="form-group col-lg-12">
		           		<c:forEach items="${servicoCategoriaList}" var="item">
		           			<div style="float: left; width: 284px; height: 200px; margin: 10px; margin-bottom: 30px;">
			           			<div style="float: left; width: 284px; height: 195px; border: 1px solid #e7e7e7; border-radius: 4px; box-shadow: 0 1px 2px 0 rgba(0,0,0,1);
			           			-moz-box-shadow: 0 1px 2px 0 rgba(0,0,0,1); -webkit-box-shadow: 0 1px 2px 0 rgba(0,0,0,1);">
			           				
			           				<div style="height: 125px; text-align: center;">
			           					<c:choose>
			           						<c:when test="${item.servicos.imagem != null}">
			           							<img alt="" style="height: 100px; max-width: 250px; margin-top: 15px;" src="<c:url value="${item.servicos.imagem}"/>"/>
			           						</c:when>
			           						<c:otherwise>
			           							<img alt="" style="height: 100px; max-width: 250px; margin-top: 15px;" src="<c:url value="/imagens/noimage.jpg"/>"/>
			           						</c:otherwise>
			           					</c:choose>
			           				</div>
			           				
			           				<hr style="width:98%; border-style: inset; border-width: 1px; margin: 0px; margin-bottom: 3px;">
			           				
			           				<span style="width: 100%; padding-left: 5px; text-align: center;">
			           					<strong>Título:</strong> ${item.servicos.titulo}
			           				</span>
			           				<br/>
			           				
			           				<span style="width: 100%; padding-left: 5px;">
			           					<strong>Descrição:</strong> <input type="text" value="${item.servicos.descricao}" style="width: 195px; border: 0px; background-color: #fff;">
			           				</span>
			           				<br/>
			           				
			           				<span style="width: 100%; padding-left: 5px;">
			           					<strong>Data de Publicação:</strong> <f:formatDate value="${item.servicos.dataCadastro.time}" pattern="dd/MM/yyyy HH:mm"/>
			           				</span>
			           			</div>
			           			
			           			<div style="float: left; width: 286px; padding: 5px;">
			           				<div class="raty" style="float: left;"></div>
			           				
			           				<a href="#myModal" role="button" data-toggle="modal" style="float: right;"> <i class="glyphicon glyphicon-edit"></i> Ver </a>
			           			</div>
		           			</div>
						</c:forEach>
					</div>
				</div>
	        </div>
	        
         	<div id="myModal"class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
					 	<div class="modal-header" style="height: 50px;">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h3 id="myModalLabel" style="margin: 0px;">Entrar</h3>
						</div>
						<div class="modal-body" style="height: 270px;">
							<div id="janelaLogin" class="col-lg-10 col-md-10" style="margin: 0px;">
								<form id="formulario" name="formulario" action="<c:url value="/logon"/>" method="POST">
									<div class="row">
										<div class="form-group col-lg-12">
											<h3 style="margin: 0px;">Login</h3>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-lg-12">
					                        <label>E-mail</label>
					                        <div class="input-group input-group-lg">
						                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
						                        <input id="email" type="text" name="email" class="form-control">
						                    </div>
					                    </div>
					                </div>
					                <div class="row">
					                    <div class="form-group col-lg-12">
					                        <label>Senha</label>
					                        <div class="input-group input-group-lg">
						                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						                        <input id="senha" type="password" name="password" class="form-control">
						                    </div>
					                    </div>
					                </div>
					                <div class="row">
					                 	<div class="form-group col-lg-12">
					                 		<button type="submit" class="btn btn-login" style="margin-right: 5px;"> <f:message key="entrar"/></button>
					                 		<a href="#" style="margin-right: 5px;">
												<img alt="Entrar com o Facebook" src="<c:url value="/imagens/icon-fb.png"/>"/>
											</a>
											<a href="#">
												<img alt="Entrar com o Google Plus" src="<c:url value="/imagens/icon-plus.jpg"/>"/>
											</a>				                 		
											<strong><u><a href="#" style="margin-left: 20px;">Esqueci a minha senha</a></u></strong>
										</div>
									</div>
														        		
								</form>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn" data-dismiss="modal" aria-hidden="true">Fechar</button>
						</div>
					</div>
				</div>
			</div>
			
	    </div>
	</body>
</html>