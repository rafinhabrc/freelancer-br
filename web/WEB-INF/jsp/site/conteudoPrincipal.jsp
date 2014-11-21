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
			});
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
		
		<div class="box col-md-12">
	        <div class="box-inner">
	        	<div class="box-header well">
	            	Principal
	            </div>
	            <br/>
	            
			<c:if test="${informacoesPreenchidas == false}">
				<div class="row">
	            	<div class="form-group col-lg-12" style="text-align: center; font-size: 24px;">
            	 		<strong> Seja Bem Vindo(a) ao Freelancer-br <i>${usuario.nomeVisualizacao}</i></strong>
            	 	</div>
	            </div>
			</c:if>
	            
	            <div class="row">
	            	<div class="form-group col-lg-12">
            	 		<h4>* Para uma melhor experiência em nosso site preencha as <strong> Informações Adicionais </strong> o mais detalhado possível!</h4>
            	 	</div>
	            </div>
			    
	            <form id="formInfoAdicionais" name="formInfoAdicionais" action="<c:url value="/usuario/gravar/infoAdicionais"/>" method="POST" enctype="multipart/form-data">
	            	<input type="hidden" name="usuario.id" value="${usuario.id}">
		            <div class="box-content">
			          	<div class="row">
		                    <div class="form-group col-lg-4">
		                        <label>Nome Visualização</label>
		                        <input type="text" name="nomeVisualizacao" value="${usuario.nomeVisualizacao}" class="form-control">
		                    </div>
	                 	</div>
                	<c:choose>
					<c:when test="${freelancerTrue == true}">
						<input type="hidden" name="freelancer.id" value="${usuario.freelancer.id}">
	                 	<div class="row">
	                 		<div class="form-group col-lg-7">
								<strong>Habilidades:</strong>
								<select name="habilidadeList" multiple class="form-control" data-rel="chosen">
									<c:choose>
										<c:when test="${!empty usuario.freelancer.freelancerHabilidadeList}">
											<c:forEach items="${usuario.freelancer.freelancerHabilidadeList}" var="item">
	                           					<option selected value="${item.habilidades.id}">${item.habilidades.descricao}</option>
											</c:forEach>
											<c:forEach items="${habilidadeList}" var="habilidade">
	                           					<option value="${habilidade.id}">${habilidade.descricao}</option>
											</c:forEach>								
										</c:when>
										<c:otherwise>
											<div class="controls">
				                           		<c:forEach items="${habilidadeList}" var="habilidade">
		                           					<option value="${habilidade.id}">${habilidade.descricao}</option>
												</c:forEach>
						                    </div>
										</c:otherwise>
									</c:choose>
								</select>
		                    </div>
	                 	</div>
                	</c:when>
                	<c:otherwise>
               			<input type="hidden" name="contratante.id" value="${usuario.contratante.id}">
                	</c:otherwise>
              	</c:choose>
	                 	<div class="row">
	                    	<div class="form-group col-lg-7">
		                        <label>Atividades que exerce</label>
		                        <textarea class="form-control" name="freelancer.atividades" style="height: 120px; resize: none;">${usuario.freelancer.atividades}</textarea>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="form-group col-lg-7">
		                        <label>Faça um pequeno resumo de sua experiência profissional</label>
		                        <textarea class="form-control" name="freelancer.experiencia" style="height: 140px; resize: none;">${usuario.freelancer.experiencia}</textarea>
		                    </div>
	                 	</div>
		                
		                <div class="row">
	                    	<div class="form-group col-lg-2">
			                	<h3><strong>Links</strong></h3>
			                </div>
			            </div>
			            
		                <div class="row">
		                	<div class="form-group col-lg-4">
		                        <label>Facebook</label>
		                        <input type="text" name="freelancer.facebook" value="${usuario.freelancer.facebook}" class="form-control">
		                    </div>
		                </div>
		                <div class="row">
		                	<div class="form-group col-lg-4">
		                        <label>Linkedin</label>
		                        <input type="text" name="freelancer.linkedin" value="${usuario.freelancer.linkedin}" class="form-control" id="">
		                    </div>
		                </div>
		                <div class="row">
		                	<div class="form-group col-lg-4">
		                        <label>Site/Portfólio</label>
		                        <input type="text" name="freelancer.site" value="${usuario.freelancer.site}" class="form-control">
		                    </div>
		                </div>
	                 	<div class="row">
		                	<div class="form-group col-lg-4">
		                		<c:choose>
		                       		<c:when test="${usuario.foto != null}">
		                       			<img alt="" style="height: 100px; max-width: 250px; margin-top: 15px; margin-left: 20px;" src="<c:url value="${caminhoImagem}/${usuario.foto}"/>" class="hidden-xs"/>
		                       		</c:when>
		                       		<c:otherwise>
		                       			<label>Selecione uma foto pro perfil</label>
		                       	 		<input type="file" name="file">
		                       		</c:otherwise>
		                       	</c:choose>		                        
		                    </div>
		                </div>
		                <br/>
		                
		                <div class="row" style="text-align: center;">
		                	<button type="reset" class="btn btn-default"><i class="glyphicon glyphicon-refresh"></i> Limpar</button>
		                	<button type="submit" class="btn btn-gravar"><i class="glyphicon glyphicon-ok"></i> Gravar</button>
		                </div>
		            </div>
          		</form>
          				         
	        </div>
	    </div>	    
	</body>
</html>