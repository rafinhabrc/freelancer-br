package site.controller;

import generic.component.Blowfish;
import generic.component.UserSession;
import site.bean.Usuario;
import site.dao.DaoUsuario;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class LogonController {

	private final DaoUsuario daoUsuario;
	private final Blowfish blowfish;
	private final Result result;
	private final UserSession userSession;

	public LogonController(DaoUsuario daoUsuario, Blowfish blowfish, Result result, UserSession userSession) {
		this.daoUsuario = daoUsuario;
		this.blowfish = blowfish;
		this.result = result;
		this.userSession = userSession;
	}

	@Post
	@Path("/logon")
	public void logon(String email, String password) {
		Usuario usuario = daoUsuario.buscarPorEmail(email);
		
		if (usuario == null) {
			result.include("mensagem", "logon.email.invalido");
			result.redirectTo(IndexController.class).index();
		} else {
			if (blowfish.decryptString(usuario.getPassword()).equals(password)) {
				userSession.logon(usuario);
				
				result.redirectTo(SiteController.class).principal(false);
			} else {
				result.include("mensagem", "logon.senha.incorreta");
				result.redirectTo(IndexController.class).index();
			}
		}
	}

	@Get
	@Path("/logout")
	public void logout() {
		userSession.logout();

		result.include("mensagem", "logout.agradecimento");
		result.redirectTo(IndexController.class).index();
	}

}