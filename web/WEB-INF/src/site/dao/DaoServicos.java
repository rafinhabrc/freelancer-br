package site.dao;

import generic.dao.Dao;

import org.hibernate.Session;

import site.bean.Servicos;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class DaoServicos extends Dao<Servicos> {

	public DaoServicos(Session session) {
		super(session, Servicos.class);
	}
}