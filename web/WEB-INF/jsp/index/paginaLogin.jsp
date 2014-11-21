<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="pt-br">
	<body>
		<div class="box col-md-14">
	        <div class="box-inner">
	            <div class="box-header well">
	                <h2></h2>
	            </div>
	            	            
	            <div class="box-content row">
	                <div class="col-lg-12 col-md-12">												
						<div class="col-lg-8 col-md-8" style="text-align: center;">
							<div class="row">
								<h2><f:message key="titulo.seja.freelancer"/></h2>
							</div>							
							<div class="row">
								<img alt="" src="<c:url value="/imagens/imagem1.jpg"/>"/>
							</div>							
							<div class="row">
		                 		<div class="form-group col-lg-12" style="text-align: center;">
		                 			<button type="button" class="btn btn-login" style="margin-right: 5px; font-size: 20px;" onclick="cadastrarUsuario();">
		                 				<i class="glyphicon glyphicon-pencil"></i> Cadastrar
		                 			</button>
								</div>
							</div>
						</div>
						
						<div id="janelaLogin" class="col-lg-4 col-md-4" styl="text-align: center;">
							<form id="formulario" name="formulario" action="<c:url value="/logon"/>" method="POST">
								<div class="row" style="text-align: center;">
									<h2>Já Possui Cadastro?</h2>
								</div>
								<div class="row">
									<div class="form-group col-lg-12">
										<h3>Login</h3>
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
				        		<br/>
				        		
								<div class="row">
				                 	<div class="form-group col-lg-12" style="text-align:center;">
										<c:if test="${mensagem != null}">
											<span class="mensagemAdvertencia"><f:message key="${mensagem}"/></span>
										</c:if>
									</div>
								</div>							
							</form>
						</div>
						
	                </div>
	            </div>
	        </div>
    	</div>
    </body>
</html>