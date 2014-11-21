package site.dao;

import generic.dao.Dao;

import org.hibernate.Session;

import site.bean.Contratante;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class DaoContratante extends Dao<Contratante> {

	public DaoContratante(Session session) {
		super(session, Contratante.class);
	}
}