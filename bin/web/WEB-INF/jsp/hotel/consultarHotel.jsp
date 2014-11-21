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
				$("#telefone").mask("(99)9999-9999");
				$("#cnpj").mask("99.999.999/9999-99");
				$("#cep").mask("99.999-999");
				$("#padraoCheckIn").kendoTimePicker({
				     format: "dd/MM/yyyy HH:mm:ss"
				});
				$("#padraoCheckOut").kendoTimePicker({
				     format: "dd/MM/yyyy HH:mm:ss"
				});
				$("#padraoCheckOutEstendido").kendoTimePicker({
				     format: "dd/MM/yyyy HH:mm:ss"
				});
				
				var permiteMeiaDiariaCheckOutEstendido = ${hotel.permiteMeiaDiariaCheckOutEstendido};
				
                if (permiteMeiaDiariaCheckOutEstendido == true) {
					$("#permiteMeiaDiariaCheckOutEstendidoTrue").attr("checked",true);
				} else {
					$("#permiteMeiaDiariaCheckOutEstendidoFalse").attr("checked",true);
				}
			});
			
			function gravar() {
				// funcao para salvar formulario
		        validator = $("#formAlterarHotel").kendoValidator({ // aqui e chamada a funcao que valida o formulario
			     messages: {
			         // mensagem para campo requerido
		         	required: "<f:message key="campoObrigatorio"/>"
			         // 		validacao de email testar
			         //  	 email: function(input) {
			         //       return getMessage(input);
			         //   }
			     } }).data("kendoValidator");   
					if (validator.validate()) {  // se nao tiver nenhum campo obrigatorio sem preencher executa a funcao para salvar
					 	$.ajax({
						contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
						type: "POST",
						url: "<c:url value="/hotel/alterarHotel"/>",
						data: $("#formAlterarHotel").serialize(),
						success: function (retorno) {
				                 	w.data("kendoWindow").destroy();
				           		}														
						});
			    	} 
			}			
		</script>
	</head>
	<body class="divConteudo">
	   	<form id="formAlterarHotel" name="formAlterarHotel" action="#">
	   		<table border="0" cellspacing="0" cellpadding="0" style="width: 615px;">
	   			<tr valign="bottom" style="height: 20px;">
	   				<td rowspan="21" style="width: 15px;"></td>
	   				<td colspan="2" style="width: 390px;">
	   					<f:message key="campo.nomeHotel"/>
	   				</td>
	   				<td style="width: 195px;">
	   					<f:message key="campo.cnpj"/>
	   				</td>
	   				<td rowspan="21" style="width: 10px;"></td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td colspan="2" style="width: 390px;">
	   					<input type="hidden" value="${hotel.id}" name="hotel.id"/>
	   					<input type="text" class="k-textbox" value="${hotel.nome}" name="hotel.nome" required style="width: 370px;"/>
	   				</td>
	   				<td style="width: 195px;">
	   					<input id="cnpj" type="text" class="k-textbox" value="${hotel.cnpj}" name="hotel.cnpj" required style="width: 175px;"/>
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 20px;">
	   				<td colspan="2" style="width: 390px;">
	   					<f:message key="campo.endereco"/>
	   				</td>
	   				<td style="width: 195px;">
	   					<f:message key="campo.bairro"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td colspan="2" style="width: 390px;">
	   					<input type="text" class="k-textbox" value="${hotel.endereco}" name="hotel.endereco" required style="width: 370px;"/>
	   				</td>
	   				<td style="width: 195px;">
	   					<input type="text" class="k-textbox" value="${hotel.bairro}" name="hotel.bairro" required style="width: 175px;"/>
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 20px;">
	   				<td style="width: 195px;">
	   					<f:message key="campo.complemento"/>
	   				</td>
	   				<td style="width: 195px;">
	   					<f:message key="campo.cidade"/>
	   				</td>
	   				<td style="width: 195px;">
	   					<f:message key="campo.estado"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td style="width: 195px;">
	   					<input type="text" class="k-textbox" value="${hotel.complemento}" name="hotel.complemento" required style="width: 175px;"/>
	   				</td>
	   				<td style="width: 195px;">
	   					<input type="text" class="k-textbox" value="${hotel.cidade}" name="hotel.cidade" required style="width: 175px;"/>
	   				</td>
	   				<td style="width: 195px;">
	   					<select value="${hotel.uf}" name="hotel.uf" required style="width: 175px;">
							<option value=""><f:message key="selecione"/></option>
							<option value="São Paulo" <c:if test="${hotel.uf == 'São Paulo'}">selected</c:if>>São Paulo</option>
							<option value="Rio de Janeiro" <c:if test="${hotel.uf == 'Rio de Janeiro'}">selected</c:if>>Rio de Janeiro</option>
						</select>
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 20px;">
	   				<td style="width: 195px;">
	   					<f:message key="campo.cep"/>
	   				</td>
	   				<td style="width: 195px;">
	   					<f:message key="campo.telefone"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td style="width: 195px;">
	   					<input id="cep" type="text" class="k-textbox" value="${hotel.cep}" name="hotel.cep" required style="width: 175px;"/>
	   				</td>
	   				<td style="width: 195px;">
	   					<input id="telefone" type="text" class="k-textbox" value="${hotel.telefone}" name="hotel.telefone" required style="width: 175px;"/>
	   				</td>
	   				
	   			</tr>
	   			<tr valign="bottom" style="height: 25px;">
	   				<td colspan="2" style="width: 390px;">
	   					<f:message key="campo.email"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td colspan="2" style="width: 390px;">
	   					<input type="text" class="k-textbox" value="${hotel.email}" name="hotel.email" required style="width: 370px;" onblur="verificaEmail(this);"/>
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 25px;">
	   				<td colspan="3" style="width: 590px;">
	   					<f:message key="campo.site"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td colspan="3" style="width: 590px;">
	   					<input type="text" class="k-textbox" value="${hotel.site}" name="hotel.site" style="width: 570px;"/>
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 25px;">
	   				<td colspan="2" style="width: 200px;">
	   					<f:message key="campo.padraoCheckIn"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td colspan="2" style="width: 200px;">
	   					<input id="padraoCheckIn" type="text" value="<f:formatDate value="${hotel.padraoCheckIn.time}" pattern="dd/MM/yyyy HH:mm:ss"/>" name="hotel.padraoCheckIn" required style="width: 200px;" />
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 25px;">
	   				<td colspan="2" style="width: 200px;">
	   					<f:message key="campo.padraoCheckOut"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td colspan="2" style="width: 200px;">
	   					<input id="padraoCheckOut" type="text" value="<f:formatDate value="${hotel.padraoCheckOut.time}" pattern="dd/MM/yyyy HH:mm:ss"/>" name="hotel.padraoCheckOut" required style="width: 200px;" />
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 25px;">
	   				<td colspan="2" style="width: 200px;">
	   					<f:message key="campo.padraoCheckOutEstendido"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td colspan="2" style="width: 200px;">
	   					<input id="padraoCheckOutEstendido" value="<f:formatDate value="${hotel.padraoCheckOutEstendido.time}" pattern="dd/MM/yyyy HH:mm:ss"/>" type="text" name="hotel.padraoCheckOutEstendido" required style="width: 200px;" />
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 30px;">
	   				<td colspan="2" style="width: 250px;">
	   					<f:message key="campo.permiteMeiaDiariaCheckOutEstendido"/>
						<span style="margin-left: 20px;">
		   					<f:message key="sim"/> <input type="radio" id="permiteMeiaDiariaCheckOutEstendidoTrue" name="hotel.permiteMeiaDiariaCheckOutEstendido" value="true"/>
	        				<f:message key="nao"/> <input type="radio" id="permiteMeiaDiariaCheckOutEstendidoFalse" name="hotel.permiteMeiaDiariaCheckOutEstendido" value="false"/>
	        			</span>
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 30px;">
	   				<td colspan="2" style="width: 200px;">
	   					<f:message key="campo.selecioneLogo"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td colspan="2" style="width: 200px;">
	   					<input type="file" name="hotel.logo"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 20px;"></tr>
	   			<tr style="height: 20px;">
	   				<td colspan="4" style="width: 565px; text-align: center;">
	   					<button type="button" class="k-button" onclick="gravar()"><span class='k-icon k-update'></span><f:message key="gravar"/></button>
	   				</td>
	   			</tr>
	   		</table>
	    </form>
	</body>
</html>