<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>

<html lang="pt-br">
	<head>
		<title><f:message key="nomeSistema"/></title>
		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<script type="text/javascript" src="<c:url value="/js/funcoesValidacao.js"/>"></script>
		<script type="text/javascript">
			$(document).ready(function () {
				$("#username").blur(function() {
					var username = $("#username").val();
					var usernameAtual = $("#usernameAtual").val();

					if (username != usernameAtual) {
						username = username.replace(/^\s+|\s+$/g,"");

						$("#carregando").empty().append("Carregando...");
						$.ajax({
							type: "POST",
							url: "<c:url value="/usuario/validarUsername"/>",
							data: "username=" + username,
							dataType: "text",
							success: function(retorno){
										if (retorno == "true") {
											$("#botaoGravar").get(0).disabled = false;
											$("#carregando").empty().append("<f:message key="usuario_username_disponivel"/>");
										} else {
											$("#botaoGravar").get(0).disabled = true;
											$("#carregando").empty().append("<f:message key="usuario_username_indisponivel"/>");
										}
									}
							});
					} else {
						$("#botaoGravar").get(0).disabled = false;
						$("#carregando").empty();
					}
				});

				$("#botaoAdicionarPerfil").click(function() {
					$("#container").load("<c:url value="/perfil/novo"/>");
				});
				$("#botaoPesquisarPerfil").click(function() {
					$("#container").load("<c:url value="/perfil/listar"/>");
				});
		<c:choose>
			<c:when test="${usuario.id != null}">
				$("#botaoVoltar").click(function() {
					randomNum = (Math.round((Math.random() * 9) + 1));
					$("#container").load("<c:url value="/usuario/listar"/>");
				});
			</c:when>
			<c:otherwise>
				$("#botaoFechar").click(function() {
				   document.getElementById("container").innerHTML=""; 	  
				});
			</c:otherwise>
		</c:choose>
				$("#botaoGravar").click(function() {
					var camposPreenchidos = true;
					var formulario = document.formularioUsuario;
				
					if (formulario["usuario.nome"].value == "") {
						formulario["usuario.nome"].className = 'campoObrigatorio'; camposPreenchidos = false;
					} else {
						formulario["usuario.nome"].className = '';
					}
					if (formulario["usuario.email"].value == "") {
						formulario["usuario.email"].className = 'campoObrigatorio'; camposPreenchidos = false;
					} else {
						formulario["usuario.email"].className = '';
					}
					if (formulario["usuario.perfil.id"].value == "") {
						formulario["usuario.perfil.id"].className = 'campoObrigatorio'; camposPreenchidos = false;
					} else {
						formulario["usuario.perfil.id"].className = '';
					}
					if (formulario["usuario.username"].value == "") {
						formulario["usuario.username"].className = 'campoObrigatorio'; camposPreenchidos = false;
					} else {
						formulario["usuario.username"].className = '';
					}
				<c:choose>
					<c:when test="${usuario.id != null}">
					if (formulario["usuario.ativo"].value == "") {
						formulario["usuario.ativo"].className = 'campoObrigatorio'; camposPreenchidos = false;
					} else {
						formulario["usuario.ativo"].className = '';
					}
					</c:when>
					<c:otherwise>
					if (formulario["usuario.password"].value == "") {
						formulario["usuario.password"].className = 'campoObrigatorio'; camposPreenchidos = false;
					} else {
						formulario["usuario.password"].className = '';
					}
					</c:otherwise>
				</c:choose>
					if (camposPreenchidos) {
						formulario["botaoGravar"].disabled = true;
						$("#mensagem").empty().append("Aguarde...");
				
						$.ajax({
							contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
							type: "POST",
							url: "<c:url value="/usuario/gravar"/>",
							data: $("#formularioUsuario").serialize(),
							success: function(retorno) {
										$("#mensagem").empty().append("Senha Alterada com Sucesso");
									 }
						});
					} else
						$("#mensagem").empty().append("<f:message key="campos_obrigatorios"/>");
				});
			});
		</script>
	</head>
	<body class="divConteudo">
	<style scoped>
		.form {
			margin-left: 15px;
		}
   	</style>
		<form id="formularioUsuario" name="formularioUsuario" action="#">
			<c:if test="${usuario.id != null}">
				<input type="hidden" name="usuario.id" value="${usuario.id}">
				<input type="hidden" name="usuario.password" value="${usuario.password}">
			</c:if>
			<div class="form">
				<table border="0" cellpadding="0" cellspacing="0" style="width: 460px;">
					<tr valign="bottom" style="height: 20px;">
		   				<td colspan="2" style="width: 440px;">
		   					Nome
		   				</td>
		   			</tr>
					<tr style="height: 20px;">
						<td colspan="2" style="width: 440px;">
							<input type="text" class="k-textbox" name="usuario.nome" value="${usuario.nome}" maxlength="100" style="width: 440px;">
						</td>
					</tr>
					<tr style="height: 25px;" valign="bottom">
						<td colspan="2" style="width: 440px;">
							Email
						</td>
					</tr>
					<tr style="height: 20px;">
						<td colspan="2" style="width: 440px;">
							<input type="text" class="k-textbox" name="usuario.email" value="${usuario.email}" maxlength="100" style="width: 440px;" onblur="verificaEmail(this, 'mensagem');">
						</td>
					</tr>
					<tr style="height: 25px;" valign="bottom">
						<td colspan="2" style="width: 440px;">
							Perfil
						</td>
					</tr>
					<tr style="height: 20px;">
						<td colspan="2" style="width: 440px;">
							<select name="usuario.perfil.id" style="width: 440px;">
								<option value="">Selecione</option>
								<c:forEach items="${perfilList}" var="perfil">
									<option value="${perfil.id}" <c:if test="${usuario.perfil.id == perfil.id}">selected</c:if>>${perfil.nome} (${perfil.descricao})</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr valign="bottom" style="height: 40px;">
						<td style="width: 210px;">
							Nome de Acesso
						</td>
					</tr>
					<tr style="height: 10px;">
						<td style="width: 210px;">
							<input id="username" type="text" class="k-textbox" name="usuario.username" value="${usuario.username}" maxlength="30" style="width: 200px;">
							<input id="usernameAtual" type="hidden" value="${usuario.username}" name="usernameAtual">
						</td>
						<td style="width: 210px;">
							<table width="210" border="0" cellpadding="0" cellspacing="0">
								<tr style="height: 18px;">
									<td style="width: 50px;">
										<a id="botaoAdicionarPerfil" class="k-button"><span class="k-icon k-i-plus"></span>
											Adicionar
										</a>
									</td>
									<td style="width: 60px;">
										<a id="botaoPesquisarPerfil" class="k-button"><span class="k-icon k-i-search"></span>									
											Pesquisar
										</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>					
					<tr style="height: 25px;" valign="bottom">
						<td style="width: 570px;" colspan="3">Senha</td>
					</tr>
					<tr style="height: 10px;">
						<td style="width: 570px;" colspan="3">
							<input type="password" class="k-textbox" name="usuario.password" value="" maxlength="15" style="width: 200px;">
						</td>
					</tr>
					<tr style="height: 30px;"></tr>
					<tr>
						<td id="carregando" style="width: 570px; text-align: center;" colspan="3" class="textoDestaqueNormal">
							&nbsp;
						</td>
					</tr>
					<tr style="height: 30px;">
						<td style="width: 570px;" colspan="3">&nbsp;</td>
					</tr>
					<tr style="height: 35px;" valign="middle">
						<td style="width: 570px; text-align: center;" colspan="3">
							<c:choose>
								<c:when test="${usuario.id != null}">
									<button id="botaoVoltar" type="button" name="voltar"   class="k-button">Voltar
									<span class='k-icon k-i-refresh'>&nbsp;</span></button>
									<button id="botaoDesfazer" type="reset" name="desfazer" class="k-button">Desfazer
									<span class='k-icon k-i-cancel'>&nbsp;</span></button>
								</c:when>
								<c:otherwise>									 
									<button id="botaoLimpar" type="reset" name="limpar"   class="k-button">Limpar
									<span class='k-icon k-cancel'>&nbsp;</span></button>
								</c:otherwise>
							</c:choose>
							 
							<button id="botaoGravar" type="button" name="gravar"   class="k-button">Gravar
							<span class='k-icon k-update'>&nbsp;</span></button>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>