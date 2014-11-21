<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="pt-br">
	<head>
		<script type="text/javascript" src="<c:url value="/js/charisma.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/chosen.min.js"/>"></script>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$("#selectHabilidades").hide();
				$("#selectHabilidades").attr("disabled", true);
				
				$("#botaoFechar2").hide();
				$("#botaoSalvar2").hide();
			});
			
			function alterarInformacoesAdicionais(){				
				$("#habilidades").hide();
				$("#selectHabilidades").removeAttr("disabled");
				$("#selectHabilidades").show();
				
				$("#atividades").removeAttr("disabled");
				$("#atividades").removeClass("textarea-disabled");
				$("#atividades").addClass("textarea-active");
				
				$("#experiencia").removeAttr("disabled");
				$("#experiencia").removeClass("textarea-disabled");
				$("#experiencia").addClass("textarea-active");
				
				$("#botaoFechar2").show();
				$("#botaoSalvar2").show();
			}
			
			function fechar2(){
				$("#selectHabilidades").hide();
				$("#selectHabilidades").attr("disabled", true);
				$("#habilidades").show();
				
				$("#atividades").attr("disabled", true);
				$("#atividades").removeClass("textarea-active");
				$("#atividades").addClass("textarea-disabled");								
				
				$("#experiencia").attr("disabled", true);
				$("#experiencia").removeClass("textarea-active");
				$("#experiencia").addClass("textarea-disabled");
				
				$("#botaoFechar2").hide();
				$("#botaoSalvar2").hide();
			}
			
			function alterarInformacoes(){
				$.ajax({
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					type: "POST",
					url: "<c:url value="/usuario/gravar/infoAdicionais"/>",
					data: $("#formInformacoesAdicionais").serialize(),
					success: function(retorno) {
								$("#infoAdicionais").load("<c:url value="/usuario/informacoesAdicionais"/>");
							 }
				});
			}
		</script>
		<style type="text/css">
			.chosen-container-multi .chosen-choices {
			    height: 100px !important;
			    border-radius: 4px;
			}
			.chosen-container-multi .chosen-choices li.search-field input[type="text"] {
			    height: 27px;
			}
		</style>
	</head>
	<body>
		<form id="formInformacoesAdicionais" name="formInformacoesAdicionais" action="#" method="POST">
			<input type="hidden" name="freelancer.id" value="${usuario.freelancer.id}">
			<div class="row">
				<div class="form-group col-lg-12">
					<strong>Informações Adicionais</strong>
					
					<hr style="border-style: inset; border-width: 1px; margin: 0px; margin-bottom: 3px;">
				</div>
			</div>
			
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-8">
					<strong>Habilidades:</strong>
					<span id="habilidades">
						<c:forEach items="${usuario.freelancer.freelancerHabilidadeList}" var="item">
							<span class="spanHabilidade">${item.habilidades.descricao}</span>
						</c:forEach>
					</span>
					
					<div id="selectHabilidades" class="controls">
                        <select name="habilidadeList" multiple class="form-control" data-rel="chosen">
                        	<c:forEach items="${usuario.freelancer.freelancerHabilidadeList}" var="item">
          						<option selected value="${item.habilidades.id}">${item.habilidades.descricao}</option>
							</c:forEach>
                       		<c:forEach items="${habilidadeList}" var="habilidade">
          						<option value="${habilidade.id}">${habilidade.descricao}</option>
							</c:forEach>
                        </select>
                    </div>
				</div>
				<div class="form-group col-lg-4" style="text-align: right;">
					<a href="#" style="font-size: 12px;" onclick="alterarInformacoesAdicionais();"><i class="glyphicon glyphicon-edit"></i> Editar</a>
				</div>
			</div>
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-8">
					<strong>Atividades que Exerce: </strong>
					<br/>
					<textarea id="atividades" class="textarea-disabled" name="freelancer.atividades" style="" disabled>${usuario.freelancer.atividades}</textarea>
				</div>
			</div>
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-8">
					<strong>Experiência Profissional: </strong>
					<br/>
					<textarea id="experiencia" class="textarea-disabled" name="freelancer.experiencia" disabled>${usuario.freelancer.experiencia}</textarea>
				</div>
			</div>
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-8">
					<strong>Facebook: </strong>
					<a href="${usuario.freelancer.facebook}" target="_blank" style="font-size: 14px;">${usuario.freelancer.facebook}</a>
				</div>
			</div>
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-8">
					<strong>Linkedin: </strong>
					<a href="${usuario.freelancer.linkedin}" target="_blank" style="font-size: 14px;">${usuario.freelancer.linkedin}</a>
				</div>
			</div>
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-8">
					<strong>Site: </strong>
					<a href="${usuario.freelancer.site}" target="_blank" style="font-size: 14px;">${usuario.freelancer.site}</a>
				</div>
			</div>
			
			<div class="row" style="padding-left: 10px;">
				<div class="form-group col-lg-12" style="text-align: center;">
					<button id="botaoFechar2" type="button" class="btn btn-default" onclick="fechar2();" style="width: 70px;font-size: 12px; height: 20px; padding: 1px;"><i class="glyphicon glyphicon-remove"></i> Fechar</button>
					<button id="botaoSalvar2" type="button" class="btn btn-gravar" onclick="alterarInformacoes();" style="width: 70px; font-size: 12px; height: 20px; padding: 1px;"><i class="glyphicon glyphicon-ok"></i> Salvar</button>
				</div>
			</div>
		</form>
	</body>
</html>