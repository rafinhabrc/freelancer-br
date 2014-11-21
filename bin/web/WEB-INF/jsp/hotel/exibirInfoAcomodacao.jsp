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
				$("#dataNascimento").kendoDatePicker();
				$("#nHospedes").kendoNumericTextBox();
				$("#camas").kendoNumericTextBox();
				$("#valorDiaria").kendoNumericTextBox({
                        format: "c",
                        decimals: 3
                });
				$("#telefoneCelular").mask("(999) 99999-9999");
				$("#telefoneResidencial").mask("(999) 9999-9999");
				$("#telefoneComercial").mask("(999) 9999-9999");
				$("#rg").mask("99.999.999-9");
				$("#cpf").mask("999.999.999-99");
				$("#cep").mask("99.999-999");
			});
			
			function checkOut () {
			 	$.ajax({
				contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				type: "POST",
				url: "<c:url value="/clientes/checkOut"/>",
				data: $("#formulario").serialize(),
				success: function(retorno) {
						 }
				});
			}
		</script>
	</head>
	<body class="divConteudo">
 	<style scoped>
   	</style>
   		<form id="formulario" name="formulario" action="#">
	    	<table border="0" cellspacing="0" cellpadding="0" style="width: 500px;">
	   			<tr valign="bottom" style="height: 25px;">
	   				<td rowspan="11" style="width: 15px;"></td>
	   				<td rowspan="5" style="width: 100px;">
	   					<img class="linkSemBorda" src="../imagens/porta.png" style="width: 110px; height: 120px;"/>
	   				</td>
	   				<td style="width: 90px;">
	   					Número
	   				</td>
	   				<td colspan="3" style="width: 270px;">
	   					Nome do Quarto
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td style="width: 90px;">
	   					<input type="hidden" value="${acomodacao.id}" name="idAcomodacao"/>
	   					<input type="text" class="k-textbox" value="${acomodacao.numero}" required style="width: 70px;" disabled/>
	   				</td>
	   				<td colspan="3" style="width: 270px;">
	   					<input type="text" class="k-textbox" value="${acomodacao.nome}" required style="width: 270px;" disabled/>
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 30px;">
	   				<td style="width: 90px;">
	   					Nº Camas
	   				</td>
	   				<td style="width: 85px;">
	   					Max. Hósp
	   				</td>
	   				<td colspan="2" style="width: 180px;">
	   					<f:message key="campo.grupoAcomodacao"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td style="width: 90px;">
	   					<input type="text" class="k-textbox" value="${acomodacao.numeroCamas}" required style="width: 70px;" disabled/>
	   				</td>
	   				<td style="width: 90px;">
	   					<input type="text" class="k-textbox" value="${acomodacao.maximoHospedes}" required style="width: 70px;" disabled/>
	   				</td>
	   				<td colspan="2" style="width: 180px;">
	   					<input type="text" class="k-textbox" value="${acomodacao.tipo.nome}" required style="width: 180px;" disabled/>
	   				</td>
	   			</tr>
	   			<tr style="height: 20px;"></tr>
	        </table>
	        <table border="0" cellspacing="0" cellpadding="0" style="width: 500px;">
	   	<c:choose>
	        <c:when test="${acomodacao.status.id == 1}">
	        	<tr style="height: 20px;"></tr>
	        	<tr>
	   				<td rowspan="15" style="width: 20px;"></td>
	   				<td></td>
	   				<td></td>
	   				<td></td>
	   				<td rowspan="15" style="width: 15px;"></td>
	   			</tr>
				<tr valign="bottom" style="height: 100px;">
	   				<td colspan="3" style="width: 110px">
	   					<h4 style="text-align: center;">Acomodação Livre Para Check In</h4>
	   				</td>
	   			</tr>
	   			<tr style="height: 60px;"></tr>
	   			<tr style="height: 40px;">
	   				<td colspan="3" style="text-align: right;">
	   					<a href="#" onclick="exibe('<c:url value="/clientes/formCheckIn/${acomodacao.id}"/>', 'Cadastrar Hospedagem');">
							<button type="button" class="k-button" style="margin-right: 5px;"><span class='k-icon k-update'></span> Check In</button>
						</a>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
					<td colspan="3" style="text-align: center;">
	   					<a href="#" onclick="consultar('<c:url value="/hotel/consultarAcomodacao/${acomodacao.id}"/>', 'Informações da Acomodação');">
	   						Ver Mais
	   					</a>
	   				</td>
				</tr>
			</c:when>
			 <c:when test="${acomodacao.status.id == 3}">
			 	<tr style="height: 20px;"></tr>
	        	<tr>
	   				<td rowspan="15" style="width: 20px;"></td>
	   				<td></td>
	   				<td></td>
	   				<td></td>
	   				<td rowspan="15" style="width: 15px;"></td>
	   			</tr>
				<tr valign="bottom" style="height: 100px;">
	   				<td colspan="3" style="width: 110px">
	   					<h4 style="text-align: center;">Acomodação em Manutenção</h4>
	   				</td>
	   			</tr>
	   			<tr style="height: 90px;"></tr>
	   			<tr style="height: 40px;">
					<td colspan="3" style="text-align: center;">
	   					<a href="#" onclick="consultar('<c:url value="/hotel/consultarAcomodacao/${acomodacao.id}"/>', 'Informações da Acomodação');">
	   						Ver Mais
	   					</a>
	   				</td>
				</tr>
			</c:when>
			 <c:when test="${acomodacao.status.id == 4}">
			 	<tr style="height: 20px;"></tr>
	        	<tr>
	   				<td rowspan="15" style="width: 20px;"></td>
	   				<td></td>
	   				<td></td>
	   				<td></td>
	   				<td rowspan="15" style="width: 15px;"></td>
	   			</tr>
				<tr valign="bottom" style="height: 100px;">
	   				<td colspan="3" style="width: 110px">
	   					<h4 style="text-align: center;">Acomodação em Limpeza</h4>
	   				</td>
	   			</tr>
	   			<tr style="height: 90px;"></tr>
	   			<tr style="height: 40px;">
					<td colspan="3" style="text-align: center;">
	   					<a href="#" onclick="consultar('<c:url value="/hotel/consultarAcomodacao/${acomodacao.id}"/>', 'Informações da Acomodação');">
	   						Ver Mais
	   					</a>
	   				</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr style="height: 20px;">
	   				<td colspan="5" style="width: 470px">
	   					<h4 style="margin-bottom: -5px; margin-left: 15px;">Informações do Hóspede</h4>
	            		<hr width="470" style="margin-left: 15px;">
	   				</td>
	        	</tr>
	        	<tr valign="bottom">
	   				<td rowspan="15" style="width: 20px;"></td>
	   				<td></td>
	   				<td></td>
	   				<td></td>
	   				<td rowspan="15" style="width: 15px;"></td>
	   			</tr>
				<tr valign="bottom" style="height: 20px;">
	   				<td style="width: 110px">
	   					Código
	   				</td>
	   				<td colspan="2" style="width: 350px;">
	   					Nome
	   				</td>
	   			</tr>
	   			<tr>
	   				<td style="width: 110px">
	   					<input type="hidden" value="${hospedeHospedagem.id}" name="idHospedeHospedagem"/>
	   					<input type="text" class="k-textbox" value="${hospedeHospedagem.hospede.codigo}" required style="width: 90px;" disabled/>
	   				</td>
	   				<td colspan="2" style="width: 350px;">
	   					<input type="text" class="k-textbox" value="${hospedeHospedagem.hospede.nome}" required style="width: 345px;" disabled/>
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 25px;">
	   				<td></td>
	   				<td style="width: 175px">
	   					<f:message key="campo.rg"/>
	   				</td>
	   				<td style="width: 165px;">
	   					<f:message key="campo.cpf"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td></td>
	   				<td style="width: 175px">
	   					<input type="text" class="k-textbox" value="${hospedeHospedagem.hospede.rg}" required style="width: 160px;"/>
	   				</td>
	   				<td style="width: 165px;">
	   					<input type="text" class="k-textbox" value="${hospedeHospedagem.hospede.cpf}" required style="width: 165px;"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 15px;"></tr>
	   			<tr style="height: 25px;">
	   				<td colspan="2">
	   					<img class="linkSemBorda" src="../imagens/iconeRelogio.png" style="width: 18px; height: 18px;"/>
	   					<b>In:</b> <f:formatDate value="${hospedeHospedagem.hospedagem.dataCheckIn.time}" pattern="dd/MM/yyyy HH:mm:ss"/>	   					
	   				</td>
	   				<td></td>
	   			</tr>
	   			<tr style="height: 25px;">	   				
	   				<td colspan="2">
	   					<img class="linkSemBorda" src="../imagens/iconeRelogio.png" style="width: 18px; height: 18px;"/>
	   					<b>Out:</b> <f:formatDate value="${hospedeHospedagem.hospedagem.dataCheckOut.time}" pattern="dd/MM/yyyy HH:mm:ss"/>	
	   				</td>
	   				<td style="text-align: right;">
	   					<button type="button" class="k-button" onclick="checkOut()" style="margin-right: 5px;"><span class='k-icon k-cancel'></span> Check Out</button>   					
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;"></tr>
	   			<tr style="height: 10px;">
					<td colspan="3" style="text-align: center;">
	   					<a href="#" onclick="consultar('<c:url value="/clientes/consultarHospedeHospedagem/${hospedeHospedagem.id}"/>', 'Informações da Hospedagem');">
	   						Ver Mais
	   					</a>
	   				</td>
				</tr>
			</c:otherwise>
		</c:choose>				
	        </table>
       </form>
	</body>
</html>