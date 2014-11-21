package site.dao;

import generic.dao.Dao;

import org.hibernate.Session;

import site.bean.Juridico;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class DaoJuridico extends Dao<Juridico> {

	public DaoJuridico(Session session) {
		super(session, Juridico.class);
	}
}