<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="pt-br">
	<head>
		<script type="text/javascript">
			$(document).ready(function() {
				moment.locale("pt-br");
				
				$("#rg").mask("99.999.999-9");
				$("#cpf").mask("999.999.999-99");
				$("#cep").mask("99999-999");
				
				$("#dataNascimento").mask("99/99/9999").datetimepicker({changeMonth: true, changeYear: true, yearRange: "-100:+0"});
				
				$("#telefoneContato").focus(function(){
					$(this).mask("(99) 9999-9999?9",{completed:function(){$(this).mask("(99) 99999-9999");}});
				});
				
				$("#telefoneComercial").focus(function(){
					$(this).mask("(99) 9999-9999?9",{completed:function(){$(this).mask("(99) 99999-9999");}});
				});
				
				$("#telefoneResidencial").focus(function(){
					$(this).mask("(99) 9999-9999?9",{completed:function(){$(this).mask("(99) 99999-9999");}});
				});
				
				$("#botaoFechar").hide();
				$("#botaoSalvar").hide();
			});
			
			function alterarUsuario(){
				$("#formAlterarUsuario :input").removeClass("input-disabled");
				$("#formAlterarUsuario :input").addClass("input-active");
				$("#formAlterarUsuario :input").removeAttr("disabled");
				
				$("#botaoFechar").show();
				$("#botaoSalvar").show();
			}
			
			function fechar(){
				$("#formAlterarUsuario :input").removeClass("input-active");
				$("#formAlterarUsuario :input").addClass("input-disabled");
				$("#formAlterarUsuario :input").attr("disabled", true);
				
				$("#botaoFechar").hide();
				$("#botaoSalvar").hide();
			}
			
			function salvarUsuario(){
				$.ajax({
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					type: "POST",
					url: "<c:url value="/usuario/gravar"/>",
					data: $("#formAlterarUsuario").serialize(),
					success: function(retorno) {
								$("#infoUsuario").load("<c:url value="/usuario/informacoesUsuario"/>");
							 }
				});
			}
		</script>
	</head>
	<body>
		<form id="formAlterarUsuario" name="formAlterarUsuario" action="#" method="POST">
			<input type="hidden" value="${usuario.id}" name="usuario.id">			
			<input type="hidden" value="${usuario.email}" name="usuario.email">
			<input type="hidden" value="<f:formatDate value="${usuario.dataCadastro.time}" pattern="dd/MM/yyyy"/>" name="usuario.dataCadastro">
			<input type="hidden" value="${usuario.ativo}" name="usuario.ativo">
			<input type="hidden" value="${usuario.password}" name="usuario.password">
			<input type="hidden" value="${usuario.fisico.id}" name="usuario.fisico.id">
			<input type="hidden" value="${usuario.freelancer.id}" name="usuario.freelancer.id">
			
			<div class="row">
				<div class="form-group col-lg-12" style="text-align: right;">
					<a href="#" style="font-size: 12px;" onclick="alterarUsuario();"><i class="glyphicon glyphicon-edit"></i> Editar</a>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-lg-2">
					<div class="imagemPerfil">
						<c:choose>
       						<c:when test="${usuario.foto != null}">
       							<input type="hidden" value="${usuario.foto}" name="usuario.foto">
       							<img alt="" style="height: 120px; margin-top: 10px;" src="<c:url value="${caminhoImagem}/${usuario.foto}"/>"/>
       						</c:when>
       						<c:otherwise>
       							<img alt="" style="height: 110px; margin-top: 10px;" src="<c:url value="/imagens/noimage.jpg"/>"/>
       						</c:otherwise>
       					</c:choose>
					</div>
				</div>
				
				<div class="form-group col-lg-3">
					<strong>Nome:</strong>
					<input type="text" class="input-disabled" value="${usuario.fisico.nome}" disabled>
				</div>
				<div class="form-group col-lg-3">
					<strong>Visualização:</strong>
					<input type="text" class="input-disabled" name="usuario.nomeVisualizacao" value="${usuario.nomeVisualizacao}" disabled>
				</div>
				
				<div class="form-group col-lg-3">
					<strong>Telefone Contato:</strong>
					<input id="telefoneContato" type="text" class="input-disabled" name="usuario.telefoneContato" value="${usuario.telefoneContato}" disabled>
				</div>
							
				<div class="form-group col-lg-3">
					<strong>Sobrenome:</strong>
					<input type="text" class="input-disabled" name="usuario.fisico.sobrenome" value="${usuario.fisico.sobrenome}" disabled>
				</div>
				<div class="form-group col-lg-3">
					<strong>RG:</strong>
					<input id="rg" type="text" class="input-disabled" name="usuario.fisico.rg" value="${usuario.fisico.rg}" disabled>
				</div>
				<div class="form-group col-lg-3">
					<strong>Telefone Residencial:</strong>
					<input id="telefoneResidencial" type="text" class="input-disabled" name="usuario.telefoneResidencial" value="${usuario.telefoneResidencial}" disabled>
				</div>
				
				<div class="form-group col-lg-3">
					<strong>Sexo:</strong>
					<input type="text" class="input-disabled" name="usuario.fisico.sexo" value="${usuario.fisico.sexo}" disabled>
				</div>
				<div class="form-group col-lg-3">
					<strong>CPF:</strong>
					<input id="cpf" type="text" class="input-disabled" name="usuario.fisico.cpf" value="${usuario.fisico.cpf}" disabled>
				</div>			
				<div class="form-group col-lg-3">
					<strong>Telefone Comercial:</strong>
					<input id="telefoneComercial" type="text" class="input-disabled" name="usuario.telefoneComercial" value="${usuario.telefoneComercial}" disabled>
				</div>				
			</div>
			<br/>
													
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-3">
					<strong>Data Nascimento:</strong>
					<input id="dataNascimento" type="text" class="input-disabled" name="usuario.fisico.dataNascimento" value="<f:formatDate value="${usuario.fisico.dataNascimento.time}" pattern="dd/MM/yyyy"/>" disabled>
				</div>
			</div>
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-6">
					<strong>Endereço:</strong>
					<input type="text" class="input-disabled" name="usuario.endereco" value="${usuario.endereco}" disabled>
				</div>
			</div>
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-2">
					<strong>Número:</strong>
					<input type="text" class="input-disabled" name="usuario.numero" value="${usuario.numero}" disabled>
				</div>
			</div>
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-3">
					<strong>Bairro:</strong>
					<input type="text" class="input-disabled" name="usuario.bairro" value="${usuario.bairro}" disabled>
				</div>
			</div>
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-2">
					<strong>Complemento:</strong>
					<input type="text" class="input-disabled" name="usuario.complemento" value="${usuario.complemento}" disabled>
				</div>
			</div>
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-3">
					<strong>Cidade:</strong>
					<input type="text" class="input-disabled" name="usuario.cidade" value="${usuario.cidade}" disabled>
				</div>
			</div>
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-3">
					<strong>Estado:</strong>
					<input type="text" class="input-disabled" name="usuario.estado" value="${usuario.estado}" disabled>
				</div>
			</div>
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-3">
					<strong>CEP:</strong>
					<input type="text" class="input-disabled" name="usuario.cep" value="${usuario.cep}" disabled>
				</div>
			</div>
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-12" style="text-align: center;">
					<button id="botaoFechar" type="button" class="btn btn-default" onclick="fechar();" style="width: 70px;font-size: 12px; height: 20px; padding: 1px;"><i class="glyphicon glyphicon-remove"></i> Fechar</button>
					<button id="botaoSalvar" type="button" class="btn btn-gravar" onclick="salvarUsuario();" style="width: 70px; font-size: 12px; height: 20px; padding: 1px;"><i class="glyphicon glyphicon-ok"></i> Salvar</button>
				</div>
			</div>
		</form>
</body>