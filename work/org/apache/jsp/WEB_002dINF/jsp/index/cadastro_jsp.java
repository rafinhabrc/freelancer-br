/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2014-09-24 18:02:22 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.index;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class cadastro_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005ff_005fmessage_0026_005fkey_005fnobody;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005ff_005fmessage_0026_005fkey_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.release();
    _005fjspx_005ftagPool_005ff_005fmessage_0026_005fkey_005fnobody.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html lang=\"pt-br\">\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<script type=\"text/javascript\" src=\"");
      if (_jspx_meth_c_005furl_005f0(_jspx_page_context))
        return;
      out.write("\"></script>\r\n");
      out.write("\t\t<script type=\"text/javascript\" src=\"");
      if (_jspx_meth_c_005furl_005f1(_jspx_page_context))
        return;
      out.write("\"></script>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t$(document).ready(function() {\r\n");
      out.write("\t\t\t\tmoment.locale(\"pt-br\");\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tvar options = {position: {x:'center', y:'top'}, lang: 'hr', errorMessages: {hr: {'required': '");
      if (_jspx_meth_f_005fmessage_005f0(_jspx_page_context))
        return;
      out.write("' }}};\r\n");
      out.write("\t\t\t    \r\n");
      out.write("\t\t\t\t$(\"#formUsuario\").bValidator(options);\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$(\"#rg\").mask(\"99.999.999-9\");\r\n");
      out.write("\t\t\t\t$(\"#cpf\").mask(\"999.999.999-99\");\r\n");
      out.write("\t\t\t\t$(\"#cnpj\").mask(\"99.999.999/9999-99\");\r\n");
      out.write("\t\t\t\t$(\"#cep\").mask(\"99999-999\");\r\n");
      out.write("\t\t\t\t$(\"#dataNascimento\").mask(\"99/99/9999\").datetimepicker({changeMonth: true, changeYear: true, yearRange: \"-100:+0\"});\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t$(\"#telefoneContato\").focus(function(){\r\n");
      out.write("\t\t\t\t\t$(this).mask(\"(99) 9999-9999?9\",{completed:function(){$(this).mask(\"(99) 99999-9999\");}});\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$(\"#telefoneComercial\").focus(function(){\r\n");
      out.write("\t\t\t\t\t$(this).mask(\"(99) 9999-9999?9\",{completed:function(){$(this).mask(\"(99) 99999-9999\");}});\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$(\"#telefoneResidencial\").focus(function(){\r\n");
      out.write("\t\t\t\t\t$(this).mask(\"(99) 9999-9999?9\",{completed:function(){$(this).mask(\"(99) 99999-9999\");}});\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$(\"#usuarioJuridico\").hide();\r\n");
      out.write("\t    \t\t$(\"#usuarioJuridico :input\").attr(\"disabled\", true);\r\n");
      out.write("\t    \t\t\r\n");
      out.write("\t\t        $(\"input[name='tipoUsuario']\").click(function(){\r\n");
      out.write("\t\t            if($(this).attr(\"value\")==\"fisico\"){\r\n");
      out.write("\t\t                $(\"#usuarioJuridico\").hide();\r\n");
      out.write("\t\t                $(\"#usuarioFisico\").show();\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t                $(\"#usuarioJuridico :input\").attr(\"disabled\", true);\r\n");
      out.write("\t\t                $(\"#usuarioFisico :input\").removeAttr(\"disabled\");\r\n");
      out.write("\t\t            }\r\n");
      out.write("\t\t            \r\n");
      out.write("\t\t            if($(this).attr(\"value\")==\"juridico\"){\r\n");
      out.write("\t\t                $(\"#usuarioFisico\").hide();\r\n");
      out.write("\t\t                $(\"#usuarioJuridico\").show();\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t                $(\"#usuarioFisico :input\").attr(\"disabled\", true);\r\n");
      out.write("\t\t                $(\"#usuarioJuridico :input\").removeAttr(\"disabled\");\r\n");
      out.write("\t\t            }\r\n");
      out.write("\t\t        });\r\n");
      out.write("\t\t        \r\n");
      out.write("\t\t        $(\"#email\").blur(function() {\r\n");
      out.write("\t\t\t\t\tvar email = $(\"#email\").val();\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\tif (email != null) {\r\n");
      out.write("\t\t\t\t\t\temail = email.replace(/^\\s+|\\s+$/g,\"\");\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\t\t\ttype: \"POST\",\r\n");
      out.write("\t\t\t\t\t\t\turl: \"");
      if (_jspx_meth_c_005furl_005f2(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("\t\t\t\t\t\t\tdata: \"email=\" + email,\r\n");
      out.write("\t\t\t\t\t\t\tdataType: \"text\",\r\n");
      out.write("\t\t\t\t\t\t\tsuccess: function(retorno){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tif (retorno == \"true\") {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t$(\"#formUsuario\").data(\"bValidators\").first.showMsg($(\"#email\"), 'Email Disponível');\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t$(\"#formUsuario\").data(\"bValidators\").first.showMsg($(\"#email\"), 'Email Não Disponível');\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t }\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t        \r\n");
      out.write("\t\t        $(\"#formUsuario\").submit(function() {\r\n");
      out.write("\t\t\t\t\tif($(\"#formUsuario\").data(\"bValidator\").isValid()){\r\n");
      out.write("\t\t\t\t\t\tif ($(\"#senha\").val() != $(\"#confirmarSenha\").val()) {\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#formUsuario\").data(\"bValidators\").first.showMsg($(\"#senha\"), 'As senhas são diferentes');\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#formUsuario\").data(\"bValidators\").first.showMsg($(\"#confirmarSenha\"), 'As senhas são diferentes');\r\n");
      out.write("\t\t\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\t\t\t\ttype: \"POST\",\r\n");
      out.write("\t\t\t\t\t\t\t\turl: \"");
      if (_jspx_meth_c_005furl_005f3(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("\t\t\t\t\t\t\t\tdata: \"email=\" + email,\r\n");
      out.write("\t\t\t\t\t\t\t\tdataType: \"text\",\r\n");
      out.write("\t\t\t\t\t\t\t\tsuccess: function(retorno){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\tif (retorno == \"true\") {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t$(\"#container\").waitMe({effect :'ios', text :'', bg :'rgba(255,255,255,0.5)', color :'#000', sizeW :'', sizeH :''});\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tcontentType: 'application/x-www-form-urlencoded; charset=UTF-8',\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\ttype: \"POST\",\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\turl: \"");
      if (_jspx_meth_c_005furl_005f4(_jspx_page_context))
        return;
      out.write("\",\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tdata: $(\"#formUsuario\").serialize(),\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tsuccess: function(retorno) {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\twindow.location = \"");
      if (_jspx_meth_c_005furl_005f5(_jspx_page_context))
        return;
      out.write("\";\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t }\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t$(\"#formUsuario\").data(\"bValidators\").first.showMsg($(\"#email\"), 'Email Não Disponível');\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t }\r\n");
      out.write("\t\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<body>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div class=\"box col-md-12\">\r\n");
      out.write("\t        <div class=\"box-inner\">\r\n");
      out.write("\t            <div class=\"box-header well\">\r\n");
      out.write("\t                <h2>Faça seu Cadastro</h2>\r\n");
      out.write("\t            </div>\r\n");
      out.write("\t            \r\n");
      out.write("\t            <form id=\"formUsuario\" name=\"formUsuario\" action=\"#\">\r\n");
      out.write("\t\t            <div class=\"box-content\">\r\n");
      out.write("\t\t            \t<div class=\"row\">\r\n");
      out.write("\t                \t\t<div class=\"checkbox\">\r\n");
      out.write("\t                \t\t\t<label><strong>Tipo de cadastro: </strong></label>\r\n");
      out.write("\t\t\t                    <label>\r\n");
      out.write("\t\t\t                    \t<i class=\"glyphicon glyphicon-user\"></i> Físico\r\n");
      out.write("\t\t                        \t<input type=\"radio\" value=\"fisico\" name=\"tipoUsuario\" checked>\r\n");
      out.write("\t\t                        </label>\r\n");
      out.write("\t\t\t                    <label>\r\n");
      out.write("\t\t\t                    \t<i class=\"glyphicon glyphicon-briefcase\"></i> Jurídico\r\n");
      out.write("\t\t\t                        <input type=\"radio\" value=\"juridico\" name=\"tipoUsuario\">\r\n");
      out.write("\t\t\t                    </label>\r\n");
      out.write("\t\t\t                </div>\r\n");
      out.write("\t                \t</div>\r\n");
      out.write("\t                \t<br/>\r\n");
      out.write("\t                \t\r\n");
      out.write("\t\t                <div id=\"usuarioFisico\">\r\n");
      out.write("\t\t                \t\r\n");
      out.write("\t\t                \t<div class=\"row\">\r\n");
      out.write("\t\t\t                    <div class=\"form-group col-lg-4\">\r\n");
      out.write("\t\t\t                        <label>Nome</label>\r\n");
      out.write("\t\t\t                        <input type=\"text\" name=\"usuario.fisico.nome\" data-bvalidator=\"required\" class=\"form-control\">\r\n");
      out.write("\t\t\t                    </div>\r\n");
      out.write("\t\t\t                     <div class=\"form-group col-lg-5\">\r\n");
      out.write("\t\t\t                        <label>Sobrenome</label>\r\n");
      out.write("\t\t\t                        <input type=\"text\" name=\"usuario.fisico.sobrenome\" data-bvalidator=\"required\" class=\"form-control\">\r\n");
      out.write("\t\t\t                    </div>\r\n");
      out.write("\t\t                    </div>\r\n");
      out.write("\t\t                    <div class=\"row\">\r\n");
      out.write("\t\t                    \t<div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t\t                        <label>CPF</label>\r\n");
      out.write("\t\t\t                        <input type=\"text\" id=\"cpf\" name=\"usuario.fisico.cpf\" data-bvalidator=\"required\" class=\"form-control\">\r\n");
      out.write("\t\t\t                    </div>\r\n");
      out.write("\t\t                    \t<div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t\t                        <label>RG</label>\r\n");
      out.write("\t\t\t                        <input type=\"text\" id=\"rg\" name=\"usuario.fisico.rg\" data-bvalidator=\"required\" class=\"form-control\">\r\n");
      out.write("\t\t\t                    </div>\r\n");
      out.write("\t\t\t                    <div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t\t                        <label>Data Nascimento</label>\r\n");
      out.write("\t\t\t                        <div class=\"input-group date\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<input type=\"text\" id=\"dataNascimento\" name=\"usuario.fisico.dataNascimento\" data-bvalidator=\"required\" class=\"form-control\" data-date-format=\"DD/MM/YYYY\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-calendar\"></span></span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t                    </div>\r\n");
      out.write("\t\t\t                </div>\r\n");
      out.write("\t\t\t                <div class=\"row\">\r\n");
      out.write("\t\t\t                \t<div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t\t                        <label>Sexo</label>\r\n");
      out.write("\t\t\t                        <select name=\"usuario.fisico.sexo\" data-bvalidator=\"required\" class=\"form-control\" data-rel=\"chosen\">\r\n");
      out.write("\t\t                            \t<option value=\"\">Selecione</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"Masculino\">Masculino</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"Feminino\">Feminino</option>\t\r\n");
      out.write("\t\t\t                        </select>\r\n");
      out.write("\t\t\t                    </div>\r\n");
      out.write("\t\t                    \t<div class=\"form-group col-lg-4\">\r\n");
      out.write("\t\t\t                        <label>Email</label>\r\n");
      out.write("\t\t\t                        <input type=\"text\" id=\"email\" name=\"usuario.email\" data-bvalidator=\"required\" class=\"form-control\">\r\n");
      out.write("\t\t\t                    </div>\r\n");
      out.write("\t\t\t\t            </div>\r\n");
      out.write("\t\t\t                \r\n");
      out.write("\t\t\t          \t</div>\r\n");
      out.write("\t\t\t          \t\r\n");
      out.write("\t\t\t          \t<div id=\"usuarioJuridico\">\t\t\t          \t\r\n");
      out.write("\t\t                \t<div class=\"row\">\t\t                \t\r\n");
      out.write("\t\t\t                    <div class=\"form-group col-lg-4\">\r\n");
      out.write("\t\t\t                        <label>Nome Fantasia</label>\r\n");
      out.write("\t\t\t                        <input type=\"text\" name=\"usuario.juridico.nomeFantasia\" class=\"form-control\">\r\n");
      out.write("\t\t\t                    </div>\r\n");
      out.write("\t\t\t                     <div class=\"form-group col-lg-5\">\r\n");
      out.write("\t\t\t                        <label>Inscrição Estadual</label>\r\n");
      out.write("\t\t\t                        <input type=\"text\" name=\"usuario.juridico.inscricaoEstadual\" class=\"form-control\">\r\n");
      out.write("\t\t\t                    </div>\r\n");
      out.write("\t\t                    </div>\r\n");
      out.write("\t\t                    <div class=\"row\">\r\n");
      out.write("\t\t                    \t<div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t\t                        <label>CNPJ</label>\r\n");
      out.write("\t\t\t                        <input type=\"text\" id=\"cnpj\" name=\"usuario.juridico.cnpj\" class=\"form-control\">\r\n");
      out.write("\t\t\t                    </div>\t\t\t                    \r\n");
      out.write("\t\t\t                </div>\r\n");
      out.write("\t\t\t                <div class=\"row\">\r\n");
      out.write("\t\t                    \t<div class=\"form-group col-lg-4\">\r\n");
      out.write("\t\t\t                        <label>Email</label>\r\n");
      out.write("\t\t\t                        <input type=\"text\" name=\"usuario.email\" data-bvalidator=\"required\" class=\"form-control\">\r\n");
      out.write("\t\t\t                    </div>\r\n");
      out.write("\t\t\t\t            </div>\t\t\t                \r\n");
      out.write("\t\t\t          \t</div>\r\n");
      out.write("\t\t\t          \t\r\n");
      out.write("\t\t\t          \t<div class=\"row\">\r\n");
      out.write("\t\t                    <div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t                        <label>Senha</label>\r\n");
      out.write("\t\t                        <input id=\"senha\" type=\"password\" data-bvalidator=\"required\" name=\"usuario.password\" class=\"form-control\">\r\n");
      out.write("\t\t                    </div>\r\n");
      out.write("\t                 \t</div>\r\n");
      out.write("\t                 \t<div class=\"row\">\r\n");
      out.write("\t\t                    <div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t                        <label>Confirmar Senha</label>\r\n");
      out.write("\t\t                        <input id=\"confirmarSenha\" type=\"password\" data-bvalidator=\"required\" class=\"form-control\">\r\n");
      out.write("\t\t                    </div>\r\n");
      out.write("\t                 \t</div>\t          \t\r\n");
      out.write("\t                    <div class=\"row\">\r\n");
      out.write("\t\t                    <div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t                        <label>CEP</label>\r\n");
      out.write("\t\t                        <input id=\"cep\" type=\"text\" data-bvalidator=\"required\" name=\"usuario.cep\" class=\"form-control\">\r\n");
      out.write("\t\t                    </div>\r\n");
      out.write("\t                 \t</div>\r\n");
      out.write("\t                 \t<div class=\"row\">\r\n");
      out.write("\t\t                    <div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t                        <label>Estado</label>\r\n");
      out.write("\t\t                        <select name=\"usuario.estado\" data-bvalidator=\"required\" class=\"form-control\" data-rel=\"chosen\">\r\n");
      out.write("\t                            \t<option value=\"\">Selecione</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Acre\">Acre</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Alagoas\">Alagoas</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Amapá\">Amapá</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Amazonas\">Amazonas</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Bahia\">Bahia</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Ceará\">Ceará</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Distrito Federal\">Distrito Federal</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Espírito Santo\">Espírito Santo</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Goiás\">Goiás</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Maranhão\">Maranhão</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Mato Grosso\">Mato Grosso</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Mato Grosso do Sul\">Mato Grosso do Sul</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Minas Gerais\">Minas Gerais</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Pará\">Pará</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Paraíba\">Paraíba</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Paraná\">Paraná</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Pernambuco\">Pernambuco</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Piauí\">Piauí</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Rio de Janeiro\">Rio de Janeiro</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Rio Grande do Norte\">Rio Grande do Norte</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Rio Grande do Sul\">Rio Grande do Sul</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Rondônia\">Rondônia</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Roraima\">Roraima</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Santa Catarina\">Santa Catarina</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"São Paulo\">São Paulo</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Sergipe\">Sergipe</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"Tocantins\">Tocantins</option>\r\n");
      out.write("\t\t                        </select>\r\n");
      out.write("\t\t                    </div>\r\n");
      out.write("\t                 \t</div>\r\n");
      out.write("\t                 \t<div class=\"row\">\r\n");
      out.write("\t                    \t<div class=\"form-group col-lg-7\">\r\n");
      out.write("\t\t                        <label>Endereço</label>\r\n");
      out.write("\t\t                        <input type=\"text\" data-bvalidator=\"required\" name=\"usuario.endereco\" class=\"form-control\">\r\n");
      out.write("\t\t                    </div>\r\n");
      out.write("\t\t                    <div class=\"form-group col-lg-2\">\r\n");
      out.write("\t\t                        <label>Número</label>\r\n");
      out.write("\t\t                        <input type=\"text\" data-bvalidator=\"required\" name=\"usuario.numero\" class=\"form-control\">\r\n");
      out.write("\t\t                    </div>\t\t                    \r\n");
      out.write("\t\t                </div>\r\n");
      out.write("\t\t                <div class=\"row\">\r\n");
      out.write("\t\t                \t<div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t                        <label>Bairro</label>\r\n");
      out.write("\t\t                        <input type=\"text\" data-bvalidator=\"required\" name=\"usuario.bairro\" class=\"form-control\">\r\n");
      out.write("\t\t                    </div>\r\n");
      out.write("\t\t                    <div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t                        <label>Complemento</label>\r\n");
      out.write("\t\t                        <input type=\"text\" name=\"usuario.complemento\" class=\"form-control\" id=\"\">\r\n");
      out.write("\t\t                    </div>\r\n");
      out.write("\t\t                    <div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t                        <label>Cidade</label>\r\n");
      out.write("\t\t                        <input type=\"text\" data-bvalidator=\"required\" name=\"usuario.cidade\" class=\"form-control\">\r\n");
      out.write("\t\t                    </div>\r\n");
      out.write("\t\t                </div>\r\n");
      out.write("\t\t                <div class=\"row\">\r\n");
      out.write("\t\t                    <div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t                        <label>Telefone Contato</label>\r\n");
      out.write("\t\t                        <input type=\"text\" id=\"telefoneContato\" data-bvalidator=\"required\" name=\"usuario.telefoneContato\" class=\"form-control\">\r\n");
      out.write("\t\t                    </div>\r\n");
      out.write("\t\t                    <div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t                        <label>Telefone Comercial</label>\r\n");
      out.write("\t\t                        <input type=\"text\" id=\"telefoneComercial\" name=\"usuario.telefoneComercial\" class=\"form-control\">\r\n");
      out.write("\t\t                    </div>\r\n");
      out.write("\t\t                    <div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t                        <label>Telefone Residencial</label>\r\n");
      out.write("\t\t                        <input type=\"text\" id=\"telefoneResidencial\" name=\"usuario.telefoneResidencial\" class=\"form-control\">\r\n");
      out.write("\t\t                    </div>\r\n");
      out.write("\t\t                </div>\r\n");
      out.write("\t\t                <div class=\"row\">\r\n");
      out.write("                \t\t\t<div class=\"form-group col-lg-3\">\r\n");
      out.write("\t\t                        <label>Tipo do Perfil</label>\r\n");
      out.write("\t\t                         <select class=\"form-control\" name=\"tipoPerfil\" data-rel=\"chosen\">\r\n");
      out.write("\t\t                         \t<option value=\"\">Selecione</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"freelancer\">Freelancer</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<option value=\"contratante\">Contratante</option>\r\n");
      out.write("\t\t                         </select>\r\n");
      out.write("\t\t                    </div>\r\n");
      out.write("\t\t                </div>\r\n");
      out.write("\t                 \t<div class=\"row\">\r\n");
      out.write("                \t\t\t<div class=\"form-group col-lg-3\">\r\n");
      out.write("                \t\t\t\t<label id=\"mensagem\" class=\"textoAdvertencia\"></label>\r\n");
      out.write("                \t\t\t</div>\r\n");
      out.write("                \t\t</div>\r\n");
      out.write("\t\t        \t\t<br/>\r\n");
      out.write("\t\t                \r\n");
      out.write("\t\t                <div class=\"row\" style=\"text-align: center;\">\r\n");
      out.write("\t\t                \t<button type=\"reset\" class=\"btn btn-default\">Limpar</button>\r\n");
      out.write("\t\t                    <button type=\"submit\" class=\"btn btn-default\">Cadastrar</button>\t                   \t\r\n");
      out.write("\t\t                </div>\t                \r\n");
      out.write("\t\r\n");
      out.write("\t\t            </div>\r\n");
      out.write("          \t\t</form>\r\n");
      out.write("\t        </div>\r\n");
      out.write("\t    </div>\r\n");
      out.write("\t    \r\n");
      out.write("\t</body>\r\n");
      out.write("</html>\r\n");
      out.write("\t\t\r\n");
      out.write("    ");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005furl_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f0 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f0.setParent(null);
    // /WEB-INF/jsp/index/cadastro.jsp(9,38) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f0.setValue("/js/charisma.js");
    int _jspx_eval_c_005furl_005f0 = _jspx_th_c_005furl_005f0.doStartTag();
    if (_jspx_th_c_005furl_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005furl_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f1 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f1.setParent(null);
    // /WEB-INF/jsp/index/cadastro.jsp(10,38) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f1.setValue("/js/chosen.min.js");
    int _jspx_eval_c_005furl_005f1 = _jspx_th_c_005furl_005f1.doStartTag();
    if (_jspx_th_c_005furl_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f1);
    return false;
  }

  private boolean _jspx_meth_f_005fmessage_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  f:message
    org.apache.taglibs.standard.tag.rt.fmt.MessageTag _jspx_th_f_005fmessage_005f0 = (org.apache.taglibs.standard.tag.rt.fmt.MessageTag) _005fjspx_005ftagPool_005ff_005fmessage_0026_005fkey_005fnobody.get(org.apache.taglibs.standard.tag.rt.fmt.MessageTag.class);
    _jspx_th_f_005fmessage_005f0.setPageContext(_jspx_page_context);
    _jspx_th_f_005fmessage_005f0.setParent(null);
    // /WEB-INF/jsp/index/cadastro.jsp(16,98) name = key type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_f_005fmessage_005f0.setKey("campo.obrigatorio");
    int _jspx_eval_f_005fmessage_005f0 = _jspx_th_f_005fmessage_005f0.doStartTag();
    if (_jspx_th_f_005fmessage_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005ff_005fmessage_0026_005fkey_005fnobody.reuse(_jspx_th_f_005fmessage_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005ff_005fmessage_0026_005fkey_005fnobody.reuse(_jspx_th_f_005fmessage_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005furl_005f2(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f2 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f2.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f2.setParent(null);
    // /WEB-INF/jsp/index/cadastro.jsp(67,13) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f2.setValue("/usuario/validarEmail");
    int _jspx_eval_c_005furl_005f2 = _jspx_th_c_005furl_005f2.doStartTag();
    if (_jspx_th_c_005furl_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f2);
    return false;
  }

  private boolean _jspx_meth_c_005furl_005f3(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f3 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f3.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f3.setParent(null);
    // /WEB-INF/jsp/index/cadastro.jsp(89,14) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f3.setValue("/usuario/validarEmail");
    int _jspx_eval_c_005furl_005f3 = _jspx_th_c_005furl_005f3.doStartTag();
    if (_jspx_th_c_005furl_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f3);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f3);
    return false;
  }

  private boolean _jspx_meth_c_005furl_005f4(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f4 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f4.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f4.setParent(null);
    // /WEB-INF/jsp/index/cadastro.jsp(98,19) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f4.setValue("/cadastrar/usuario");
    int _jspx_eval_c_005furl_005f4 = _jspx_th_c_005furl_005f4.doStartTag();
    if (_jspx_th_c_005furl_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f4);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f4);
    return false;
  }

  private boolean _jspx_meth_c_005furl_005f5(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f5 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f5.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f5.setParent(null);
    // /WEB-INF/jsp/index/cadastro.jsp(101,35) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f5.setValue("/principal");
    int _jspx_eval_c_005furl_005f5 = _jspx_th_c_005furl_005f5.doStartTag();
    if (_jspx_th_c_005furl_005f5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f5);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f5);
    return false;
  }
}