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
				moment.locale("pt-br");
				
				var options = {position: {x:'center', y:'top'}, lang: 'hr', errorMessages: {hr: {'required': '<f:message key="campo.obrigatorio"/>' }}};
			    
				$("#formUsuario").bValidator(options);
				
				$("#rg").mask("99.999.999-9");
				$("#cpf").mask("999.999.999-99");
				$("#cnpj").mask("99.999.999/9999-99");
				$("#cep").mask("99999-999");
				
				$("#dataNascimento").mask("99/99/9999").datetimepicker({changeMonth: true, changeYear: true, yearRange: "-100:+0"});

				$("#telefoneContato").focus(function(){
					$(this).mask("(99) 9999-9999?9",{completed:function(){$(this).mask("(99) 99999-9999");}});
				});
				
				$("#telefoneComercial").focus(function(){
					$(this).mask("(99) 9999-9999?9",{completed:function(){$(this).mask("(99) 99999-9999");}});
				});
				
				$("#telefoneResidencial").focus(function(){
					$(this).mask("(99) 9999-9999?9",{completed:function(){$(this).mask("(99) 99999-9999");}});
				});
				
				$("#usuarioJuridico").hide();
	    		$("#usuarioJuridico :input").attr("disabled", true);
	    		
	    		$("#cep").blur(function(){
					if ($(this).val() != "") {
						$(this).next().empty().append("<f:message key="aguarde"/>");
						$.getJSON("<c:url value="/cep/consulta/"/>" + $(this).val(), function(data) {
							$("#estado").val(data.endereco.estado);
							$("#cidade").val(data.endereco.cidade);
							$("#endereco").val(data.endereco.endereco);
							$("#bairro").val(data.endereco.bairro);
							
							$("#cep").next().empty();
						});
					}
				});
	    		
		        $("input[name='tipoUsuario']").click(function(){
		            if($(this).attr("value")=="fisico"){
		                $("#usuarioJuridico").hide();
		                $("#usuarioFisico").show();
						
		                $("#usuarioJuridico :input").attr("disabled", true);
		                $("#usuarioFisico :input").removeAttr("disabled");
		            }
		            
		            if($(this).attr("value")=="juridico"){
		                $("#usuarioFisico").hide();
		                $("#usuarioJuridico").show();
						
		                $("#usuarioFisico :input").attr("disabled", true);
		                $("#usuarioJuridico :input").removeAttr("disabled");
		            }
		        });
		        
		        $("#email").blur(function() {
					var email = $("#email").val();
					
					if (email != null) {
						email = email.replace(/^\s+|\s+$/g,"");
						
						$.ajax({
							type: "POST",
							url: "<c:url value="/usuario/validarEmail"/>",
							data: "email=" + email,
							dataType: "text",
							success: function(retorno){
										if (retorno == "true") {
											$("#formUsuario").data("bValidators").first.showMsg($("#email"), 'Email Disponível');
										} else {
											$("#formUsuario").data("bValidators").first.showMsg($("#email"), 'Email Não Disponível');
										}
									 }
						});
					}
				});
		        
		        $("#formUsuario").submit(function() {
					if($("#formUsuario").data("bValidator").isValid()){
						if ($("#senha").val() != $("#confirmarSenha").val()) {
							$("#formUsuario").data("bValidators").first.showMsg($("#senha"), 'As senhas são diferentes');
							$("#formUsuario").data("bValidators").first.showMsg($("#confirmarSenha"), 'As senhas são diferentes');
						} else {
							$("html").waitMe({effect :'ios', text :'', bg :'rgba(255,255,255,0.5)', color :'#000', sizeW :'', sizeH :''});
							$.ajax({
								contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
								type: "POST",
								url: "<c:url value="/usuario/gravar"/>",
								data: $("#formUsuario").serialize(),
								success: function(retorno) {
											window.location = "<c:url value="/principal"/>";
										 }
							});
						}
					}
					return false;
				});
			});
		</script>
	</head>
	<body>
		
		<div class="box col-md-12">
	        <div class="box-inner">
	            <div class="box-header well">
	                <h2>Faça seu Cadastro</h2>
	            </div>
	            
	            <form id="formUsuario" name="formUsuario" action="#">
		            <div class="box-content">
		            	<div class="row">
	                		<div class="checkbox">
	                			<label><strong>Tipo de cadastro: </strong></label>
			                    <label>
			                    	<i class="glyphicon glyphicon-user"></i> Físico
		                        	<input type="radio" value="fisico" name="tipoUsuario" checked>
		                        </label>
			                    <label>
			                    	<i class="glyphicon glyphicon-briefcase"></i> Jurídico
			                        <input type="radio" value="juridico" name="tipoUsuario">
			                    </label>
			                </div>
	                	</div>
	                	<br/>
	                	
		                <div id="usuarioFisico">
		                	
		                	<div class="row">
			                    <div class="form-group col-lg-4">
			                        <label>Nome</label>
			                        <input type="text" name="usuario.fisico.nome" data-bvalidator="required" class="form-control">
			                    </div>
			                     <div class="form-group col-lg-5">
			                        <label>Sobrenome</label>
			                        <input type="text" name="usuario.fisico.sobrenome" data-bvalidator="required" class="form-control">
			                    </div>
		                    </div>
		                    <div class="row">
		                    	<div class="form-group col-lg-3">
			                        <label>CPF</label>
			                        <input type="text" id="cpf" name="usuario.fisico.cpf" data-bvalidator="required" class="form-control">
			                    </div>
		                    	<div class="form-group col-lg-3">
			                        <label>RG</label>
			                        <input type="text" id="rg" name="usuario.fisico.rg" data-bvalidator="required" class="form-control">
			                    </div>
			                    <div class="form-group col-lg-3">
			                        <label>Data Nascimento</label>
			                        <div class="input-group date">
										<input type="text" id="dataNascimento" name="usuario.fisico.dataNascimento" data-bvalidator="required" class="form-control" data-date-format="DD/MM/YYYY"/>
										<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
									</div>
			                    </div>
			                </div>
			                <div class="row">
			                	<div class="form-group col-lg-3">
			                        <label>Sexo</label>
			                        <select name="usuario.fisico.sexo" data-bvalidator="required" class="form-control" data-rel="chosen">
		                            	<option value="">Selecione</option>
										<option value="Masculino">Masculino</option>
										<option value="Feminino">Feminino</option>	
			                        </select>
			                    </div>
		                    	<div class="form-group col-lg-4">
			                        <label>Email</label>
			                        <input type="text" id="email" name="usuario.email" data-bvalidator="required" class="form-control">
			                    </div>
				            </div>
			                
			          	</div>
			          	
			          	<div id="usuarioJuridico">			          	
		                	<div class="row">		                	
			                    <div class="form-group col-lg-4">
			                        <label>Nome Fantasia</label>
			                        <input type="text" name="usuario.juridico.nomeFantasia" class="form-control">
			                    </div>
			                     <div class="form-group col-lg-5">
			                        <label>Inscrição Estadual</label>
			                        <input type="text" name="usuario.juridico.inscricaoEstadual" class="form-control">
			                    </div>
		                    </div>
		                    <div class="row">
		                    	<div class="form-group col-lg-3">
			                        <label>CNPJ</label>
			                        <input type="text" id="cnpj" name="usuario.juridico.cnpj" class="form-control">
			                    </div>			                    
			                </div>
			                <div class="row">
		                    	<div class="form-group col-lg-4">
			                        <label>Email</label>
			                        <input type="text" name="usuario.email" data-bvalidator="required" class="form-control">
			                    </div>
				            </div>			                
			          	</div>
			          	
			          	<div class="row">
		                    <div class="form-group col-lg-3">
		                        <label>Senha</label>
		                        <input id="senha" type="password" data-bvalidator="required" name="usuario.password" class="form-control">
		                    </div>
	                 	</div>
	                 	<div class="row">
		                    <div class="form-group col-lg-3">
		                        <label>Confirmar Senha</label>
		                        <input id="confirmarSenha" type="password" data-bvalidator="required" class="form-control">
		                    </div>
	                 	</div>	
	                    <div class="row">
		                    <div class="form-group col-lg-3">
		                        <label>CEP</label>
		                        <input id="cep" type="text" data-bvalidator="required" name="usuario.cep" class="form-control">
		                    </div>
	                 	</div>
	                 	<div class="row">
		                    <div class="form-group col-lg-3">
		                        <label>Estado</label>
		                        <select id="estado" name="usuario.estado" data-bvalidator="required" class="form-control" data-rel="chosen">
	                            	<option value="">Selecione</option>
									<option value="Acre">Acre</option>
									<option value="Alagoas">Alagoas</option>
									<option value="Amapá">Amapá</option>
									<option value="Amazonas">Amazonas</option>
									<option value="Bahia">Bahia</option>
									<option value="Ceará">Ceará</option>
									<option value="Distrito Federal">Distrito Federal</option>
									<option value="Espírito Santo">Espírito Santo</option>
									<option value="Goiás">Goiás</option>
									<option value="Maranhão">Maranhão</option>
									<option value="Mato Grosso">Mato Grosso</option>
									<option value="Mato Grosso do Sul">Mato Grosso do Sul</option>
									<option value="Minas Gerais">Minas Gerais</option>
									<option value="Pará">Pará</option>
									<option value="Paraíba">Paraíba</option>
									<option value="Paraná">Paraná</option>
									<option value="Pernambuco">Pernambuco</option>
									<option value="Piauí">Piauí</option>
									<option value="Rio de Janeiro">Rio de Janeiro</option>
									<option value="Rio Grande do Norte">Rio Grande do Norte</option>
									<option value="Rio Grande do Sul">Rio Grande do Sul</option>
									<option value="Rondônia">Rondônia</option>
									<option value="Roraima">Roraima</option>
									<option value="Santa Catarina">Santa Catarina</option>
									<option value="São Paulo">São Paulo</option>
									<option value="Sergipe">Sergipe</option>
									<option value="Tocantins">Tocantins</option>
		                        </select>
		                    </div>
	                 	</div>
	                 	<div class="row">
	                 		 <div class="form-group col-lg-3">
		                        <label>Cidade</label>
		                        <input id="cidade" type="text" data-bvalidator="required" name="usuario.cidade" class="form-control">
		                    </div>
	                 	</div>
	                 	<div class="row">
	                    	<div class="form-group col-lg-7">
		                        <label>Endereço</label>
		                        <input id="endereco" type="text" data-bvalidator="required" name="usuario.endereco" class="form-control">
		                    </div>
		                    <div class="form-group col-lg-2">
		                        <label>Número</label>
		                        <input type="text" data-bvalidator="required" name="usuario.numero" class="form-control">
		                    </div>		                    
		                </div>
		                <div class="row">
		                	<div class="form-group col-lg-3">
		                        <label>Bairro</label>
		                        <input id="bairro" type="text" data-bvalidator="required" name="usuario.bairro" class="form-control">
		                    </div>
		                    <div class="form-group col-lg-3">
		                        <label>Complemento</label>
		                        <input type="text" name="usuario.complemento" class="form-control" id="">
		                    </div>		                    
		                </div>
		                <div class="row">
		                    <div class="form-group col-lg-3">
		                        <label>Telefone Contato</label>
		                        <input type="text" id="telefoneContato" data-bvalidator="required" name="usuario.telefoneContato" class="form-control">
		                    </div>
		                    <div class="form-group col-lg-3">
		                        <label>Telefone Comercial</label>
		                        <input type="text" id="telefoneComercial" name="usuario.telefoneComercial" class="form-control">
		                    </div>
		                    <div class="form-group col-lg-3">
		                        <label>Telefone Residencial</label>
		                        <input type="text" id="telefoneResidencial" name="usuario.telefoneResidencial" class="form-control">
		                    </div>
		                </div>
		                <div class="row">
                			<div class="form-group col-lg-3">
		                        <label>Tipo do Perfil</label>
		                         <select class="form-control" name="tipoPerfil" data-rel="chosen">
		                         	<option value="">Selecione</option>
									<option value="freelancer">Freelancer</option>
									<option value="contratante">Contratante</option>
		                         </select>
		                    </div>
		                </div>
	                 	<div class="row">
                			<div class="form-group col-lg-3">
                				<label id="mensagem" class="textoAdvertencia"></label>
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