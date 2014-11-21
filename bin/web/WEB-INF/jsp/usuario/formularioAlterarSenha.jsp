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

			function sair()
			{
				$("#container").empty();
			}
		</script>
	</head>
	<body class="divConteudo">

		<div id="conteudoPagina"  class="k-block k-shadow" style="font-size:11px;width:420px;margin:5px 5px;" >
		<div class="k-header k-inset"><b>Redefinir Senha de Acesso </b></div>
		 <br>
		 <br>
			<form id="formularioSenha" name="formularioSenha" action="#">
				<table border="0" cellpadding="0" cellspacing="0" style="width: 300px; height: 150px;">
					<tr style="height: 20px;" valign="bottom">
						<td style="width: 15px;" rowspan="6">&nbsp;</td>
						<td style="width: 130px;">Senha Atual</td>
						<td style="width: 10px;" rowspan="4">&nbsp;</td>
						<td style="width: 130px;">&nbsp;</td>
						<td style="width: 15px;" rowspan="6">&nbsp;</td>
					</tr>
					<tr style="height: 20px;">
						<td style="width: 130px;">
							<input type="password"  class="k-textbox" name="senhaAtual" value="" maxlength="15" style="width: 128px;">
						</td>
						<td style="width: 130px;">
							&nbsp;
						</td>
					</tr>
					<tr style="height: 20px;">
						<td style="width: 130px;">Nova Senha</td>
						<td style="width: 130px;">Confirmar Nova Senha</td>
					</tr>
					<tr style="height: 20px;">
						<td style="width: 130px;">
							<input type="password" class="k-textbox"  name="senhaNova" value="" maxlength="15" style="width: 128px;">
						</td>
						<td style="width: 130px;">
							<input type="password"  class="k-textbox" name="confirmarSenhaNova" value="" maxlength="15" style="width: 128px;">
						</td>
					</tr>
					<tr style="height: 35px;" valign="middle">
						<td id="mensagem" style="width: 270px;" colspan="3" class="textoDestaqueNormal">
							&nbsp;
						</td>
					</tr>
					<tr style="height: 35px;" valign="middle">
						<td style="width: 270px;" colspan="3">
 							<a onclick="sair()" href="#"  class="k-button k-button-icontext k-delete">
 							<span class="k-icon k-delete"></span>Sair</a>

							<button id="botaoLimpar" type="reset" name="limpar"   class="k-button">Limpar
							<span class='k-icon k-cancel'>&nbsp;</span></button>

							<button id="botaoGravar" type="button" name="gravar"  class="k-button">Gravar
							<span class='k-icon k-update'>&nbsp;</span></button>
						</td>
					</tr>
				</table>
			</form>	

		</div>
	</body>
</html>