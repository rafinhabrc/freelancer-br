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

                var arcondicionado = ${acomodacao.arCondicionado};
                var camaBox = ${acomodacao.camaBox};
                var secadorCabelo = ${acomodacao.secadorCabelo};
                var cofre = ${acomodacao.cofre};
                var dvd = ${acomodacao.dvd};
                var fogao = ${acomodacao.fogao};
                var microondas = ${acomodacao.microondas};
                var frigobar = ${acomodacao.frigobar};
                var tvLCD = ${acomodacao.tvLCD};
                var tvTubo = ${acomodacao.tvTubo};
                var utensiliosCozinha = ${acomodacao.utensiliosCozinha};
                var ventilador = ${acomodacao.ventilador};
                
                if (arcondicionado == true) {
					$("#arCondicionadoTrue").attr("checked",true);
				} else {
					$("#arCondicionadoFalse").attr("checked",true);
				}
				if (camaBox == true) {
					$("#camaBoxTrue").attr("checked",true);
				} else {
					$("#camaBoxFalse").attr("checked",true);
				}
				if (secadorCabelo == true) {
					$("#secadorCabeloTrue").attr("checked",true);
				} else {
					$("#secadorCabeloFalse").attr("checked",true);
				}
				if (cofre == true) {
					$("#cofreTrue").attr("checked",true);
				} else {
					$("#cofreFalse").attr("checked",true);
				}
				if (dvd == true) {
					$("#dvdTrue").attr("checked",true);
				} else {
					$("#dvdFalse").attr("checked",true);
				}
				if (fogao == true) {
					$("#fogaoTrue").attr("checked",true);
				} else {
					$("#fogaoFalse").attr("checked",true);
				}
				if (microondas == true) {
					$("#microondasTrue").attr("checked",true);
				} else {
					$("#microondasFalse").attr("checked",true);
				}
				if (frigobar == true) {
					$("#frigobarTrue").attr("checked",true);
				} else {
					$("#frigobarFalse").attr("checked",true);
				}
				if (tvLCD == true) {
					$("#tvLCDTrue").attr("checked",true);
				} else {
					$("#tvLCDFalse").attr("checked",true);
				}
				if (tvTubo== true) {
					$("#tvTuboTrue").attr("checked",true);
				} else {
					$("#tvTuboFalse").attr("checked",true);
				}
				if (utensiliosCozinha == true) {
					$("#utensiliosCozinhaTrue").attr("checked",true);
				} else {
					$("#utensiliosCozinhaFalse").attr("checked",true);
				}
				if (ventilador == true) {
					$("#ventiladorTrue").attr("checked",true);
				} else {
					$("#ventiladorFalse").attr("checked",true);
				}
			});
			
			function gravar() {
				// funcao para salvar formulario
		        validator =   $("#formAlterarAcomodacao").kendoValidator({ // aqui e chamda a funcao que valida o formulario
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
						url: "<c:url value="/hotel/alterarAcomodacao"/>",
						data: $("#formAlterarAcomodacao").serialize(),
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
    	<form id="formAlterarAcomodacao" name="formAlterarAcomodacao" action="#">
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
	   					<input type="hidden" value="${acomodacao.id}" name="acomodacao.id"/>
	   					<input type="text" class="k-textbox" value="${acomodacao.nome}" name="acomodacao.nome" required style="width: 370px;"/>
	   				</td>
	   				<td colspan="2" style="width: 195px;">
	   					<input type="text" class="k-textbox" value="${acomodacao.numero}" name="acomodacao.numero" required style="width: 175px;"/>
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 25px;">
	   				<td style="width: 195px;">
	   					<f:message key="campo.grupoAcomodacao"/>
	   				</td>
	   				<td style="width: 195px;">
	   					Status da Acomodação
	   				</td>
	   				<td style="width: 98px;">
	   					<f:message key="campo.nCamas"/>
	   				</td>
	   				<td style="width: 97px;">
	   					<f:message key="campo.nHospedes"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td style="width: 195px;">
	   					<select name="acomodacao.tipo.id" style="width: 175px;">
	   						<option value="${acomodacao.tipo.id}">${acomodacao.tipo.nome}</option>
							<c:forEach items="${tipoAcomodacaoList}" var="item">
							<option value="${item.id}">${item.nome}</option>
							</c:forEach>
						</select>
	   				</td>
	   				<td style="width: 195px;">
	   					<select name="acomodacao.status.id" style="width: 175px;">
	   						<option value="${acomodacao.status.id}">${acomodacao.status.titulo}</option>
							<c:forEach items="${statusList}" var="item">
							<option value="${item.id}">${item.titulo}</option>
							</c:forEach>
						</select>
	   				</td>
	   				<td style="width: 98px;">
	   					<input id="camas" type="text" value="${acomodacao.numeroCamas}" name="acomodacao.numeroCamas" required style="width: 78px;" step="1"/>
	   				</td>
	   				<td style="width: 97px;">
	   					<input id="nHospedes" type="text" value="${acomodacao.maximoHospedes}" name="acomodacao.maximoHospedes" required style="width: 77px;" step="1"/>
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 25px;">
	   				<td colspan="4" style="width: 590px;">
	   					Descrição do Grupo de Acomodação
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td colspan="4" style="width: 590px;">
	   					<textarea class="k-textbox" style="width: 570px; height:90px;" disabled>${acomodacao.tipo.descricao}</textarea>
	   				</td>
	   			</tr>
	   			<tr valign="bottom" style="height: 25px;">
	   				<td colspan="4" style="width: 590px;">
	   					<f:message key="campo.observacoes"/>
	   				</td>
	   			</tr>
	   			<tr style="height: 10px;">
	   				<td colspan="4" style="width: 590px;">
	   					<textarea class="k-textbox" name="acomodacao.observacoes" style="width: 570px; height:90px;">${acomodacao.observacoes}</textarea>
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
            			<label style="margin-left: 195px; margin-right: 15px;">
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
            			<input id="arCondicionadoTrue" type="radio" value="true" name="acomodacao.arCondicionado"/>
        				<input id="arCondicionadoFalse" type="radio" value="false" name="acomodacao.arCondicionado"/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.camaBox"/>
            		</td>
            		<td colspan="2">
            			<input id="camaBoxTrue" type="radio" value="true" name="acomodacao.camaBox"/>
            			<input id="camaBoxFalse" type="radio" value="false" name="acomodacao.camaBox"/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.secadorCabelo"/>
            		</td>
            		<td colspan="2">
            			<input id="secadorCabeloTrue" type="radio" value="true" name="acomodacao.secadorCabelo"/>
            			<input id="secadorCabeloFalse" type="radio" value="false" name="acomodacao.secadorCabelo"/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.cofre"/>
            		</td>
            		<td colspan="2">
            			<input id="cofreTrue" type="radio" value="true" name="acomodacao.cofre"/>
            			<input id="cofreFalse" type="radio" value="false" name="acomodacao.cofre"/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.dvd"/>
            		</td>
            		<td colspan="2">
            			<input id="dvdTrue" type="radio" value="true" name="acomodacao.dvd"/>
            			<input id="dvdFalse" type="radio" value="false" name="acomodacao.dvd"/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.fogao"/>
            		</td>
            		<td colspan="2">
            			<input id="fogaoTrue" type="radio" value="true" name="acomodacao.fogao"/>
            			<input id="fogaoFalse" type="radio" value="false" name="acomodacao.fogao"/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.microondas"/>
            		</td>
            		<td colspan="2">
            			<input id="microondasTrue" type="radio" value="true" name="acomodacao.microondas"/>
            			<input id="microondasFalse" type="radio" value="false" name="acomodacao.microondas"/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.frigobar"/>
            		</td>
            		<td colspan="2">
            			<input id="frigobarTrue" type="radio" value="true" name="acomodacao.frigobar"/>
            			<input id="frigobarFalse" type="radio" value="false" name="acomodacao.frigobar"/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.tvLCD"/>
            		</td>
            		<td colspan="2">
            			<input id="tvLCDTrue" type="radio" value="true" name="acomodacao.tvLCD"/>
            			<input id="tvLCDFalse" type="radio" value="false" name="acomodacao.tvLCD"/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.tvTubo"/>
            		</td>
            		<td colspan="2">
            			<input id="tvTuboTrue" type="radio" value="true" name="acomodacao.tvTubo"/>
            			<input id="tvTuboFalse" type="radio" value="false" name="acomodacao.tvTubo"/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.utensiliosCozinha"/>
            		</td>
            		<td colspan="2">
            			<input id="utensiliosCozinhaTrue" type="radio" value="true" name="acomodacao.utensiliosCozinha"/>
            			<input id="utensiliosCozinhaFalse" type="radio" value="false" name="acomodacao.utensiliosCozinha"/>
            		</td>
            	</tr>
            	<tr style="height: 30px;">
            		<td style="width: 120px;">
        				<f:message key="campo.ventilador"/>
            		</td>
            		<td colspan="2">
            			<input id="ventiladorTrue" type="radio" value="true" name="acomodacao.ventilador"/>
            			<input id="ventiladorFalse" type="radio" value="false" name="acomodacao.ventilador"/>
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
            				<input id="valorDiaria" type="text" min="0" value="${acomodacao.valorDiariaString}" name="acomodacao.valorDiaria" required style="width: 120px;"/>
            			</span>
            		</td>
            	</tr>
            	<tr style="height: 80px;">
            		<td colspan="5" style="text-align: center;">
	            		<button type="button" class="k-button" onclick="gravar()"><span class='k-icon k-update'></span><f:message key="gravar"/></button>
            		</td>
            	</tr>
	   		</table>
	    </form>
	</body>
</html>