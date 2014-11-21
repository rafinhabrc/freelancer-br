<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="pt-br">
	<head>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#dataNascimento").datetimepicker({
					pickTime: false
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
	            <div class="box-content">
	                <form role="form">
	                	<div class="row">
		                    <div class="form-group col-lg-4">
		                        <label>Nome</label>
		                        <input type="text" class="form-control" id="">
		                    </div>
		                     <div class="form-group col-lg-4">
		                        <label>Sobrenome</label>
		                        <input type="text" class="form-control" id="">
		                    </div>
	                    </div>
	                    <div class="row">
	                    	<div class="form-group col-lg-4">
		                        <label>Email</label>
		                        <input type="password" class="form-control" id="">
		                    </div>
		                    <div class="form-group col-lg-2">
		                        <label>Data Nascimento</label>
		                        <div class="input-group date" >
									<input type="text" class="form-control" id="dataNascimento" data-date-format="DD/MM/YYYY"/>
									<span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
		                    </div>
		                </div>
	                    <div class="row">
		                    <div class="form-group col-lg-2">
		                        <label>CEP</label>
		                        <input type="text" class="form-control" id="">
		                    </div>
	                 	</div>
	                 	<div class="row">
		                    <div class="form-group col-lg-2">
		                        <label>Estado</label>
		                       	<div class="controls">
			                        <select id="selectError" data-rel="chosen">
			                            <option>Option 1</option>
			                            <option>Option 2</option>
			                            <option>Option 3</option>
			                            <option>Option 4</option>
			                            <option>Option 5</option>
			                        </select>
			                    </div>
		                    </div>
	                 	</div>
	                 	<div class="row">
	                    	<div class="form-group col-lg-6">
		                        <label>Endereço</label>
		                        <input type="password" class="form-control" id="">
		                    </div>
		                    <div class="form-group col-lg-2">
		                        <label>Número</label>
		                        <input type="password" class="form-control" id="">
		                    </div>		                    
		                </div>
		                <div class="row">
		                	<div class="form-group col-lg-3">
		                        <label>Bairro</label>
		                        <input type="password" class="form-control" id="">
		                    </div>
		                    <div class="form-group col-lg-2">
		                        <label>Complemento</label>
		                        <input type="password" class="form-control" id="">
		                    </div>
		                    <div class="form-group col-lg-3">
		                        <label>Cidade</label>
		                        <input type="password" class="form-control" id="">
		                    </div>
		                </div>
		                <br/>
		                <div class="row" style="text-align: center;">
		                    <button type="submit" class="btn btn-default">Cadastrar</button>
		                   	<button type="reset" class="btn btn-default">Limpar</button>
		                </div>
	                </form>
	
	            </div>
	        </div>
	    </div>
    
	</body>
</html>
		
    