package site.controller;

import generic.component.UserSession;
import site.dao.DaoServicosCategoria;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class IndexController {

	private final DaoServicosCategoria daoServicosCategoria;
	private final UserSession userSession;
	private final Result result;

	public IndexController(DaoServicosCategoria daoServicosCategoria, UserSession userSession, Result result) {
		this.daoServicosCategoria = daoServicosCategoria;
		this.userSession = userSession;
		this.result = result;
	}

	@Path(value = "/", priority=Path.HIGH)
	public void index() {
		if (userSession.isLogged()) {
			result.redirectTo(SiteController.class).principal(false);
		}
	}
	
	@Path("/login")
	public void login() {
	}
	
	@Path("/usuario/cadastrar")
	public void formUsuario() {
	}
	
	@Path("/paginaLogin")
	public void paginaLogin() {
	}
	
	@Path("/pesquisar")
	public void listaServicos(String categoria, String filtro) {
		if(categoria != null)
			result.include("servicoCategoriaList", daoServicosCategoria.buscarPorCategoria(categoria));
		else if (filtro != null)
			result.include("servicoCategoriaList", daoServicosCategoria.buscarPorFiltro(filtro));
	}
	
	@Path("/pagina/nao/encontrada")
	public void paginaNaoEncontrada(StringBuffer url) {
		result.include("url", url);
	}
}