<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>

<html lang="pt-br">
	<head>
		<title><f:message key="nomeSistema"/></title>
		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


		<script type="text/javascript">
			$(document).ready(function () {
				$("#botaoVoltar").click(function() {

					$("#container").load("<c:url value="/usuario/listar"/>" );

				});
				$("#botaoGravar").click(function() {
					var camposPreenchidos = true;
					var formulario = document.formularioSenha;
				
					if (formulario["senha"].value == "") {
						formulario["senha"].className = 'campoObrigatorio'; camposPreenchidos = false;
					} else {
						formulario["senha"].className = '';
					}
					if (formulario["confirmarSenha"].value == "") {
						formulario["confirmarSenha"].className = 'campoObrigatorio'; camposPreenchidos = false;
					} else {
						formulario["confirmarSenha"].className = '';
					}
					if (camposPreenchidos) {
						if (formulario["senha"].value != formulario["confirmarSenha"].value) {
							formulario["senha"].className = 'campoObrigatorio';
							formulario["confirmarSenha"].className = 'campoObrigatorio';

							$("#mensagem").empty().append("<f:message key="usuario_senhas_diferentes"/>");
						} else {
							formulario["botaoGravar"].disabled = true;
							$("#mensagem").empty().append("Aguarde...");

							$.ajax({
								contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
								type: "POST",
								url: "<c:url value="/usuario/redefinirSenha"/>",
								data: $("#formularioSenha").serialize(),
								dataType: "text",
								success: function(retorno){
											$("#mensagem").empty().append(retorno);
											formulario.reset();
										 }
							});
						}
					} else {
						$("#mensagem").empty().append("<f:message key="campos_obrigatorios"/>");
					}
				});
			});
		</script>
	</head>
	<body class="divConteudo">
		<form id="formularioSenha" name="formularioSenha" action="#">
			<table border="0" cellpadding="0" cellspacing="0" style="width: 350px;">
				<tr style="height: 25px;" valign="bottom">
					<td style="width: 25px;" rowspan="6"></td>
					<td colspan="3" style="width: 300px;">Usuário</td>
				</tr>
				<tr style="height: 10px;">
					<td colspan="3" style="width: 300px;">
						<input type="text" class="k-textbox" value="${usuario.nome}" style="width: 280px;" disabled>
						<input type="hidden" name="idUsuario" value="${usuario.id}">
					</td>
				</tr>
				<tr style="height: 25px;" valign="bottom">
					<td colspan="3" style="width: 300px;">
						Nova Senha
					</td>					
				</tr>
				<tr style="height: 20px;">
					<td style="width: 130px;">
						<input type="password" class="k-textbox"  name="senha" value="" maxlength="15" style="width: 280px;">
					</td>
				</tr>
				<tr style="height: 25px;" valign="bottom">
					<td colspan="3" style="width: 300px;">
						Confirmar Nova Senha
					</td>
				</tr>
				<tr style="height: 10px;">
					<td style="width: 300px;">
						<input type="password" class="k-textbox"  name="confirmarSenha" value="" maxlength="15" style="width: 280px;">
					</td>
				</tr>
				<tr style="height: 40px;"></tr>
	   			<tr style="height: 40px;">
	   				<td colspan="3" style="text-align: center;">
	   					<button type="reset" name="limpar" class="k-button"><span class='k-icon k-cancel'></span><f:message key="limpar"/></button>
	            		<button id="botaoGravar" type="button" class="k-button"><span class='k-icon k-update'></span><f:message key="gravar"/></button>
	   				</td>
	   			</tr>
			</table>
		</form>	
	</body>
</html>