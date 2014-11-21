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
				$("#botaoGravar").click(function() {
					var camposPreenchidos = true;
					var formulario = document.formularioSenha;
				
					if (formulario["senhaAtual"].value == "") {
						formulario["senhaAtual"].className = 'campoObrigatorio'; camposPreenchidos = false;
					} else {
						formulario["senhaAtual"].className = '';
					}
					if (formulario["senhaNova"].value == "") {
						formulario["senhaNova"].className = 'campoObrigatorio'; camposPreenchidos = false;
					} else {
						formulario["senhaNova"].className = '';
					}
					if (formulario["confirmarSenhaNova"].value == "") {
						formulario["confirmarSenhaNova"].className = 'campoObrigatorio'; camposPreenchidos = false;
					} else {
						formulario["confirmarSenhaNova"].className = '';
					}
					if (camposPreenchidos) {
						if (formulario["senhaNova"].value != formulario["confirmarSenhaNova"].value) {
							formulario["senhaNova"].className = 'campoObrigatorio';
							formulario["confirmarSenhaNova"].className = 'campoObrigatorio';
							$("#mensagem").empty().append("<f:message key="usuario_senhas_diferentes"/>");
						} else {
							formulario["botaoGravar"].disabled = true;
							$("#mensagem").empty().append("Aguarde...");
							$.ajax({
								contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
								type: "POST",
								url: "<c:url value="/usuario/alterarSenha"/>",
								data: $("#formularioSenha").serialize(),
								dataType: "text",
								success: function(retorno) {
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
			<table border="0" cellspacing="0" cellpadding="0" style="width: 350px;">
	   			<tr valign="bottom" style="height: 25px;">
	   				<td rowspan="10" style="width: 25px;"></td>
	   				<td style="width: 300px;">
	   					Senha Atual
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td style="width: 300px;">
	   					<input type="password" class="k-textbox" name="senhaAtual" style="width: 280px;"/> <img src="../imagens/icones/iconeSenha.png">
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 25px;">
	   				<td style="width: 300px;">
	   					Nova Senha
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td style="width: 300px;">
	   					<input type="password" class="k-textbox"  name="senhaNova" style="width: 280px;"/> <img src="../imagens/icones/iconeSenha.png">
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 25px;">
	   				<td style="width: 300px;">
	   					Confirmar Nova Senha
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td style="width: 300px;">
	   					<input type="password"  class="k-textbox" name="confirmarSenhaNova" style="width: 280px;"/> <img src="../imagens/icones/iconeSenha.png">
	   				</td>
	   			</tr>
	   			<tr style="height: 40px;"></tr>
	   			<tr style="height: 40px;">
	   				<td style="text-align: center;">
	   					<button type="reset" name="limpar" class="k-button"><span class='k-icon k-cancel'></span><f:message key="limpar"/></button>
	            		<button id="botaoGravar" type="button" class="k-button"><span class='k-icon k-update'></span><f:message key="gravar"/></button>
	   				</td>
	   			</tr>
   			</table>
		</form>
	</body>
</html>