package generic.component;

import java.util.Collection;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class ListSession {

	private Collection<?> lista;

	public Collection<?> getLista() {
		return lista;
	}

	public void setLista(Collection<?> lista) {
		this.lista = lista;
	}

}