package site.dao;

import generic.dao.Dao;

import org.hibernate.Session;

import site.bean.Categoria;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class DaoCategoria extends Dao<Categoria> {

	public DaoCategoria(Session session) {
		super(session, Categoria.class);
	}
}