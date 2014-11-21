package site.controller;

import generic.annotation.LogonRequired;
import generic.component.Blowfish;
import generic.component.UserSession;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

import site.bean.Usuario;
import site.dao.DaoHabilidades;
import site.dao.DaoUsuario;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.Localization;

@LogonRequired
@Resource
public class SiteController {

	private final Localization localization;
	private final DaoHabilidades daoHabilidades;
	private final DaoUsuario daoUsuario;
	private final Result result;
	private final UserSession userSession;

	public SiteController (Blowfish blowfish, Localization localization,DaoHabilidades daoHabilidades,DaoUsuario daoUsuario, Result result, UserSession userSession) {
		this.localization = localization;
		this.daoHabilidades = daoHabilidades;
		this.daoUsuario = daoUsuario;
		this.result = result;
		this.userSession = userSession;
	}
	
	@Path("/principal")
	public void principal(Boolean menuServicos) {
		Calendar dataAtual = new GregorianCalendar(TimeZone.getTimeZone("GMT-3"), new Locale("pt","BR"));
		
		Integer hora = dataAtual.get(Calendar.HOUR_OF_DAY);
		String saudacao = (hora >= 0 && hora <= 12) ? "saudacao.manha" : (hora >= 12) && (hora < 18) ? "saudacao.tarde"	: (hora >= 18) && (hora < 24) ? "saudacao.noite" : "saudacao.manha";
		
		if(menuServicos != null)
			result.include("menuServicos", menuServicos);
		
		result.include("userSession", userSession);
		result.include("saudacao", this.localization.getMessage(saudacao, this.userSession.getUsuario().getNomeVisualizacao()));
	}
	
	@Path("/conteudoPrincipal")
	public void conteudoPrincipal() {
		Usuario usuario = daoUsuario.buscar(userSession.getUsuario().getId());
		
		if(usuario.getFreelancerTrue()){
			
			if(usuario.getFreelancer().getAtividades() != null)
				result.include("informacoesPreenchidas", true);
			else
				result.include("informacoesPreenchidas", false);
			
			result.include("freelancerTrue", true);

			result.include("habilidadeList", daoHabilidades.listarTudo("descricao", "ASC"));
		} else {
			
			if(usuario.getContratante().getAtividades() != null)
				result.include("informacoesPreenchidas", true);
			else
				result.include("informacoesPreenchidas", false);
			
			result.include("tipo", "contratante");
		}		
		
		result.include("caminhoImagem", "/imagens/" + userSession.getUsuario().getEmail() + "/perfil");
		result.include("usuario", usuario);
	}	
}