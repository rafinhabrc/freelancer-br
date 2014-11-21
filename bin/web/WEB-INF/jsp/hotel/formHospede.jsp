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
				$("#telefoneCelular").mask("(999) 99999-9999");
				$("#telefoneResidencial").mask("(999) 9999-9999");
				$("#telefoneComercial").mask("(999) 9999-9999");
				$("#rg").mask("99.999.999-9");
				$("#cpf").mask("999.999.999-99");								
				$("#cep").mask("99.999-999");
				
				$("#dataNascimento").kendoDatePicker();
				$("#nHospedes").kendoNumericTextBox();
				$("#camas").kendoNumericTextBox();				
				$("#valorDiaria").kendoNumericTextBox({
                        format: "c",
                        decimals: 3
                    })
                    
               	$("#botaoFechar").click(function() {
				   document.getElementById("container").innerHTML=""; 	  
				});
			});			
		</script>

	</head>
	<body class="divConteudo">	
 	<style scoped>
        li {
            margin-bottom: 15px;                
            list-style: none;
            margin-left: -35px;
        }
        
        input,  textarea, select {
            margin-left: 15px;
            margin-right: 10px;
        }            
   </style>	
		<div id="conteudoPagina" class="k-block k-shadow" style="width: 600px; height: auto; margin:5px 5px;">
			<div class="k-header k-inset">
			  <b><f:message key="${tituloPagina}"/></b>
			</div>
		    <form name="formularioCadastroHotel" method="POST" action="<c:url value='/hotel/gravar'/>">
		        <ul class="forms">
	        	 	<li>
	            		<h4 style="margin-left: 3px; margin-bottom: -5px;"><b>Informações do Hóspede</b></h4> 
		            	<hr width="570" style="margin-left: 5px;">
		            </li>		            	
		            <li>
		            	<label style="margin-left: 15px;">
            				Código
	            		</label>
	            		<label style="margin-left: 85px;">
	            			Nome do Hóspede
	            		</label>	            		
	            		</br>
						<input type="text" class="k-textbox" value="${hospede.id}" name="hospede.id" style="width: 100px;" disabled >	            		    	
		                <input type="text" class="k-textbox" name="hospede.nome" style="width: 425px;"/>
	                </li>	               	
	                <li style="margin-left: 95px;">
		                <label style="margin-left: 15px;">
		            		Sexo
		            	</label>
		            	<label style="margin-left: 113px;">
		            		Cor / Raça
		            	</label>
		            	<label style="margin-left: 78px;">
		            		Data Nascimento
		            	</label>
		            	</br>
                		<select name="hospede.sexo" style="width: 115px;">
							<option value="">Selecione</option>
							<option value="Masculino" <c:if test="${hospede.sexo == 'Masculino'}">selected</c:if>>Masculino</option>
							<option value="Feminino" <c:if test="${hospede.sexo == 'Feminino'}">selected</c:if>>Feminino</option>								
						</select>						
                		<select name="hospede.cor" style="width: 115px; margin-right: 25px;">
							<option value="">Selecione</option>
							<option value="Branco" <c:if test="${hospede.cor == 'Branco'}">selected</c:if>>Branco</option>
							<option value="Amarelo" <c:if test="${hospede.cor == 'Amarelo'}">selected</c:if>>Amarelo</option>
							<option value="Negro" <c:if test="${hospede.cor == 'Negro'}">selected</c:if>>Negro</option>
						</select>
						<input id="dataNascimento" type="text" name="hospede.dataNascimento" style="width: 135px; margin-left: 0px;"/>												
	                </li>       
	                <li>
	                	<label style="margin-left: 15px;">
		            		Estado Civil
		            	</label>
	                	<label style="margin-left: 125px;">
		            		Naturalidade
		            	</label>
		            	<label style="margin-left: 115px;">
		            		Nacionalidade
		            	</label>       	
		            	</br>
	                	<select name="hospede.estadoCivil" style="width: 165px;">
							<option value="">Selecione</option>
							<option value="Solteiro(a)" <c:if test="${hospede.estadoCivil == 'Solteiro(a)'}">selected</c:if>>Solteiro(a)</option>
							<option value="Casado(a)" <c:if test="${hospede.estadoCivil == 'Casado(a)'}">selected</c:if>>Casado(a)</option>
							<option value="Divorciado(a)" <c:if test="${hospede.estadoCivil == 'Divorciado(a)'}">selected</c:if>>Divorciado(a)</option>
							<option value="Viúvo(a)" <c:if test="${hospede.estadoCivil == 'Viúvo(a)'}">selected</c:if>>Viúvo(a)</option>							
						</select>						
		                <input type="text" class="k-textbox" name="hospede.naturalidade" style="width: 165px;"/>		                
		                <input type="text" class="k-textbox" name="hospede.nacionalidade" style="width: 165px;"/>
		            </li>		                    	              
	                <li>
	                	<label style="margin-left: 15px;">
	            			Endereço
		            	</label>
		            	<label style="margin-left: 332px;">
		            		Bairro
		            	</label>
	            		</br>
		                <input type="text" class="k-textbox" name="hospede.endereco" style="width: 360px;"/>
		                <input type="text" class="k-textbox" name="hospede.bairro" style="width: 165px;"/>
		            </li>		            
		            <li>
		            	<label style="margin-left: 15px;">
	            			Complemento
		            	</label>
		            	<label style="margin-left: 110px;">
		            		Cidade
		            	</label>
		            	<label style="margin-left: 150px;">
		            		Estado
		            	</label>
		            	</br>
		                <input type="text" class="k-textbox" name="hospede.complemento" style="width: 165px;"/>		                
	                	<input type="text" class="k-textbox" name="hospede.cidade" style="width: 165px;"/>	                	
	                	<select name="hospede.estado" style="width: 165px;">
							<option value="">Selecione</option>
							<option value="São Paulo" <c:if test="${hospede.cor == 'São Paulo'}">selected</c:if>>São Paulo</option>
							<option value="Rio de Janeiro" <c:if test="${hospede.cor == 'Rio de Janeiro'}">selected</c:if>>Rio de Janeiro</option>								
						</select>
	                </li>	                
	                <li>
	                	<label style="margin-left: 15px;">
	            			CEP
		            	</label>
		            	<label style="margin-left: 169px;">
		            		País
		            	</label>
		            	</br>
	                	<input id="cep" type="text" class="k-textbox" name="hospede.cep" style="width: 165px;"/>	                	
	                	<select name="hospede.pais"  style="width: 165px;">
							<option value="">Selecione</option>
							<option value="Brasil" <c:if test="${hospede.pais == 'Brasil'}">selected</c:if>>Brasil</option>
							<option value="Estados Unidos" <c:if test="${hospede.pais == 'Estados Unidos'}">selected</c:if>>Estados Unidos</option>								
						</select>
	                </li>	                
	                <li>
	                	<label style="margin-left: 15px;">
	            			RG
	            		</label>
	            		<label style="margin-left: 173px;">
	            			CPF
	            		</label>
	            		<label style="margin-left: 170px;">
	            			Email
	            		</label>
	            		</br>
		                <input id="rg" type="text" class="k-textbox" name="hospede.rg" style="width: 165px;"/>		                
	                	<input id="cpf" type="text" class="k-textbox" name="hospede.cpf"style="width: 165px;"/>	                	
	                	<input type="text" class="k-textbox" name="hospede.email" style="width: 165px;" onblur="verificaEmail(this);"/>
	                </li>
	                <li>
	                	<label style="margin-left: 15px;">
	            			Profissão
	            		</label>
	            		<label style="margin-left: 333px;">
	            			Situação
	            		</label>
	            		</br>
		                <input type="text" class="k-textbox" name="hospede.profissao" style="width: 360px;"/>		                
	                	<input type="text" class="k-textbox" name="hospede.situacao" style="width: 165px;"/> 
	                </li>
	                <li>
	                	<label style="margin-left: 15px;">
	            			Telefone Residencial
	            		</label>
	            		<label style="margin-left: 70px;">
	            			Telefone Celular
	            		</label>
	            		<label style="margin-left: 96px;">
	            			Telefone Comercial
	            		</label>
	            		</br>
		                <input id="telefoneResidencial" type="text" class="k-textbox" name="hospede.telefoneResidencial" style="width: 165px;"/>		                
	                	<input id="telefoneCelular" type="text" class="k-textbox" name="hospede.telefoneCelular" style="width: 165px;"/>	                	
	                	<input id="telefoneComercial" type="text" class="k-textbox" mame="hospede.telefoneComercial" style="width: 165px;"/>
	                </li>
	                </br>
	                <li>
	            		<h4 style="margin-left: 3px; margin-bottom: -5px;"><b>Informações Adicionais</b></h4> 
		            	<hr width="570" style="margin-left: 5px;">
		            </li>	                
	                <li>
	                	<label style="margin-left: 15px;">
	            			Ultima Procedência (Cidade, País)
	            		</label>
	            		</br>
	            		<input type="text" class="k-textbox" name="hospede.ultimaProcendencia" style="width: 262px;"/>
	            	</li>
	            	<li>
	            		<label style="margin-left: 15px;">
	            			Próximo Destino (Cidade, País)
	            		</label>
	            		</br>
		                		                
	                	<input type="text" class="k-textbox" name="hospede.proximoDestino" style="width: 262px;"/> 
	                </li>
	                <li>
	                	<label style="margin-left: 15px;">
	            			Motivo da Viagem
	            		</label>	            		
	            		</br>	            		
		                <input type="text" class="k-textbox" name="hospede.motivoViagem" style="width: 265px;"/>
	                </li>
	                <li>
	                	<label style="margin-left: 15px;">
	            			Meio de Transporte
	            		</label>
	            		</br>
	                	<input type="text" class="k-textbox" name="hospede.meioTransporte" style="width: 265px;"/>
	                </li>
	                <li>
	                	<label style="margin-left: 15px;">
                			Observações
                		</label>
                		</br>
	                	<textarea class="k-textbox" name="hospede.observacoes"  style="width: 555px; height:90px;"/>                	
	                </li>	                
	                <li>
	                	<label style="margin-left: 15px;">
	            			Selecione uma Foto :
	            		</label>
	            		</br>
                	 	<input type="file" value="${hospede.foto}" name="hospede.foto"/>
	                </li>
	                </br>
		            <li style="text-align: center;">
		            	<button id="botaoLimpar" type="reset" name="limpar" class="k-button"><span class='k-icon k-cancel'></span>Limpar</button>
		            	<button id="botaoGravar" type="submit" name="gravar" class="k-button"><span class='k-icon k-update'></span>Gravar</button>
		            </li>
		        </ul>
		    </form>
		</div>
	</body>
</html>