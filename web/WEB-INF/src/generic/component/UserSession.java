package generic.component;

import site.bean.Usuario;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class UserSession {

	private Usuario usuario;

	public boolean isLogged() {
		return this.usuario != null;
	}

	public void logon(Usuario usuario) {
		this.usuario = usuario;
	}

	public void logout() {
		this.usuario = null;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

}