<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="pt-br">
	<head>
		<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/bvalidator.css"/>"/>
		
		<script type="text/javascript" src="<c:url value="/js/charisma.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/chosen.min.js"/>"></script>
		
		<script type="text/javascript">
			$(document).ready(function() {
				moment.locale("pt-br");
				
				$("#valorServico").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', allowZero: true, affixesStay: true});
				
				<c:choose>
        			<c:when test="${servicos.valorServico != null}">
						$("#valorServico").show();
					</c:when>
	        		<c:otherwise>
       					$("#valorServico").hide();
	        		</c:otherwise>
	        	</c:choose>
	        	
			 	$("input[name='servicos.valorCombinar']").click(function(){
		            if($(this).attr("value")=="true"){
		            	$("#valorServico").hide();
		            	
		            	$("#valorServico").attr("disabled", true);
		            }
		            
		            if($(this).attr("value")=="false"){
		            	$("#valorServico").show();
		            	
		            	$("#valorServico").removeAttr("disabled");
		            }
		        });
				
				var options = {position: {x:'center', y:'top'}, lang: 'hr', errorMessages: {hr: {'required': '<f:message key="campo.obrigatorio"/>' }}};
			    
				$("#formServico").bValidator(options);
				
		        $("#formServico").submit(function(event) {
					if($("#formServico").data("bValidator").isValid()){
						$("#container").waitMe({effect :'ios', text :'', bg :'rgba(255,255,255,0.5)', color :'#000', sizeW :'', sizeH :''});
						$("#formServico").submit();
					}
					
					return false;
				});
			});
		</script>
		<style type="text/css">
			.chosen-container-multi .chosen-choices {
			    height: 60px !important;
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
	                <h2><f:message key="menu.publique.servico"/></h2>
	            </div>
	            
	           	<form id="formServico" name="formServico" action="<c:url value="/servicos/gravar"/>" method="POST" enctype="multipart/form-data">	           	
	           		<input type="hidden" name="servicos.id" value="${servicos.id}">
	           	
		            <div class="box-content">
			          	<div class="row">
		                    <div class="form-group col-lg-6">
		                        <label>Título</label>
		                        <input type="text" data-bvalidator="required" name="servicos.titulo" value="${servicos.titulo}" class="form-control">
		                    </div>
	                 	</div>
	                 	<div class="row">
		                    <div class="form-group col-lg-6">
		                        <label>Descrição</label>
		                        <textarea class="form-control" data-bvalidator="required" name="servicos.descricao" style="height: 200px; resize: none;">${servicos.descricao}</textarea>
		                    </div>
	                 	</div>
	                 	<div class="row">
	            	 		<div class="form-group col-lg-6">
		                        <label>Categorias</label>
		                         <div class="controls">
			                        <select name="categoriaList" data-bvalidator="required" multiple class="form-control" data-rel="chosen">
			                        	<c:choose>
			                        		<c:when test="${servicos.id != null}">
			                        			<c:forEach items="${servicos.servicosCategoriaList}" var="item">
													<option selected value="${item.categoria.id}">${item.categoria.descricao}</option>
												</c:forEach>
												<c:forEach items="${categoriaList}" var="item">
													<option value="${item.id}">${item.descricao}</option>
												</c:forEach>
			                        		</c:when>
			                        		<c:otherwise>
			                        			<c:forEach items="${categoriaList}" var="item">
													<option value="${item.id}">${item.descricao}</option>
												</c:forEach>
			                        		</c:otherwise>
			                        	</c:choose>
			                        </select>
			                    </div>
		                    </div>
		                </div>
		                <div class="row">
                			<div class="form-group col-lg-4" style="height: 35px; padding-top: 5px;">
		                        <label>Valor do Serviço: </label>
		                    	<input type="radio" value="true" name="servicos.valorCombinar" <c:if test="${servicos.valorCombinar == true}">checked</c:if> style="margin-left: 30px;"> A Combinar
		                    	<input type="radio" value="false" name="servicos.valorCombinar" <c:if test="${servicos.valorCombinar == false}">checked</c:if> style="margin-left: 20px;"> Digitar:
		                    </div>
		                    <div class="form-group col-lg-2">
		                    	<input id="valorServico" type="text" class="form-control" <c:if test="${servicos.valorServico != null}">value="${servicos.valorServicoString}"</c:if> name="servicos.valorServico">
		                    </div>
		                </div>
		                <div class="row">
                			<div class="form-group col-lg-6">
				                <c:choose>
		                       		<c:when test="${servicos.imagem != null}">
		                       			<img alt="" style="height: 100px; max-width: 250px; margin-top: 15px; margin-left: 20px;" src="<c:url value="${caminhoImagem}/${servicos.imagem}"/>"/>
		                       		</c:when>
		                       		<c:otherwise>                       			
				                        <label>Insira uma imagem</label>
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