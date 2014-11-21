<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="pt-br">
	<head>
		<script type="text/javascript">
			$(document).ready(function() {
			});
			
			function excluirServico(id) {
				$.confirm({
		            'title': '<f:message key="excluir"/>',
		            'message': '<f:message key="mensagem.excluir.item"/>',
		            'buttons': {
		                '<f:message key="sim"/>': {
		                    'class'	: 'confirm',
		                    'action': function(){
		                    	$("#container").waitMe({effect :'ios', text :'', bg :'rgba(255,255,255,0.5)', color :'#000', sizeW :'', sizeH :''});
		                    	$.ajax({
		    						contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		    						type: "POST",
		    						url: "<c:url value="/servicos/remover"/>",
		    						data: {id: id},
		    						success: function(retorno) {
	    										$("#container").load("<c:url value="/servicos/lista"/>");
		    								},
    								  error: function(retorno) {
  								 				jAlert('<f:message key="mensagem.erro.excluir.usuario"/>', '<f:message key="erro"/>');
  								 				$("#listaUsuario").load("<c:url value="/servicos/lista"/>");
					                		}
		    					});
		                    }
		                },
		                '<f:message key="nao"/>': {
		                    'class'	: 'cancel',
		                    'action': function(){}
		                }
		            }
		        });
			}
			
			function consultarServicos(id) {
				$("#container").waitMe({effect :'ios', text :'', bg :'rgba(255,255,255,0.5)', color :'#000', sizeW :'', sizeH :''});
				$("#container").load("<c:url value="/servicos/cadastrar"/>", {id: id});
			}
		</script>
	</head>
	<body>
		
		<div class="box col-md-12">
	        <div class="box-inner">
	            <div class="box-header well">
	                <h2>Meus Serviços</h2>
	            </div>
	            
	            <div class="row">
	            	<div class="form-group col-lg-12">
		           		<c:forEach items="${servicoList}" var="item">
		           			<div style="float: left; width: 284px; height: 200px; margin: 10px; margin-bottom: 30px;">
			           			<div style="float: left; width: 284px; height: 195px; border: 1px solid #e7e7e7; border-radius: 4px; box-shadow: 0 1px 2px 0 rgba(0,0,0,1);
			           			-moz-box-shadow: 0 1px 2px 0 rgba(0,0,0,1); -webkit-box-shadow: 0 1px 2px 0 rgba(0,0,0,1);">
			           				
			           				<div style="height: 125px; text-align: center;">
			           					<c:choose>
			           						<c:when test="${item.imagem != null}">
			           							<img alt="" style="height: 100px; max-width: 250px; margin-top: 15px;" src="<c:url value="${item.imagem}"/>"/>
			           						</c:when>
			           						<c:otherwise>
			           							<img alt="" style="height: 100px; max-width: 250px; margin-top: 15px;" src="<c:url value="/imagens/noimage.jpg"/>"/>
			           						</c:otherwise>
			           					</c:choose>
			           				</div>
			           				
			           				<hr style="width:98%; border-style: inset; border-width: 1px; margin: 0px; margin-bottom: 3px;">
			           				
			           				<span style="width: 100%; padding-left: 5px; text-align: center;">
			           					<strong>Título:</strong> ${item.titulo}
			           				</span>
			           				<br/>
			           				
			           				<span style="width: 100%; padding-left: 5px;">
			           					<strong>Data:</strong> <f:formatDate value="${item.dataCadastro.time}" pattern="dd/MM/yyyy HH:mm"/>
			           				</span>
			           			</div>
			           			<div style="float: left; width: 286px; padding: 5px; text-align: center;">			           				
			           				<a href="#" style="float: left;"> <i class="glyphicon glyphicon-star-empty"></i> Destacar </a>
			           				
			           				<a href="#" onclick="consultarServicos(${item.id});"> <i class="glyphicon glyphicon-edit"></i> Editar </a>
			           				
			           				<a href="#" onclick="excluirServico(${item.id});" style="float: right;"> <i class="glyphicon glyphicon-trash"></i> Excluir </a>
			           			</div>
		           			</div>
						</c:forEach>
					</div>
				</div>
	        </div>
	    </div>
	    
	</body>
</html>