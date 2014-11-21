<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>

    <div class="navbar navbar-default" role="navigation">
		
       	<div class="navbar-inner">
            <button type="button" class="navbar-toggle pull-left animated flip">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            
            <a class="navbar-brand" href="<c:url value="/"/>">
                <img alt="Logo" src="<c:url value="/imagens/icone.png"/>" class="hidden-xs"/>
                <span><f:message key="site"/></span>
            </a>
			
			<c:choose>
				<c:when test="${userSession.usuario.id != null}">
					 <div class="btn-group pull-right">
		                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		                	<c:choose>
	       						<c:when test="${userSession.usuario.foto != null}">
	       							<img alt="" class="iconePefil" src="<c:url value="/imagens/${userSession.usuario.email}/perfil/${userSession.usuario.foto}"/>"/>
	       						</c:when>
	       						<c:otherwise>
	       							<i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"></span>
	       						</c:otherwise>
	       					</c:choose>
		                    ${userSession.usuario.nomeVisualizacao} <span class="caret"></span>
		                </button>
		                <ul class="dropdown-menu">
		                    <li><a href="#"><i class="glyphicon glyphicon-cog"></i> <f:message key="configuracoes"/></a></li>
		                    <li class="divider"></li>
		                    <li><a href="#" onclick="window.location='<c:url value="/logout"/>'"><i class="glyphicon glyphicon-share"></i> <f:message key="sair"/></a></li>
		                </ul>
		            </div>
		            <div class="btn-group pull-right">
		            	<span style="float: left; font-weight: bold; margin-right: 15px;">${saudacao}</span>
		           </div>
				</c:when>
				<c:otherwise>
					 <div class="btn-group pull-right">
		                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> <f:message key="entrar"/></span>
		                    <span class="caret"></span>
		                </button>
		                <ul class="dropdown-menu">
		                    <li><a href="#" onclick="paginaLogin();"><f:message key="login"/></a></li>
		                    <li class="divider"></li>
		                    <li><a href="#" onclick="cadastrarUsuario();"><f:message key="cadastrar"/></a></li>
		                </ul>
		            </div>
				</c:otherwise>
			</c:choose>
			
            <ul class="collapse navbar-collapse nav navbar-nav top-menu">
                <li><a href="#"> <f:message key="botao.quem.somos"/></a></li>
                <li>
                    <form class="navbar-search pull-left">
                    	 <div class="input-group date">
                    	 	<input id="filtroPesquisa" type="text" class="form-control" placeholder="<f:message key="pesquisar.servicos"/>">
							<span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
						</div>
                       
                    </form>
                </li>
               
            </ul>				
        </div>
        
    </div>