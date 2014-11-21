package site.dao;

import generic.dao.Dao;

import org.hibernate.Session;

import site.bean.Fisico;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class DaoFisico extends Dao<Fisico> {

	public DaoFisico(Session session) {
		super(session, Fisico.class);
	}
}