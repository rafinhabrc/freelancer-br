<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
 
<html lang="pt-br">
	<head>
		<title><f:message key="aplicativo" /></title>

		<meta http-equiv="Cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<link rel="shortcut icon" href="../imagens/logo.ico">
		<link rel="stylesheet" type="text/css" media="screen" href="../css/examples-offline.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../css/kendo.common.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../css/kendo.default.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../css/layoutmodelo.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../css/displaytag.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="../css/lightbox.css" />

		<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
		<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
		<script type="text/javascript" src="../js/kendo.all.min.js"></script>
		<script type="text/javascript" src="../js/kendo.web.min.js"></script>
		<script type="text/javascript" src="../js/console.js"></script>
		<script type="text/javascript" src="../js/jquery.maskedinput-1.2.2.js"></script>
 		<script type="text/javascript" src="../js/kendo.culture.pt-BR.min.js"></script>
		<script type="text/javascript" src="../js/jquery.priceformat-1.5.js"></script>		
		<script type="text/javascript" src="../js/lightbox-2.6.min.js"></script>
		<script type="text/javascript">
			var caminhoAbsoluto = "<c:url value="/"/>";
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
			 	kendo.culture("pt-BR");
 				$("#menu2").kendoMenu();
 				$('#container').hide();
			});

			function exibe(url, title) {
			//	var x = $("#conteudo").offset().left;
			//	var y = $("#conteudo").offset().top;
				var w = $("<div id='" + this.id + "'></div>").appendTo("#container");
				w.kendoWindow({
					minHeight: 0,
					minWidth: 350,
					pinned: true,
				 	position: {
			    		top: 150,
			    		left: 450,
				  	},
                    width: "auto",
                    height: "460px",
                    resizable: false,
                    visible: false,
                    content: url,
                    title: title,
                    actions: ["Minimize", "Close"],
                    close: function() {
						w.data("kendoWindow").destroy();
                    }
                });
                w.data("kendoWindow").open();
			}
			
			function consultarHotel (url, title) {
				var w = $("<div id='" + this.id + "'></div>").appendTo("#container");
				w.kendoWindow({
				  	modal: true,
                    height: "600px",
                    position: {
			    		top: 60,
			    		left: 450,
				  	},
                    resizable: false,
                    visible: false,
                    content: url,
                    title: title,
                    actions: ["Close"],
                    close: function() {
						w.data("kendoWindow").destroy();
                    }
                });
                w.data("kendoWindow").open();
			}
			
			function consultar(url, title) {
				var w = $("<div id='" + this.id + "'></div>").appendTo("#container");
				w.kendoWindow({
				  	modal: true,
                    height: "650px",
                    position: {
			    		top: 40,
			    		left: 450,
				  	},
                    resizable: false,
                    visible: false,
                    content: url,
                    title: title,
                    actions: ["Close"],
                    close: function() {
						w.data("kendoWindow").destroy();
                    }
                });
                w.data("kendoWindow").open();
			}
			
			function excluir (url) {
				var r = confirm("Deseja Excluir este item ?");
				if(r == true) {
					$.ajax({
						contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
						type: "POST",
						url: url,
						success: function(retorno) {
								 }
						});
				}
					
			}
						
			function infoQuarto(url, title) {
				var w = $("<div id='" + this.id + "'></div>").appendTo("#container");
				w.kendoWindow({
				  	modal: true,
                    height: "390px",
                    position: {
			    		top: 180,
			    		left: 500,
				  	},
                    resizable: false,
                    visible: false,
                    content: url,
                    title: title,
                    actions: ["Close"],
                    close: function() {
						w.data("kendoWindow").destroy();
                    }
                });
                w.data("kendoWindow").open();
			}
		</script>
	</head>
	<body>
	<style scoped>
		.k-menu .k-item>.k-link>.k-i-arrow-s {
     		background-image: none;
     		width: 1px;
     		border: 3px;
 		}
 		.k-menu .k-item, .k-widget.k-menu-horizontal > .k-item {
		    height: 30px;
		    border-radius: 2px 2px 2px 2px;
		    width: auto;
		}
		.k-window-content {
		    background-color: #F6F6F6; /* #DDDDDD */
		}		
	</style>
		<div id="main">
			<div id="header" class="k-block k-shadow">
				<div id="divLogo" style="float: left; margin-left: 5px;">
					<a href="<c:url value="/sistema"/>">
				<c:choose>
					<c:when test="${hotel.logo != null}">
						<img class="linkSemBorda" alt="Ledware Tecnologia" src="../imagens/logoLedware.png" style="height: 70px;"/>
					</c:when>
					<c:otherwise>
						<img  class="linkSemBorda" alt="Ledware Tecnologia" src="../imagens/logoLedware.png" style="height: 70px;"/>
					</c:otherwise>
				</c:choose>
					</a>
				</div>
				<div id="divBanner" style="float: left;"></div>
				<!--  div cabecalho  -->
				<div id="divUser" style="float: right;">
					<img id="imgUser" class="linkSemBorda" src="../imagens/icones/iconeUser.png"/>
				</div>
				<div id="divSaudacao" style="float: right; margin-top: 35px; margin-right: 15px;">
					${saudacao}
				</div>
			</div>
			<div id="mainnav" class="k-block k-shadow">
				<!--  menu de navegacao superior -->
				<div id="teste">
					<ul id="menu2">
						<li style="float: right; border: 0px;">
							<a href="<c:url value="/sistema/logout"/>"><img  class="linkSemBorda" alt="Sair" src="../imagens/exit2.png"/> Sair</a>
						</li>
				<c:choose>
					<c:when test="${userSession.usuario.administrador}">
						<li style="float: right; width: 125px;">
							<span class="k-icon k-i-custom"></span> Configurações
							<ul>
								<li>
									<a id="novoUsuario" href="#" onclick="exibe('<c:url value="/usuario/novo"/>','Cadastrar Novo Usuário');"><span class="k-icon k-i-plus"></span> Novo Usuário</a>
								</li>
								<li>
									<a id="ListarUsuario" href="#" onclick="exibe('<c:url value="/usuario/listar"/>','Listar Usuários');"><span class="k-icon k-i-insert-n"></span> Listar Usuários</a>
								</li>
								<li>
									<a id="novoPerfil"href="#" onclick="exibe('<c:url value="/perfil/novo"/>','Novo Perfil');"><span class="k-icon k-i-plus"></span> Novo Perfil</a>
								</li>
								<li>
									<a id="ListarPerfil" href="#" onclick="exibe('<c:url value="/perfil/listar"/>','Listar Perfis');"><span class="k-icon k-i-insert-n"></span> Listar Perfis</a>
								</li>
					</c:when>
					<c:otherwise>
						<li style="float: right; width: 125px;">
							<span class="k-icon k-i-custom"></span> Configurações
							<ul>
								<li disabled="disabled">
									<a href="#" onclick=""><span class="k-icon k-i-plus"></span> Novo Usuário</a>
								</li>
								<li disabled="disabled">
									<a href="#" onclick=""><span class="k-icon k-i-insert-n"></span> Listar Usuários</a>
								</li>
								<li disabled="disabled">
									<a href="#" onclick=""><span class="k-icon k-i-plus"></span> Novo Perfil</a>
								</li>
								<li disabled="disabled">
									<a href="#" onclick=""><span class="k-icon k-i-insert-n"></span> Listar Perfis</a>
								</li>
								<li disabled="disabled">
									<a href="#" onclick=""><span class="k-icon k-i-pencil"></span> Cadastrar Hotel</a>
								</li>
								<li disabled="disabled">
									<a href="#" onclick=""><span class="k-icon k-i-search"></span> Exibir Hotel</a>
								</li>
					</c:otherwise>
				</c:choose>
								<li>
									<a id="alterarSenha" href="#" onclick="exibe('<c:url value="/usuario/formAlterarSenha"/>', 'Alterar Senha');"><span class="k-icon k-i-plus"></span> Alterar Senha</a>
								</li>
							</ul>
						</li>
				<c:choose>
					<c:when test="${hotel != null}">
						<li style="width: 73px;">
							Hotel <span class="k-icon k-si-arrow-s"></span>
							<ul>
								<li>
									<span class="k-icon k-i-pencil"></span> Acomodação
									<ul>
										<li>
											<a id="cadastrarAcomodocao" href="#" onclick="exibe('<c:url value="/hotel/cadastrarAcomodacao"/>', 'Cadastrar Acomodações');"><span class="k-icon k-i-plus"></span> Cadastrar</a>
										</li>
										<li>
											<a id="listarAcomodacoes" href="#" onclick="exibe('<c:url value="/hotel/listarAcomodacoes"/>', 'Lista de Acomodações');"><span class="k-icon k-i-insert-n"></span> Listar</a>
										</li>
									</ul>
								</li>
								<li>
									<span class="k-icon k-i-pencil"></span> Hóspede
									<ul>
										<li>
											<a id="cadastrarHospede" href="#" onclick="exibe('<c:url value="/clientes/cadastrarHospede"/>', 'Cadastrar Hóspedes');"><span class="k-icon k-i-plus"></span> Cadastrar</a>
										</li>
										<li>
											<a id="listarHospedes" href="#" onclick="exibe('<c:url value="/clientes/listarHospedes"/>', 'Lista de Hóspedes');"><span class="k-icon k-i-insert-n"></span> Listar</a>
										</li>
									</ul>
								</li>
								<li>
									<a id="consultarHotel" href="#" onclick="consultarHotel('<c:url value="/hotel/consultarHotel"/>','Informações do Hotel');"><span class="k-icon k-i-search"></span> Consultar Hotel</a>
								</li>
							</ul>
						</li>
						<li style="width: 120px;">
							 Hospedagem <span class="k-icon k-si-arrow-s"></span>
							<ul>
								<li>
									<a id="cadastrarHospedagem" href="#" onclick="exibe('<c:url value="/clientes/cadastrarHospedagem"/>', 'Cadastrar Hospedagem');"><span class="k-icon k-i-plus"></span> Cadastrar</a>
								</li>
								<li>
									<a id="consultar" href="#" onclick="exibe('<c:url value="/clientes/listarHospedeHospedagem"/>', 'Lista de Hospedagens');"><span class="k-icon k-i-insert-n"></span> Listar</a>
								</li>
							</ul>
						</li>
						<li style="width: 90px;">
							Estoque <span class="k-icon k-si-arrow-s"></span>
							<ul>
								<li>
									<span class="k-icon k-i-pencil"></span> Produto
								 	<ul>
										<li>
											<a id="cadastrarProduto" href="#" onclick="exibe('<c:url value="/estoque/cadastrarProduto"/>', 'Cadastrar Produtos');"><span class="k-icon k-i-plus"></span> Cadastrar</a>
										</li>
										<li>
											<a id="" href="#" onclick="exibe('<c:url value="/estoque/listarProduto"/>', 'Lista de Produtos');"><span class="k-icon k-i-insert-n"></span> Listar</a>
										</li>
									</ul>
								</li>
								<li>
									<span class="k-icon k-i-pencil"></span> Fabricantes
									<ul>
										<li>
											<a id="cadastrarFabricante" href="#" onclick="exibe('<c:url value="/estoque/cadastrarFabricante"/>', 'Cadastrar Fabricantes');"><span class="k-icon k-i-plus"></span> Cadastrar</a>
										</li>
										<li>
											<a id="" href="#" onclick="exibe('<c:url value="/estoque/listarFabricante"/>', 'Lista de Fabricantes');"><span class="k-icon k-i-insert-n"></span> Listar</a>
										</li>
									</ul>
								</li>
								<li>
									<span class="k-icon k-i-pencil"></span> Fornecedores
									<ul>
										<li>
											<a id="cadastrarFornecedor" href="#" onclick="exibe('<c:url value="/estoque/cadastrarFornecedor"/>', 'Cadastrar Fornecedores');"><span class="k-icon k-i-plus"></span> Cadastrar</a>
										</li>
										<li>
											<a id="" href="#" onclick="exibe('<c:url value="/estoque/listarFornecedor"/>', 'Lista de Fornecedores');"><span class="k-icon k-i-insert-n"></span> Listar</a>
										</li>
									</ul>
								</li>								
							</ul>
						</li>
						<li style="width: 100px;">
							Financeiro <span class="k-icon k-si-arrow-s"></span>
							<ul>
								<li>
									<span class="k-icon k-i-pencil"></span> Conta Bancária
									 <ul>
		                                <li>
	                                		<a id="" href="#" onclick="exibe('<c:url value="/financeiro/cadastrarContaBancaria"/>', 'Cadastrar Conta Bancária');"><span class="k-icon k-i-plus"></span> Cadastrar</a>
	                                	</li>
		                                <li>
		                                	<a id="" href="#" onclick="exibe('<c:url value="/financeiro/listarContaBancaria"/>', 'Lista de Contas Bancárias');"><span class="k-icon k-i-insert-n"></span> Listar</a>
		                                </li>
		                            </ul>
								</li>
								<li>
									<span class="k-icon k-i-pencil"></span> Contas a Pagar
									<ul>
										<li>
											<a id="" href="#" onclick="exibe('<c:url value="/financeiro/cadastrarContaPagar"/>', 'Cadastrar Conta a Pagar');"><span class="k-icon k-i-plus"></span> Cadastrar</a>
										</li>
										<li>
											<a id="" href="#" onclick="exibe('<c:url value="/financeiro/listarContaPagar"/>', 'Lista de Contas a Pagar');"><span class="k-icon k-i-insert-n"></span> Listar</a>
										</li>
									</ul>
								</li>
								<li>
									<span class="k-icon k-i-pencil"></span> Contas a Receber
									<ul>
										<li>
											<a id="" href="#" onclick="exibe('<c:url value="/financeiro/cadastrarContaReceber"/>', 'Cadastrar Conta a Receber');"><span class="k-icon k-i-plus"></span> Cadastrar</a>
										</li>
										<li>
											<a id="" href="#" onclick="exibe('<c:url value="/financeiro/listarContaReceber"/>', 'Lista de Contas a Receber');"><span class="k-icon k-i-insert-n"></span> Listar</a>
										</li>
									</ul>
								</li>
								<li>
									<span class="k-icon k-i-pencil"></span> Movimentação
									<ul>
										<li>
											<a id="" href="#" onclick="exibe('<c:url value="/financeiro/cadastrarMovimentacao"/>', 'Cadastrar Movimentação');"><span class="k-icon k-i-plus"></span> Cadastrar</a>
										</li>
										<li>
											<a id="" href="#" onclick="exibe('<c:url value="/financeiro/listarMovimentacao"/>', 'Lista de Movimentações');"><span class="k-icon k-i-insert-n"></span> Listar</a>
										</li>
									</ul>
								</li>
								<li>
                                	<a id="" href="#" onclick="exibe('<c:url value="/financeiro/cadastrarCategoria"/>', 'Cadastrar Categoria');"><span class="k-icon k-i-plus"></span> Categoria</a>
                                </li>
                                <li>
                                	<a id="" href="#" onclick="exibe('<c:url value="/financeiro/cadastrarEspecie"/>', 'Cadastrar Espécie');"><span class="k-icon k-i-plus"></span> Espécie</a>
                                </li>
                                <li>
									<a id="" href="#" onclick="exibe('<c:url value="/financeiro/cadastrarTipoMovimentacao"/>', 'Cadastrar Tipo de Movimentação');"><span class="k-icon k-i-plus"></span> Tipo de Movimentação</a>
								</li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<li style="width: 73px;">
							Hotel <span class="k-icon k-si-arrow-s"></span>
							<ul>
								<li>
									<a id="cadastrarHotel" href="#" onclick="exibe('<c:url value="/hotel/cadastrarHotel"/>', 'Cadastrar Hotel');"><span class="k-icon k-i-plus"></span> Cadastrar Hotel</a>
								</li>
							</ul>
						</li>
						<li style="width: 120px;" disabled="disabled">
							Hospedagem <span class="k-icon k-si-arrow-s"></span>
						</li>
						<li style="width: 90px;" disabled="disabled">
							Estoque <span class="k-icon k-si-arrow-s"></span>
						</li>
						<li style="width: 100px;" disabled="disabled">
							Financeiro <span class="k-icon k-si-arrow-s"></span>
						</li>
					</c:otherwise>
				</c:choose>
					</ul>
				</div>
			</div>
			<div id="conteudo" class="k-block k-shadow">
				<div style="float: right; width: auto; height: 25px; margin-top: 5px; margin-right: 5px;">
					<span style="margin: 10px;">
						<img class="linkSemBorda" src="../imagens/iconeOcupado.png" style="height: 15px;"/> Ocupado
					</span>
					<span style="margin: 10px;">
						<img class="linkSemBorda" src="../imagens/iconeLivre.png" style="height: 15px;"/> Livre
					</span>
					<span style="margin: 10px;">
						<img class="linkSemBorda" src="../imagens/iconeManutencao.png" style="height: 15px;"/> Manutenção
					</span>					
					<span style="margin: 10px;">
						<img class="linkSemBorda" src="../imagens/iconeLimpeza.png" style="height: 15px;"/> Limpeza
					</span>
				</div>
				</br>
				<div style="width: 99%; height: 94%; margin: 15px;">
					<c:forEach items="${acomodacaoList}" var="acomodacao">
						<c:choose>
							<c:when test="${acomodacao.status.id == 1}">
								<div style="float: left; width: 90px; text-align: center; margin-bottom: 20px;">
									<b>${acomodacao.numero}</b>
									</br>
									<a class="linkSemBorda" href="#" onclick="infoQuarto('<c:url value="/hotel/exibirInfoAcomodacao/${acomodacao.id}"/>', 'Informações');">
										<img class="linkSemBorda" src="../imagens/porta-entrar.png"/>
									</a>
								</div>
							</c:when>
							<c:when test="${acomodacao.status.id == 2}">
								<div style="float: left; width: 90px; text-align: center; margin-bottom: 20px;">
									<b>${acomodacao.numero}</b>
									</br>
									<a class="linkSemBorda" href="#" onclick="infoQuarto('<c:url value="/hotel/exibirInfoAcomodacao/${acomodacao.id}"/>', 'Informações');">
										<img class="linkSemBorda" src="../imagens/porta-checkIn.png"/>
									</a>
								</div>
							</c:when>
							<c:when test="${acomodacao.status.id == 3}">
								<div style="float: left; width: 90px; text-align: center; margin-bottom: 20px;">
									<b>${acomodacao.numero}</b>
									</br>
									<a class="linkSemBorda" href="#" onclick="infoQuarto('<c:url value="/hotel/exibirInfoAcomodacao/${acomodacao.id}"/>', 'Informações');">
										<img class="linkSemBorda" src="../imagens/porta-manutencao.png"/>
									</a>
								</div>
							</c:when>
							<c:when test="${acomodacao.status.id == 4}">
								<div style="float: left; width: 90px; text-align: center; margin-bottom: 20px;">
									<b>${acomodacao.numero}</b>
									</br>
									<a class="linkSemBorda" href="#" onclick="infoQuarto('<c:url value="/hotel/exibirInfoAcomodacao/${acomodacao.id}"/>', 'Informações');">
										<img class="linkSemBorda" src="../imagens/porta-limpeza.png"/>
									</a>
								</div>
							</c:when>							
						</c:choose>
					</c:forEach>
				</div>
				<div id="container" class="k-block k-shadow">
					<!--  div conteudo da pagina -->
				</div>
			</div>
		</div>
	</body>
</html>