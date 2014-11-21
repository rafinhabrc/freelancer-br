<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>

<html lang="pt-br">
	<head>
		<title><f:message key="nomeSistema"/></title>
		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<script type="text/javascript" src="<c:url value="/js/funcoesValidacao.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.maskedinput-1.2.2.js"/>">></script>
		<script type="text/javascript">
			$(document).ready(function () {
				$("#telefone").mask("(99)9999-9999");
				$("#nHospedes").kendoNumericTextBox({
					format : "#"
				});
				$("#camas").kendoNumericTextBox({
					format : "#"
				});
				$("#valorDiaria").kendoNumericTextBox({
                        format: "c",
                        decimals: 3
                });
                $("#foto1").kendoUpload();
			});
			
			function gravar() {
				// funcao para salvar formulario
		        validator =   $("#formAcomodacao").kendoValidator({ // aqui e chamda a funcao que valida o formulario
			     messages: {
			         // mensagem para campo requerido
		         	required: "<f:message key= "campoObrigatorio"/>"
			         // 		validacao de email testar
			         //  	 email: function(input) {
			         //       return getMessage(input);
			         //   }
			     } }).data("kendoValidator");   
					if (validator.validate()) {  // se nao tiver nenhum campo obrigatorio sem preencher executa a funcao para salvar
					 	$.ajax({
						contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
						type: "POST",
						url: "<c:url value="/hotel/gravarAcomodacao"/>",
						data: $("#formAcomodacao").serialize(),
						success: function(retorno) {
								 }
						});	 
			    	} 
			}
		</script>
	</head>
	<style scoped>
		input[type="radio"] {
			margin-right: 15px;
		}
	</style>
	<body class="divConteudo">
    	<form id="formAcomodacao" name="formAcomodacao" action="#">
    		<table border="0" cellspacing="0" cellpadding="0" style="width: 615px;">
	   			<tr valign="bottom" style="height: 20px;">
	   				<td rowspan="30" style="width: 15px;"></td>
	   				<td colspan="2" style="width: 390px;">
	   					<f:message key="campo.nomeQuarto"/>
	   				</td>
	   				<td colspan="2" style="width: 195px;">
	   					<f:message key="campo.nQuarto"/>
	   				</td>
	   				<td rowspan="30" style="width: 10px;"></td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td colspan="2" style="width: 390px;">
	   					<input type="hidden" class="k-textbox" value="${hotel.id}" name="acomodacao.hotel.id">
	   					<input type="text" class="k-textbox" name="acomodacao.nome" required style="width: 370px;"/>
	   				</td>
	   				<td colspan="2" style="width: 195px;">
	   					<input type="text" class="k-textbox" name="acomodacao.numero" required style="width: 175px;"/>
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 25px;">
	   				<td colspan="2" style="width: 390px;">
	   					<f:message key="campo.grupoAcomodacao"/>
	   				</td>
	   				<td style="width: 98px;">
	   					<f:message key="campo.nCamas"/>
	   				</td>
	   				<td style="width: 97px;">
	   					<f:message key="campo.nHospedes"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td colspan="2" style="width: 390px;">
	   					<select id="servico" name="acomodacao.tipo.id" style="width: 370px;">
							<option value=""><f:message key="selecione"/></option>
							<c:forEach items="${tipoAcomodacaoList}" var="item">
							<option value="${item.id}">${item.nome}</option>
							</c:forEach>
						</select>
	   				</td>
	   				<td style="width: 98px;">
	   					<input id="camas" type="text" name="acomodacao.numeroCamas" required style="width: 78px;" step="1"/>
	   				</td>
	   				<td style="width: 97px;">
	   					<input id="nHospedes" type="text" name="acomodacao.maximoHospedes" required style="width: 77px;" step="1"/>
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 25px;">
	   				<td colspan="4" style="width: 590px;">
	   					<f:message key="campo.descricao"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td colspan="4" style="width: 590px;">
	   					<textarea class="k-textbox" value="${acomodacao.tipo.descricao}" style="width: 570px; height:90px;" disabled/>
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 25px;">
	   				<td colspan="4" style="width: 590px;">
	   					<f:message key="campo.observacoes"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td colspan="4" style="width: 590px;">
	   					<textarea class="k-textbox" name="acomodacao.observacoes" style="width: 570px; height:90px;"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 20px;">
	   				<td colspan="4" style="width: 590px;">
	   					<h4 style="margin-bottom: -5px;"><f:message key="subTitulo.especificacoes"/></h4>
	            		<hr width="575" style="margin-left: -3px;">
	   				</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td colspan="2">
            			<label style="margin-left: 120px; margin-right: 15px;">
            				<f:message key="sim"/>
            			</label>
            			<label>
            				<f:message key="nao"/>
            			</label>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.arCondicionado"/>
            		</td>
            		<td colspan="2">
            			<input type="radio" name="acomodacao.arCondicionado" value="true"/>
        				<input type="radio" name="acomodacao.arCondicionado" value="false" checked/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.camaBox"/>
            		</td>
            		<td colspan="2">
            			<input type="radio" name="acomodacao.camaBox" value="true"/>
            			<input type="radio" name="acomodacao.camaBox" value="false"/ checked>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.secadorCabelo"/>
            		</td>
            		<td colspan="2">
            			<input type="radio" name="acomodacao.secadorCabelo" value="true"/>
            			<input type="radio" name="acomodacao.secadorCabelo" value="false"/ checked>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.cofre"/>
            		</td>
            		<td colspan="2">
            			<input type="radio" name="acomodacao.cofre" value="true"/>
            			<input type="radio" name="acomodacao.cofre" value="false" checked/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.dvd"/>
            		</td>
            		<td colspan="2">
            			<input type="radio" name="acomodacao.dvd" value="true"/>
            			<input type="radio" name="acomodacao.dvd" value="false" checked/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.fogao"/>
            		</td>
            		<td colspan="2">
            			<input type="radio" name="acomodacao.fogao" value="true"/>
            			<input type="radio" name="acomodacao.fogao" value="false" checked/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.microondas"/>
            		</td>
            		<td colspan="2">
            			<input type="radio" name="acomodacao.microondas" value="true"/>
            			<input type="radio" name="acomodacao.microondas" value="false" checked/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.frigobar"/>
            		</td>
            		<td colspan="2">
            			<input type="radio" name="acomodacao.frigobar" value="true"/>
            			<input type="radio" name="acomodacao.frigobar" value="false" checked/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.tvLCD"/>
            		</td>
            		<td colspan="2">
            			<input type="radio" name="acomodacao.tvLCD" value="true"/>
            			<input type="radio" name="acomodacao.tvLCD" value="false" checked/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.tvTubo"/>
            		</td>
            		<td colspan="2">
            			<input type="radio" name="acomodacao.tvTubo" value="true"/>
            			<input type="radio" name="acomodacao.tvTubo" value="false" checked/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.utensiliosCozinha"/>
            		</td>
            		<td colspan="2">
            			<input type="radio" name="acomodacao.utensiliosCozinha" value="true"/>
            			<input type="radio" name="acomodacao.utensiliosCozinha" value="false" checked/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.ventilador"/>
            		</td>
            		<td colspan="2">
            			<input type="radio" name="acomodacao.ventilador" value="true"/>
            			<input type="radio" name="acomodacao.ventilador" value="false" checked/>
            		</td>
            	</tr>
            	<tr style="height: 20px;">
	   				<td colspan="4" style="width: 590px;">
	   					<h4 style="margin-bottom: -5px;"> Selecione Imagens da Acomodoção </h4>
	            		<hr width="575" style="margin-left: -3px;">
	   				</td>
            	</tr>
            	<tr style="height: 50px;">
            		<td colspan="2">
            			<input type="file">
            		</td>
            	</tr>
            	<tr style="height: 50px;">
            		<td colspan="2">
            			<input type="file">
            		</td>
            	</tr>
            	<tr style="height: 50px;">
            		<td colspan="2">
            			<input type="file">
            		</td>
            	</tr>
            	<tr style="height: 50px;">
            		<td colspan="2">
            			<input type="file">
            		</td>
            	</tr>
            	<tr valign="bottom" style="height: 50px;">
            		<td colspan="5">
            			<label style="width: 120px; margin-left: 450px;">
            				<f:message key="campo.valorDiaria"/>
            			</label>
            		</td>
            	</tr>
            	<tr style="height: 10px;">
            		<td colspan="5">
            			<span style="width: 120px; margin-left: 450px;">
            				<input id="valorDiaria" type="text" min="0" value="" name="acomodacao.valorDiaria" placeholder="R$ 00,00" required style="width: 120px;"/>
            			</span>
            		</td>
            	</tr>
            	<tr style="height: 80px;">
            		<td colspan="5" style="text-align: center;">
            			<button type="reset" name="limpar" class="k-button"><span class='k-icon k-cancel'></span><f:message key="limpar"/></button>
	            		<button type="button" class="k-button" onclick="gravar()"><span class='k-icon k-update'></span><f:message key="gravar"/></button>
            		</td>
            	</tr>
	   		</table>
	    </form>
	</body>
</html>