package site.dao;

import generic.dao.Dao;

import org.hibernate.Session;

import site.bean.Freelancer;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class DaoFreelancer extends Dao<Freelancer> {

	public DaoFreelancer(Session session) {
		super(session, Freelancer.class);
	}
}