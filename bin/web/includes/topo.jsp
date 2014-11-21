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

	            <div class="btn-group pull-right">
	                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
	                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> <f:message key="menu.entrar"/></span>
	                    <span class="caret"></span>
	                </button>
	                <ul class="dropdown-menu">
	                    <li><a href="#"><f:message key="menu.login"/></a></li>
	                    <li class="divider"></li>
	                    <li><a href="#" onclick="cadastrar();"><f:message key="menu.cadastrar"/></a></li>
	                </ul>
	            </div>
	            		
	            <ul class="collapse navbar-collapse nav navbar-nav top-menu">
	                <li><a href="#"> <f:message key="menu.quem.somos"/></a></li>               
	                <li>
	                    <form class="navbar-search pull-left">
	                        <input type="text" placeholder="<f:message key="menu.pesquisar"/>" class="search-query form-control col-md-10">
	                    </form>
	                </li>
	               
	            </ul>				
	        </div>
	        
	    </div>