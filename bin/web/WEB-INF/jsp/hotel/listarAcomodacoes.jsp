<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>


<html lang="pt-br">
	<head>
		<title><f:message key="nomeSistema"/></title>
		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/displaytag.css"/>">

	 	<script type="text/javascript">
		</script>

	</head>
	<body class="divConteudo">
	<style scoped>
		.form {
			margin-left: 15px;
		}
   	</style>
   		<div class="form">
			<table border="0" cellpadding="0" cellspacing="0" style="width: 600px; height: 325px;">
				<tr style="height: 20px;" valign="bottom">
					<td style="width: 590px;" class="textoDestaqueNormal">
						<c:if test="${mensagem != null}"><f:message key="${mensagem}"/></c:if>
					</td>
				</tr>
				<tr style="height: 305px;" valign="bottom">
					<td style="width: 590px;">
						<div style="height: 300px; width: 588px; margin-top: 5px; border: 1px solid #C0C0C0; background-color: white; overflow-y: scroll;">
							<display:table htmlId="displaytag" name="${acomodacaoList}" id="acomodacao" sort="list" export="false" style="width: 570px;">
								<display:setProperty name="basic.msg.empty_list">
									<span class="textoDestaqueNormal" style="padding-left: 10px;">Nenhuma Acomodação Cadastrada</span>
								</display:setProperty>
								<display:setProperty name="paging.banner.placement" value="top"/>
								<display:column property="numero" title="Número" sortable="false" style="width: 150px; text-align:center; padding-left: 5px;"/>
								<display:column property="nome" title="Nome do Quarto" sortable="false" style="width: 305px; text-align:center; padding-left: 5px;"/>
								<display:column property="status.titulo" title="Status" sortable="false" style="width: 90px; text-align:center; padding-left: 5px;"/>								
								<display:column media="html" title="" style="width: 50px; text-align:center;">
									<div style="float: left;">
										<a href="#" onclick="consultar('<c:url value="/hotel/consultarAcomodacao/${acomodacao.id}"/>', 'Informações da Acomodação');">
											<img class="linkSemBorda" src="../imagens/icones/iconeConsultar.png">
										</a>
									</div>									
									<a href="#" onclick="excluir('<c:url value="/hotel/removerAcomodacao/${acomodacao.id}"/>');">
										<img class="linkSemBorda" src="../imagens/icones/iconeRemover.png">
									</a>
								</display:column>
							</display:table>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>