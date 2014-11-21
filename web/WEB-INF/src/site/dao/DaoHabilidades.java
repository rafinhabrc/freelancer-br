package site.dao;

import generic.dao.Dao;

import org.hibernate.Session;

import site.bean.Habilidades;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class DaoHabilidades extends Dao<Habilidades> {

	public DaoHabilidades(Session session) {
		super(session, Habilidades.class);
	}
}